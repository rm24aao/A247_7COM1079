# Install the tidyr package if it's missing
install.packages("tidyr")

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the dataset
data <- read.csv("melb_data.csv")

# Filter data for relevant columns and auction methods
filtered_data <- data %>%
  filter(Method %in% c('S', 'SP', 'PI'))

# Group data by Suburb and Method
grouped_data <- filtered_data %>%
  count(Suburb, Method) %>%
  pivot_wider(names_from = Method, values_from = n, values_fill = list(n = 0))

# Sort by total sales in descending order and select the top 20 suburbs
top_suburbs <- grouped_data %>%
  mutate(Total = rowSums(grouped_data[, -1])) %>%
  arrange(desc(Total)) %>%
  head(20) %>%
  select(-Total)

# Create a stacked bar plot
ggplot(top_suburbs, aes(x = Suburb)) +
  geom_bar(aes(y = `S`, fill = "Sold at Auction (S)"), stat = "identity", position = "stack", color = "black") +
  geom_bar(aes(y = `SP`, fill = "Sold Prior (SP)"), stat = "identity", position = "stack", color = "black") +
  geom_bar(aes(y = `PI`, fill = "Passed In (PI)"), stat = "identity", position = "stack", color = "black") +
  scale_fill_manual(values = c("Sold at Auction (S)" = "#4CAF50", 
                               "Sold Prior (SP)" = "#FFC107", 
                               "Passed In (PI)" = "#2196F3")) +
  labs(title = "Auction vs. Other Sale Methods in Top 20 Suburbs", 
       x = "Suburb", 
       y = "Number of Properties Sold", 
       fill = "Sale Method") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
        axis.text.y = element_text(size = 10),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 10)) +
  theme_minimal()

# Save the plot as an image file
ggsave("stacked_bar_plot.png", dpi = 300)

