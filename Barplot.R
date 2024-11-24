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

ggplot(melb_list, aes(x = factor(rooms), y = price, fill = factor(rooms))) + 
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(
    title = "Average Price by Number of Rooms",
    x = "Number of Rooms",
    y = "Average Price",
    fill = "Room Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1))

