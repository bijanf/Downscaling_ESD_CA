
#library(devtools)
##install.packages("textshaping")
###install.packages("devtools", dependencies  = TRUE)
###devtools::install_github("r-lib/devtools")
##devtools::install_github("metno/esd")
library(esd)
library(ncdf4)
##install.packages("fields")
library(fields)
model <- "CNRM-CM6-1"
scenario <- "ssp245"
var <- "tas"
period <- "2021-2040"
##devtools::install_github(c("SantanderMetGroup/loadeR.java", "SantanderMetGroup/climate4R.UDG", "SantanderMetGroup/loadeR"))
##devtools::install_github(c("SantanderMetGroup/downscaleR"))
##devtools::install_github(c("SantanderMetGroup/transformeR", "SantanderMetGroup/visualizeR"))
##devtools::install_github("pacificclimate/climdex.pcic")
##devtools::install_github(c("SantanderMetGroup/climate4R.climdex"))
##devtools::install_github("SantanderMetGroup/climate4R.UDG")
library(loadeR)
library(transformeR)
library(visualizeR)
library(downscaleR)
library(climate4R.climdex)
#print(UDG.datasets(full.info = TRUE))
datas <- UDG.datasets(pattern = "CMIP6*_MPI-ESM1-2-HR_ssp585_r1i1p1f1")
print(datas)
lon <- c(43,90); lat <- c(30,60); seas <- 1:12
obs.tx <- loadGridData(datas, var = "tasmax",
                       years = 2070:2071, season = seas,
                       lonLim = lon, latLim = lat)
#library(climate4R.)
#files <- cmip6(node = "esgf-data.dkrz.de", frequency = "mon", experiment = scenario, model = model, ensemble = "r1i1p1f2", variable = var, outdir = "data")
obs.SU <- climdexGrid(tx = obs.tx, index.code = "SU")
library(RColorBrewer)
colSU <- rev(brewer.pal(n = 9, "RdYlBu"))
coldelta <- brewer.pal(n = 9, "Reds")
colbias <- brewer.pal(n = 9, "PiYG")
coltx <- rev(brewer.pal(n = 9, "Spectral"))

spatialPlot(climatology(obs.SU),col.regions = colorRampPalette(colSU),
 backdrop.theme = "countries")
