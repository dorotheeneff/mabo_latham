#' map_raw_data
#' 
#' This script will map raw GPS data for each individual bird tracked 
#' by catlog or pathtrack devices. The map will be stored in `output/maps/`.
#'
#' @param specie (mabo, brno, sote) the specie of bird that was tracked (to update)
#' @param site (latham, other) study site (to update)
#' @param device (catlog, pathtrack) the device used to collect data
#'
#' @return the path to the downloaded file
#' @export

map_raw_data <- function(specie, site, device) {
  
  ## Read dataset
  filename <- base::paste0(specie, "_", site, "_", device, ".csv")
  data <- utils::read.table(base::paste0("output/fulldata/", filename),
                            header = T,
                            sep = ",")
  
  ## Create a map
  map <- ggplot(data, aes(x = Longitude, y = Latitude, color = "Date")) + 
    geom_point() +
    labs(title = paste("GPS data map for", specie, "at", site),
         x = "Longitude",
         y = "Latitude") +
    theme_minimal()
  
  ## Save the map
  base::dir.create("output/maps")
  output_dir <- "output/maps"
  map_path <- base::paste0(output_dir, "/", specie, "_", site, "_", device, "_map.png")
  ggsave(map_path, map, width = 8, height = 6)
  
  message("Map saved at: ", map_path)
  
  ## Return the map path
  return(map_path)
}

# Testing github connection