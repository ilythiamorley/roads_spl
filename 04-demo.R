## ----warning=FALSE,message=FALSE-----------------------------------------------------------------------------
#--- load in required libraries ---#
library(lidR)
library(sf)
library(MFFProads)
library(dplyr)
library(leaflet)

#--- read in laz and road shapefile ---#
ctg <- readLAScatalog("F:/_2021_MFPProads/RMF/RMF_roads_SPL/tst/split")
shp <- st_read("F:/_2021_MFPProads/RMF/RMF_roads_SPL/tst/roads_.shp",quiet=TRUE)

mapview::mapview(list(ctg,shp), layer.name = c("catalog","roads"),
                 color = "red", map.type = "Esri.WorldImagery")



## ------------------------------------------------------------------------------------------------------------
#--- test on single road ---#
roadx <- shp %>%
  dplyr::filter(OBJECTID == 29976)



## ---- echo = FALSE-------------------------------------------------------------------------------------------
m2 <- mapview::mapview(list(ctg,roadx), layer.name = c("catalog","road"),
                 color = "red", map.type = "Esri.WorldImagery")

coords <- c(-81.89471,
            47.93648)

m2@map %>% setView(coords[1], coords[2], zoom = 17)



## ----eval=FALSE----------------------------------------------------------------------------------------------
## #--- find the roads ---#
## res1 <- measure_road(roadx, ctg, mffproads_default_parameters, relocate = TRUE)

