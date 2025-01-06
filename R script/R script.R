# Load required libraries
if (!require(dplyr)) install.packages("dplyr")
if (!require(ggplot2)) install.packages("ggplot2")

library(dplyr)
library(ggplot2)

# Load the dataset
dataset <- read.csv("melb_data.csv")

# Inspect the dataset
str(dataset)
head(dataset)

# Filter relevant columns: "Suburb" and "Method" (assuming auction = "S")
selected_data <- dataset %>% select(Suburb, Method)

# Check unique values in "Method" to understand sale methods
unique(selected_data$Method)

# Filter rows where the method indicates an auction ("S" = sold at auction)
selected_data <- selected_data %>%
  filter(Method == "S") %>%
  group_by(Suburb) %>%
  summarize(Auction_Count = n())

# Join with total sales per suburb
total_sales <- dataset %>%
  group_by(Suburb) %>%
  summarize(Total_Sales = n())

# Merge auction counts with total sales
merged_data <- left_join(selected_data, total_sales, by = "Suburb")

# Calculate proportion of auctions for each suburb
merged_data <- merged_data %>%
  mutate(Proportion_Auction = Auction_Count / Total_Sales)

# Display summary table
print(merged_data)
# Perform chi-squared test
chisq_test_data <- dataset %>%
  filter(Method %in% c("S", "PI", "SP")) %>%
  count(Suburb, Method) %>%
  spread(Method, n, fill = 0)

# Convert to matrix format
chi_matrix <- chisq_test_data %>% select(-Suburb) %>% as.matrix()
chi_test_result <- chisq.test(chi_matrix)

# Print chi-squared test result
print(chi_test_result)

# Stacked bar plot
auction_plot <- dataset %>%
  filter(Method %in% c("S", "PI", "SP")) %>%
  ggplot(aes(x = Suburb, fill = Method)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion of Properties Sold by Method across Suburbs",
    x = "Suburb",
    y = "Proportion",
    fill = "Sale Method"
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(auction_plot)
