#### STEP 1 ####

# List of geospatial packages that will be installed
geo_pkgs <- c("leaflet", "rgdal", "raster", "sp", "terra", "sf")

# List of geospatial package dependencies
geo_deps <- unique(
  unlist(tools::package_dependencies(packages = geo_pkgs,
                                     recursive = TRUE)))

# Remove geospatial packages and their dependencies
pkgs_to_remove <- unique(unlist(c(geo_pkgs, geo_deps)))
remove.packages(pkgs_to_remove)


#### STEP 2 ####

# Remove 'parallelly' if it is already installed
remove.packages("parallelly")

# Install the 'parallelly' package
install.packages("parallelly")

# Identify number of CPUs available
ncpus <- as.numeric(parallelly::availableCores())


#### STEP 3 ####

# Get list of geospatial package dependencies that can be installed as binaries
geo_deps_bin <- sort(setdiff(geo_deps, geo_pkgs))

# Install these as binaries
install.packages(pkgs = geo_deps_bin,
                 repos = c("https://ppm.publichealthscotland.org/all-r/__linux__/centos7/latest"),
                 Ncpus = ncpus)

#### STEP 4 ####

geo_config_args <- c("--with-gdal-config=/usr/gdal34/bin/gdal-config",
                     "--with-proj-include=/usr/proj81/include",
                     "--with-proj-lib=/usr/proj81/lib",
                     "--with-geos-config=/usr/geos310/bin/geos-config")

#### STEP 5 ####

# Install the {sf} package
install.packages("sf",
                 configure.args = geo_config_args,
                 INSTALL_opts = "--no-test-load",
                 repos = c("https://ppm.publichealthscotland.org/all-r/latest"),
                 Ncpus = ncpus)

# Install the {terra} package
install.packages("terra",
                 configure.args = geo_config_args,
                 INSTALL_opts = "--no-test-load",
                 repos = c("https://ppm.publichealthscotland.org/all-r/latest"),
                 Ncpus = ncpus)

# Install the {sp} package
install.packages("sp",
                 configure.args = geo_config_args,
                 INSTALL_opts = "--no-test-load",
                 repos = c("https://ppm.publichealthscotland.org/all-r/latest"),
                 Ncpus = ncpus)

# Install the {raster} package
install.packages("https://ppm.publichealthscotland.org/all-r/latest/src/contrib/Archive/raster/raster_2.5-8.tar.gz",
                 repos = NULL,
                 type = "source",
                 configure.args = geo_config_args,
                 INSTALL_opts = "--no-test-load",
                 Ncpus = ncpus)

# Install the {rgdal} package
install.packages("https://ppm.publichealthscotland.org/all-r/latest/src/contrib/Archive/rgdal/rgdal_1.5-25.tar.gz",
                 repos = NULL,
                 type = "source",
                 configure.args = geo_config_args,
                 INSTALL_opts = "--no-test-load",
                 Ncpus = ncpus)

# Install the {leaflet} package
install.packages("leaflet",
                 repos = c("https://ppm.publichealthscotland.org/all-r/__linux__/centos7/latest"),
                 Ncpus = ncpus)

#### STEP 6 ####

dyn.load("/usr/gdal34/lib/libgdal.so")
dyn.load("/usr/geos310/lib64/libgeos_c.so", local = FALSE)

