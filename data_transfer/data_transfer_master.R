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

path_main_script_location = here("data_transfer")

setwd(path_main_script_location)

path_data = "/conf/linkage/output/Covid Daily Dashboard/Covid Recovery Dashboard/Data"

path_in = paste0(path_data, "/input_data")
path_out = paste0(path_data, "/output_data")
path_linkage = "/conf/linkage/output/lookups/Unicode"
path_shiny_app_data = path_main_script_location %>%
  gsub("/data_transfer", "", .) %>%
  paste0(., "/shiny_app/data")


path_pop_health = paste0(path_main_script_location, "/data_transfer_sections/Population Health/")
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

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_infant_mortality.R"))


##############################################.
# CAMHS WAITING TIMES ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_camhs_waiting_times.R"))


##############################################.
# PRE-SCHOOL DEVELOPMENT ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_pre-school_development.R"))


##############################################.
# CHILD POVERTY ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_child_poverty.R"))


##############################################.
# POSITIVE DESTINATIONS FOR SCHOOL LEAVERS----
##############################################.


source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_positive_desinations_of_school_leavers.R"))

##############################################.
# PROTECTION FROM HARM----
##############################################.


source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_protection_from_harm.R"))


##############################################.
# FUEL AFFORDABILITY ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_fuel_poverty.R"))

##############################################.
# MANAGING FINANCIALLY----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_managing_financially.R"))


##############################################.
# UNMANAGEABLE DEBT ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_unmanageable_debt.R"))



##############################################.
# Savings ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_savings.R"))

##############################################.
# CHILDCARE UPTAKE ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_childcare_uptake.R"))


##############################################.
# EMPLOYEES ON THE LIVING WAGE ----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_employees_living_wage.R"))

##############################################.
# GENDER PAY GAP----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_gender_pay_gap.R"))

##############################################.
# DISABILITY EMPLOYMENT GAP----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_disability_employment_gap.R"))


##############################################.
# ETHNICITY EMPLOYMENT GAP----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_ethnicity_employment_gap.R"))


##############################################.
# ZERO-HOURS CONTRACTS----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_zero_hours_contracts.R"))

##############################################.
# EMPLOYABILITY----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_employability.R"))


##############################################.
# SKILLS SHORTAGE VACANCIES----
##############################################.
source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_skills_shortage.R"))



##############################################.
# ECONOMIC INACTIVITY----
##############################################.
source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_economic_inactivity.R"))

##############################################.
# UNDEREMPLOYMENT----
##############################################.

source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_underemployment.R"))

##############################################.
# HOUSEHOLD SPENDING----
##############################################.
source(paste0(path_main_script_location,
              "/data_transfer_sections/transfer_household_spending.R"))

##############################################.
# POPULATION HEALTH----
##############################################.

source(paste0(path_main_script_location,
              "/population_health_master.R"))

##############################################.
# MASTER DATA - SUMMARY TABLES----
##############################################.

source(paste0(path_main_script_location,
              "/summary_master.R"))

##############################################.
# APP DATA PREPARATION ----
##############################################.
# This section will archive current dashboard data files and replace them with
# new ones that have been prepared

if(askYesNo("Are you sure you want to DELETE the old archive folder and replace the shiny app data with your new outputs?")) {

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
