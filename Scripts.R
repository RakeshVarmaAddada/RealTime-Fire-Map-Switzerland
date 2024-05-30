library(httr)
library(dplyr)

# Define the start and end dates
start_date <- as.Date("2024-01-01")
end_date <- Sys.Date()
day_range <- 10 # Fetch data in 10-day chunks

# Your FIRMS Map Key
map_key <- "9cb3a40e8ac8aa7251f47841b26985d7"

# Initialize an empty dataframe to store the results
all_fire_data <- data.frame()

# Loop through the date range
current_date <- start_date
while (current_date < end_date) {
  # Construct the URL for the current chunk
  url <- sprintf("https://firms.modaps.eosdis.nasa.gov/api/country/csv/%s/VIIRS_SNPP_NRT/CHE/%d/%s",
                 map_key, day_range, current_date)
  
  # Make the GET request
  response <- GET(url)
  
  # Check if the request was successful
  if (status_code(response) == 200) {
    # Parse the CSV data
    chunk_data <- read.csv(text = content(response, "text"))
    
    # Append the chunk data to the main dataframe
    all_fire_data <- bind_rows(all_fire_data, chunk_data)
  } else {
    print(paste("Failed to fetch data for date:", current_date, "Status code:", status_code(response)))
  }
  
  # Move to the next chunk
  current_date <- current_date + day_range
}

# Print the resulting dataframe
print(all_fire_data)

# Save the data to a CSV file
write.csv(all_fire_data, "fire_data_2024.csv", row.names = FALSE)

