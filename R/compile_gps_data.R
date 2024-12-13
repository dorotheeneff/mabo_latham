#' compile_gps_data
#' 
#' This script will read and compile GPS data for each individual bird tracked 
#' by catlog or pathtrack devices. The compiled file will be stored in `output/`.
#'
#' @param specie (mabo, brno, sote) the specie of bird that was tracked (to update)
#' @param site (latham, other) study site (to update)
#' @param device (catlog, pathtrack) the device used to collect data
#'
#' @return the path to the downloaded file
#' @export

compile_gps_data <- function(specie, site, device) {
  
  ## Inform about the data being read
  message("# ---- Reading data for device: ", device)
  
  ## Gather all raw data files under one object
  fichier <- base::list.files("data/raw_data/", pattern = "*.csv")
  
  ## Read all data and compile
  total <- NULL
  for (i in 1:length(fichier)) {
    dat = utils::read.table(base::paste0("data/raw_data/",fichier[i]), 
                            header = TRUE, 
                            sep = ",", 
                            skip = 6)
    
    total = base::rbind(total, dat)
  }
  
  ## File configuration ----
  filename <- base::paste0(specie,"_", site, "_", device, ".csv")
  
  ## Destination ---- 
  base::dir.create("output/fulldata")
  dest_dir  <- "output/fulldata"
  dest_path <- base::file.path(dest_dir, filename)
  
  ## Save file ----
  write.table(total, file = dest_path, sep = ",", row.names = F)
  
  return(dest_path)
  
}
