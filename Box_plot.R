melb_data <- read.csv("melb_data.csv")

suburb_list <-melb_data$Suburb

rooms_list <-melb_data$Rooms

price_list <-melb_data$Price

landsize_list <- melb_data$Landsize

melb_list <- data.frame(
  surb <- suburb_list,
  rooms <- rooms_list,
  price <- price_list,
  landsize <- landsize_list
)

library(ggplot2)

ggplot(melb_data, aes(x = factor(Rooms), y = Price, fill = factor(Rooms))) +
  geom_boxplot(outlier.colour = "red", outlier.size = 2, alpha = 0.5) +
  labs(
    title = "Box Plot of Price by Number of Rooms",
    x = "Number of Rooms",
    y = "Price"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_text(angle = 0, hjust = 1)
  )

