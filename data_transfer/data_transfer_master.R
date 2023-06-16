##############################################.
# DATA TRANSFER SCRIPT ----
##############################################.

# This script is used to move the new data files into the appropriate folder,
# updating previous files where appropriate. Data are also prepared/cleaned

##############################################.
##############################################.
##############################################.
# IMPORTANT - THIS SCRIPT SHOULD BE CAREFULLY RUN, STEP BY STEP, RATHER THAN SOURCED
# THE CODE WILL DELETE AND REPLACE FILES, SO IT IS IMPORTANT YOU ARE DOING THIS
# CORRECTLY AND INTENTIONALLY
##############################################.
##############################################.
##############################################.



##############################################.
# HOUSEKEEPING ----
##############################################.
library(dplyr)
library(janitor)
library(stringr)
library(lubridate)
library(readr)
library(readxl)
library(tidyr)
library(magrittr)
dyn.load("/usr/gdal34/lib/libgdal.so")
dyn.load("/usr/geos310/lib64/libgeos_c.so", local = FALSE)
library(rgdal)
library(here)
library(purrr)

path_main_script_location = here("data_transfer")

setwd(path_main_script_location)

path_data = "/conf/linkage/output/Covid Daily Dashboard/Covid Recovery Dashboard/Data"

path_in = paste0(path_data, "/input_data")
path_out = paste0(path_data, "/output_data")
path_linkage = "/conf/linkage/output/lookups/Unicode"
path_shiny_app_data = path_main_script_location %>%
  gsub("/data_transfer", "", .) %>%
  paste0(., "/shiny_app/data")


path_transfer = paste0(path_main_script_location, "/data_transfer_sections/")
path_in_pop = paste0(path_in, "/Population Health/")



##############################################.
# FUNCTIONS ----
##############################################.

# Gets around permissions issues by replacing a file, rather than overwriting
# It deletes the file in the folder if it exists and then saves it out
# You can add further file types using the same format
replace_file_fn = function(data, file_path, file_type="RDS") {

  if(file.exists(file_path)) {
    file.remove(file_path)
  }

  if (file_type=="RDS"){
    saveRDS(data, file_path)
  }
}


pretty_month = function(date) {
  format(date, "%B %Y")
}

# Creates the variables requied for the summary table
# pretty_date = formatted date for viewing (eg March 2020)
# geography_type = Scotland, Health Board, Council Area (eg)
# geography = Scotland, NHS Lothian, City of Edinburgh (eg)
# indicator = formatted value for the indicator to 1 dp
# value = name of the value for UI/tab values

# USE - apply function as data$variable for date through indicator_in.
# Mostly this is useful for remembering which variables to create and being consistent
summary_format_function = function(data, date, geog_type, geog, indicator_in, value_in) {
  data %>%
    mutate(pretty_date = date,
           geography_type = geog_type,
           geography = geog,
           indicator = indicator_in,
           value = value_in)
}

##############################################.
# LOOKUPS ----
##############################################.

lookup_master = readRDS(paste0(
  path_linkage,
  "/Geography/HSCP Locality/HSCP Localities_DZ11_Lookup_20220630.rds"
)) %>%
  select(hb2019name, hb2019, ca2019name, ca2019, hscp2019name, hscp2019) %>%
  unique()

lookup_LA = lookup_master %>%
  select(ca2019name, ca2019, hb2019name, hb2019) %>%
  unique()


lookup_HB = lookup_master %>%
  select(hb2019name, hb2019) %>%
  unique()

replace_file_fn(lookup_master,
                paste0(path_out, "/master_lookup.rds"))


## Geo lookup ----
## Only needs run once, but code sits here in case requires changes

#
# health_board = lookup_master %>%
#   select(geography = hb2019name) %>%
#   unique() %>%
#   mutate(geography_type = "Health board")
#
# council = lookup_master %>%
#   select(geography = ca2019name) %>%
#   unique() %>%
#   mutate(geography_type = "Council area")
#
# hscp = lookup_master %>%
#   select(geography = hscp2019name) %>%
#   unique() %>%
#   mutate(geography_type = "HSCP")
#
# scotland = c("Scotland") %>% as.data.frame() %>%
#   select(geography = 1) %>%
#   mutate(geography_type = "Scotland")
#
# geog_lookup = do.call(rbind, list(scotland, hscp, health_board, council)) %>%
#   mutate(geography = as.character(geography),
#          geography_type = as.character(geography_type)) %>%
#   arrange(geography_type, geography)
#
# replace_file_fn(geog_lookup, paste0(path_out, "/geog_lookup.rds"))



##############################################
# transfer pub_las + pub_las_simplified files for the maps
##############################################

# ShapeFile = paste0(path_in, "/pub_las.shp")
# pub_las = readOGR(ShapeFile)
# pub_las$code = as.character(pub_las$code)
# pub_las = spTransform(pub_las,
#                        CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# replace_file_fn(pub_las,
#                 paste0(path_out, "/pub_las.rds"))
#
#
# ShapeFile = paste0(path_in, "/pub_las_simplified.shp")
# pub_las_simplified = readOGR(ShapeFile)
# pub_las_simplified$code = as.character(pub_las_simplified$code)
# pub_las_simplified = spTransform(pub_las_simplified,
#                       CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# replace_file_fn(pub_las_simplified,
#                 paste0(path_out, "/pub_las_simplified.rds"))



##############################################.
# tab values ----
##############################################.


if (file.exists(paste0(path_out, "/", "tab values.xlsx"))) {
  file.remove(paste0(path_out, "/", "tab values.xlsx"))
}


file.copy(from = paste0(path_in, "/", "tab values.xlsx"),
          to = paste0(path_out, "/", "tab values.xlsx"))


##############################################.
# INFANT MORTALITY ----
##############################################.

source(paste0(path_transfer, "transfer_infant_mortality.R"))


##############################################.
# CAMHS WAITING TIMES ----
##############################################.

source(paste0(path_transfer, "transfer_camhs_waiting_times.R"))


##############################################.
# PRE-SCHOOL DEVELOPMENT ----
##############################################.

source(paste0(path_transfer, "transfer_pre-school_development.R"))


##############################################.
# ECONOMIC INACTIVITY----
##############################################.
source(paste0(path_transfer, "transfer_economic_inactivity.R"))


##############################################.
# GENDER PAY GAP----
##############################################.

source(paste0(path_transfer, "transfer_gender_pay_gap.R"))

##############################################.
# EMPLOYEES ON THE LIVING WAGE ----
##############################################.

source(paste0(path_transfer, "transfer_employees_living_wage.R"))


##############################################.
# ALL-CAUSE MORTALITY (15-44)----
##############################################.

source(paste0(path_transfer, "transfer_all_cause_mortality.R"))

##############################################.
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
##############################################.

source(paste0(path_transfer, "transfer_chd_deaths.R"))

##############################################.
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACKED (<75)----
##############################################.

source(paste0(path_transfer, "transfer_hospital_admission_heart_attack.R"))

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.

source(paste0(path_transfer, "transfer_drug_admissions.R"))

##############################################.
# DRUG RELATED DEATHS----
##############################################.

source(paste0(path_transfer, "transfer_drug_deaths.R"))

##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.
source(paste0(path_transfer, "transfer_alcohol_admissions.R"))

##############################################.
# ALCOHOL SPECIFIC DEATHS (45-74)----
##############################################.
source(paste0(path_transfer, "transfer_alcohol_deaths.R"))

##############################################.
# ASTHMA HOSPITAL ADMISSIONS----
##############################################.

source(paste0(path_transfer, "transfer_asthma_admissions.R"))


##############################################.
# HEALTHY BIRTHWEIGHT BABIES----
##############################################.

source(paste0(path_transfer, "/transfer_healthy_birthweight.R"))

##############################################.
# HEALTHY LIFE EXPECTANCY----
##############################################.

source(paste0(path_transfer, "/transfer_healthy_life_expectancy.R"))

##############################################.
# LIFE EXPECTANCY----
##############################################.

source(paste0(path_transfer, "/transfer_life_expectancy.R"))

##############################################.
# CHILDREN (2-15) AT RISK OF OBESITY----
##############################################.

source(paste0(path_transfer, "transfer_childhood_obesity.R"))

##############################################.
# ADULTS (16+) SELF-ASSESSED HEALTH----
##############################################.

source(paste0(path_transfer, "/transfer_adult_self_assessed_health.R"))

##############################################.
# ADULTS (16+) LIVING WITH LIMITING LONG-TERM CONDITIONS----
##############################################.

source(paste0(path_transfer, "/transfer_adult_long_term_condition.R"))

##############################################.
# MENTAL WELLBEING OF ADULTS (16+)----
##############################################.

source(paste0(path_transfer, "/transfer_adult_mental_wellbeing.R"))

##############################################.
# SCREENING UPTAKE----
##############################################.

source(paste0(path_transfer, "/transfer_screening.R"))

##############################################.
# VACCINATIONS----
##############################################.

source(paste0(path_transfer, "/transfer_vaccinations.R"))

##############################################.
# EXPERIENCE OF SOCIAL CARE RECIPIENTS----
##############################################.


##############################################.
# EXPERIENCE OF UNPAID CARERS----
##############################################.

source(paste0(path_transfer, "/transfer_experience_unpaid_carers.R"))


##############################################.
# PREMATURE MORTALITY----
##############################################.

source(paste0(path_transfer, "/transfer_premature_mortality.R"))


##############################################.
# COVID RECOVERY----
##############################################.

## To transfer data for the covid recovery section - please run the the covid_recovery_master
## sections. It is not sourced here to avoid accidently transferring and including rds files
## that take up space and are unneccessary

##############################################.
# APP DATA PREPARATION ----
##############################################.
# This section will archive current dashboard data files and replace them with
# new ones that have been prepared

if(askYesNo("Are you sure you want to DELETE the old archive folder and replace the shiny app data with your new outputs?")) {

  if (!file.exists(here("shiny_app", "data"))) {dir.create(here("shiny_app", "data"))}
  if (!file.exists(here("shiny_app", "data", "archive"))) {dir.create(here("shiny_app", "data", "archive"))}

  # Deleting the old archive
  do.call(file.remove, list(list.files(paste0(path_shiny_app_data, "/archive"), full.names = TRUE)))

  # Getting all files currently in shiny_app/data
  old_files = list.files(path_shiny_app_data, full.names = TRUE) %>%
    as_tibble() %>%
    filter(str_detect(value, ".rds"))

  # Copying all the files from data folder into archive
  file.copy(from = old_files$value, to = paste0(path_shiny_app_data, "/archive"))

  # Listing current files in output data folder
  new_files = list.files(path_out) %>% as_tibble() %>%
    filter(str_detect(value, ".rds"))

  new_files = new_files %>% add_row(value = "tab values.xlsx")

  # Replaces the updated files in the data folder
  for (file in new_files$value) {
    if (file.exists(paste0(path_shiny_app_data, "/", file))) {
      file.remove(paste0(path_shiny_app_data, "/", file))
    }
    file.copy(from = paste0(path_out, "/", file),
              to = paste0(path_shiny_app_data, "/", file))
  }

}
