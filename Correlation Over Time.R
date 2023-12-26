library(readxl)
BikeShareDemand <- read_excel("C:/Users/shall/Documents/MMA/Business Statistics/Assignment 1/BikeShareDemand.xlsx")
View(BikeShareDemand)

library(readr)
library(dplyr)
library(ggplot2)
library(kableExtra)


# Correlation between Temp and Rent

correlation_by_month <- BikeShareDemand %>%
  group_by(month) %>%
  summarise(correlation = cor(temperature, rental))

# Create the line plot
ggplot(correlation_by_month, aes(x = month, y = correlation)) +
  geom_line() +
  geom_point(color = "red", size = 2) +
  labs(
    x = "Months",
    y = "R-value",
    title = "Correlation of Temperature and Rental Over Time"
  ) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        axis.text.x = element_blank())


# Create a summary table with counts by weather condition
summary_table <- BikeShareDemand %>%
  group_by(month) %>%
  summarise(Total_Count = n())
summary_table

# Rename columns "weather" to "Weather" and "Count" to "Total_Count"
summary_table <- summary_table %>%
  rename(Month = month, Count = Total_Count)

# Create the table with kableExtra
table_visual <- summary_table %>%
  kable("html") %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE)

# Display the table
table_visual

