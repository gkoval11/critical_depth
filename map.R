#install necessary libraries
library(leaflet)
library(tidyverse)

#create a leaflet map centered on weather ship M with label
m <- leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  setView(lng = 2, lat = 66, zoom = 3) %>% 
  addMarkers(lng = 2, lat = 66, popup = "Weather Ship 'M'\n (66°N., 2°E.)")
m

#Source: Sverdrup HU (1953) On conditions for the vernal blooming of phytoplankton. J Cons Int Explor Mer 18:287-295