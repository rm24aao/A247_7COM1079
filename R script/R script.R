selected_columns <- dataset[, c("Suburb", "Address", "Rooms", "Type", "Price")]
head(selected_columns)  # Display the first few rows

# Load the dataset
 dataset <- read.csv("melb_data.csv")
 
   # Scatterplot of Rooms vs. Price
   plot(dataset$Rooms, dataset$Price,
               main = "Scatterplot of Number of Rooms vs. Price",
               xlab = "Number of Rooms",
               ylab = "Price (AUD)",
               pch = 19,        # Solid circles
               col = rgb(0, 0, 1, 0.5)) # Blue with transparency

  # Adding gridlines
   grid()
   
   