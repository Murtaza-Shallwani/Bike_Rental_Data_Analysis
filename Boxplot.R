# Load the ggplot2 library
library(ggplot2)
library(stringr)
install.packages("stringr")


BikeShareDemand$season <- str_to_title(BikeShareDemand$season)

# Calculate average rent by season
avg_rent_by_season <- aggregate(rental ~ season, data = BikeShareDemand, FUN = mean)
mode_rent_by_season <- aggregate(rental ~ season, data = BikeShareDemand, FUN = mode)

# Create a boxplot
ggplot(BikeShareDemand, aes(x = season, y = rental, fill = season)) +
  geom_boxplot() +
  labs(title = "Average Rent per Season", fontface = "bold") +
  geom_text(data = avg_rent_by_season, aes(x = season, y = rental, label = paste0("$", round(rental, 2))), vjust = -0.5, fontface = "bold") +
  theme_minimal() +
  theme(
        panel.grid.major = element_blank(),
        axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "none")
        
