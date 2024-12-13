############################################################
# Project : mabo_latham
#
# make.R
#
# All functions used in the script have been developed for this project
# and can be found in the folder R/.
#
# Dorothee NEFF <dorothee.neff@univ-reunion.fr>
#
############################################################

## Create directories ----
reps <- c("data", "R", "output")
lapply(reps, dir.create, showWarnings = FALSE)

## Install the project dependencies listed in DESCRIPTION ----
devtools::install_deps()

## Load the project functions ----
devtools::load_all()

## Compile GPS data and create a unique file
compile_gps_data("mabo", "latham", "catlog")

## Make a first map
