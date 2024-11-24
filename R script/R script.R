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
   # Histogram for Rooms
   hist(dataset$Rooms,
        main = "Histogram of Number of Rooms",
        xlab = "Number of Rooms",
        ylab = "Frequency",
        col = "lightgreen",  # Color of the bars
        border = "white",    # Bar border color
        breaks = seq(0.5, 10.5, by = 1)) # Ensures each room number gets its own bin
   
   # Adding gridlines for better readability
   grid(nx = NA, ny = NULL, col = "gray", lty = "dotted", lwd = 1)
   
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
   # Histogram for Rooms
   hist(dataset$Rooms,
        main = "Histogram of Number of Rooms",
        xlab = "Number of Rooms",
        ylab = "Frequency",
        col = "lightgreen",  # Color of the bars
        border = "white",    # Bar border color
        breaks = seq(0.5, 10.5, by = 1)) # Ensures each room number gets its own bin
   
   # Adding gridlines for better readability
   grid(nx = NA, ny = NULL, col = "gray", lty = "dotted", lwd = 1)
   
   # Create the histogram for Price
   hist_price <- hist(dataset$Price,
                      main = "Histogram of Property Prices with Trend Line",
                      xlab = "Price (in AUD Millions)",
                      ylab = "Frequency",
                      col = "lightgreen",  # Color of the bars
                      border = "white",    # Bar border color
                      breaks = 30,         # Number of bins
                      freq = TRUE)         # Use frequency for y-axis
   
   # Calculate density for the "Price" variable
   price_density <- density(dataset$Price, adjust = 1.5)
   
   # Scale the density curve to match the histogram height
   scale_factor <- max(hist_price$counts) / max(price_density$y)
   lines(price_density$x, price_density$y * scale_factor, 
         col = "blue", 
         lwd = 2)  # Add the trend line
   
   # Add gridlines for better readability
   grid(nx = NA, ny = NULL, col = "gray", lty = "dotted", lwd = 1)
   
   
   