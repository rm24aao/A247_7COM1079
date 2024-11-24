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
   
   
   
   dataset <- read.csv("melb_data.csv")
   
   
   plot(dataset$Rooms, dataset$Price,
        main = "Scatterplot of Number of Rooms vs. Price",
        xlab = "Number of Rooms",
        ylab = "Price (in AUD Millions)",
        pch = 19,          
        col = rgb(0, 0, 1, 0.5), 
        xlim = c(1, 10),   
        xaxt = "n",        
        yaxt = "n")       
   
   
   grid()
   
   
   axis(1, at = 1:10, labels = 1:10)
   
   
   max_price <- max(dataset$Price, na.rm = TRUE)
   y_ticks <- seq(0, max_price, by = 1e6)  
   axis(2, at = y_ticks, labels = y_ticks / 1e6, las = 2)  
   
   