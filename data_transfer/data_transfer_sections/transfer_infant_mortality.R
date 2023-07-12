##############################################.
# INFANT MORTALITY DATA PROCESSING ----
##############################################.

# Read in input data
stillbirth_infantdeaths_extract <- read_csv(paste0(path_in,
                                                   "/stillbirth_infantdeaths_extract_jul_23.csv"))


# Cleaning and reformatting
inf_deaths = stillbirth_infantdeaths_extract %>%
  mutate(date = dmy(paste0("01", month_of_year))) %>%
  select(date,
         count = number_of_deaths_in_month,
         denominator = live_births,
         rate,
         geography_type = area_name,
         geography_name = area_name) %>%
  mutate(geography = geography_name,
         indicator = round_half_up(rate, 2),
         value = "infant_mortality",
         pretty_date = ymd(date))





# Saving the RDS file out
replace_file_fn(inf_deaths,
                paste0(path_out, "/inf_deaths.rds"))

