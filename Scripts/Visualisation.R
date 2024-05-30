# Load the libraries
library(ggplot2)
library(leaflet)

# Time Series Plot of Total Fire Detections
ggplot(summary_stats, aes(x = acq_date, y = total_fires)) +
  geom_line() +
  labs(title = "Total Fire Detections Over Time", x = "Date", y = "Total Fires")

# Histogram of Fire Intensities
ggplot(all_fire_data, aes(x = bright_ti4)) +
  geom_histogram(binwidth = 10, fill = "orange", color = "black") +
  labs(title = "Distribution of Fire Intensities", x = "Brightness Temperature (K)", y = "Count")

# Interactive Map of Fire Detections
leaflet(data = all_fire_data) %>%
  addTiles() %>%
  addCircleMarkers(~longitude, ~latitude, 
                   color = ~ifelse(daynight == "D", "red", "black"), 
                   popup = ~paste("Date:", acq_date, "<br>", "Brightness:", bright_ti4),
                   radius = 3) %>%
  addLegend(position = "bottomright", 
            colors = c("red", "black"), 
            labels = c("Day", "Night"),
            title = "Detection Time")
