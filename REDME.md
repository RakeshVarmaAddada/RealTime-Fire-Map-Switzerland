---
title: "Fire Detection Data Analysis and Visualization Capstone Report"
author: "Rakesh Varma Addada"
output: html_document
---

# Introduction

This extensive study summarizes the efforts made to analyze and illustrate fire detection data, specifically from Switzerland. The ultimate goal was to create a sophisticated tool that improves understanding of when and where fires are likely to occur, which would aid in the development of fire prevention and control measures. Given the growing importance of environmental safety and resource management, this project sought to use modern data analytic techniques to deliver actionable insights that could help prepare and minimize fire-related disasters.

# Project Goals and Objectives

To accomplish its main goal, the project was organized around multiple crucial goals:

1. Gather Information: To obtain comprehensive fire detection records, obtain a dependable and prompt dataset from NASA's Fire Information for Resource Management System (FIRMS).
2. Process Data: To prepare the dataset for in-depth analysis, apply strict data organization and cleaning procedures.
3. Visualize Data: To produce understandable and instructive graphical representations of the data, use sophisticated visualization tools.
4. Create a Shiny App: Provide an interactive application that enables users to dynamically explore various fire data representations.
5. Improve Usability: To optimize the application's usefulness, make sure it is simple to use and available to all users, regardless of their level of technical expertise.

# Data Collection

## Retrieving Data Through FIRMS API

1. **Setting up the API**: To access the FIRMS data, I first subscribed for an API key from NASA. This key guaranteed adherence to NASA's usage guidelines and permits authenticated requests to its data systems.
2. **Defining Parameters**: To customize data retrieve requests, the API needs to know certain parameters. The geographic boundaries of Switzerland were the main emphasis of the project's parameters. To make sure the data retrieved was only relevant to the project's geographic importance, this required defining the latitude and longitude coordinates that define Switzerland's region.
3. **Automated Data Fetching**: Using the R package 'httr', I wrote scripts to automate the process of sending requests to the API. These scripts were designed to handle the API's rate limits and ensure that data was fetched efficiently without exceeding the allowed number of requests per time. This automation was crucial for maintaining a steady flow of data and for accommodating updates to the dataset as new fire detections occurred.

4. **Handling API Responses**: The data returned from FIRMS is in JSON format, which includes detailed information about each fire event, such as the date and time of detection, the satellite that detected the fire, the brightness temperature of the fire (which indicates its intensity), and other vital attributes. I used the 'jsonlite' package in R to parse these JSON responses into a structured format that could be easily manipulated and analyzed.

# Methodology and Tools

The project employed a methodical approach, supported by various R packages, each chosen for its specific functionality: 

## Data Retrieval Automation

The for loop was designed to iterate over a series of dates, sending a request to the FIRMS API for each date. Here's a simplified breakdown of how the loop functioned:

- **Date Range Definition**: The loop started with defining the start and end dates for the data retrieval. This range was typically set to cover the period from the beginning of the fire season or the year until the current date of data fetching.
- **Daily Requests**: The script created a request for every day in the given date range while it was in a loop. To match each day in the loop, the date parameter in the API request URL must be dynamically changed.
- **Data Fetching and Parsing**: The script retrieved the data from the API for every iteration, used the jsonlite package to parse the JSON response, and then formatted the data into a structured format appropriate for analysis.
- **Data Storage**: To guarantee that all obtained data was assembled into a single, accessible format, the data for each day was written into a fire_data_2024.csv file.
- **Error Handling**: To address problems like unsuccessful API queries or data parsing difficulties, the loop incorporated error handling techniques. This made guaranteed that even if some requests were not successful, the loop would keep going.

## Data Retrieval

Data relevant to Switzerland's geographic boundaries were emphasized in the automated contacts with NASA's API made possible by the `httr` package.

## Data Cleaning

The project addressed problems including missing values and outliers, which could distort analysis, by using `dplyr` from the tidyverse suite. To convert the raw data into a clear, analyzable format, this step was essential.

## Data Visualization

- **ggplot2**: This package was essential in producing time series plots and histograms, among other static visualizations. It made it possible to produce excellent, print-ready images that effectively conveyed the underlying data trends.

- **leaflet**: A dynamic geographical overview of fire occurrences was provided by the `leaflet` package for interactive visualizations, especially maps. This tool was essential in helping to depict the frequency and spatial distribution of flames throughout the area.

## Shiny Application Development

The interactive web application was developed using the `shiny` package as a foundation. It enabled real-time user engagement and data exploration by smoothly integrating the different visualizations into a user-friendly interface.

# Key Findings

Several important conclusions were made clear by the visualizations created from the analyzed data:

- **Seasonal Trends**: The time series analysis revealed notable rises in the number of fire incidents in the spring, especially in April and May. This finding suggests that there may be a seasonal component to fire events, necessitating greater attention to detail and resource allocation in these months.

- **Consistency in Fire Intensity**: Most observed fires clustered inside a particular brightness temperature range, according to the fire intensities histogram. This uniformity raises the possibility that most fire events might gain from a systematic approach.

- **Geographic Distribution**: Notable hotspots were displayed on interactive maps. In areas where fires are most likely to occur, this spatial data is essential for planning firefighting resources and directing fire prevention efforts.

# Shiny Application

The project's Shiny application serves as an example of the effectiveness of interactive data visualization. It consists of:

1. **Dynamic Selection Tools**: By choosing different representations, like heat maps or line graphs, and modifying time frames or other factors, users can change how they see the data.

2. **Interactive Map**: This tool provides an intuitive knowledge of spatial patterns by enabling users to locate specific fire spots on a map.

3. **User-Friendly Design**: The app's design places a strong emphasis on minimalism to make it accessible and simple to use for a wide range of users.

## How to Use the Application

- **Go to your local machine's Shiny app directory**.
- **Execute the following command in R**: `runApp("path/to/shiny_app")`

# Challenges and Solutions

The project encountered several difficulties, all of which were carefully resolved:

- **Commit Problems**: Errors in conflicts during merges were among the frequent problems that occurred during code commits. These were resolved by streamlining our Git process and occasionally using GitHub's manual updates to guarantee the project repository's continuity and integrity.

- **User design**: Creating a user-friendly design had its own set of difficulties, especially when it came to making sure non-technical people could utilize the app. User testing and numerous design changes helped overcome this, simplifying the interface and enhancing the overall user experience.

# Conclusion

The importance of data-driven analytics in improving fire management tactics is demonstrated by this capstone project. The project offers a practical solution in the form of an interactive application, in addition to deep insights into fire trends using advanced data processing and visualization technologies. Emergency response coordinators, legislators, and the public can all benefit from this technology, which helps with the prompt and efficient handling of fire emergencies. The project's scope could be expanded in the future to include predictive modeling based on historical data, which could provide projections and risk assessments to help with planning and response strategies.

# References

[FIRMS Web Services](https://firms.modaps.eosdis.nasa.gov/web-services/)


