##############################################.
# DRUG RELATED DEATHS----
##############################################.

# Read in age-sex rates for Scotland, per year
# This includes all sex, male, female
deaths_rate_scotland = read_excel(paste0(path_in_pop, "drug-related-deaths.xlsx"),
                                  sheet = "8 - age-stand d-r-d rates", skip = 2) %>%
  clean_names() %>%
  slice(-1) %>%
  rename("year" = x1)

# Slicing out each sex category
deaths_scotland_males = deaths_rate_scotland %>%
  slice(25:46) %>%
  mutate(sex = "Male")

deaths_scotland_females = deaths_rate_scotland %>%
  slice(49:70) %>%
  mutate(sex = "Female")

deaths_scotland = deaths_rate_scotland %>%
  slice(1:22) %>%
  mutate(sex = "All") %>%
  # Joining the data together in a tidy way
  rbind(deaths_scotland_males, deaths_scotland_females)

# Tidy
rm(deaths_rate_scotland, deaths_scotland_males, deaths_scotland_females)

# Age sex standardised rates and numbers at health board level, 5 year age groups
deaths_rate_HB = read_excel(paste0(path_in_pop, "drug-related-deaths.xlsx"),
                            sheet = "HB4 - age-stand death rates", skip = 2) %>%
  slice(-(19:28)) %>%
  slice(-(1:3))

# Splitting into individual dataframes based on the columns (wide data)
deaths_rate_HB_rate = deaths_rate_HB %>%
  select(1:19)

deaths_hb_LCI = deaths_rate_HB %>%
  select(1, 20:37)

deaths_hb_UCI = deaths_rate_HB %>%
  select(1, 38:55)

deaths_hb_number = deaths_rate_HB %>%
  select(1, 56:73)

# Setting the col names for all data
col_names = c("geography", "2000 - 2004",	"2001 - 2005",	"2002 - 2006",
              "2003 - 2007", "2004 - 2008",	"2005 - 2009",	"2006 - 2010",
              "2007 - 2011",	"2008 - 2012", "2009 - 2013",	"2010 - 2014",
              "2011 - 2015",	"2012 - 2016",	"2013 - 2017", "2014 - 2018",
              "2015 - 2019",	"2016 -2020",	"2017 -2021")

# Applying col names
names(deaths_hb_number) <- names(deaths_hb_LCI) <- names(deaths_hb_UCI) <-
  names(deaths_rate_HB_rate) <- col_names

make_long_fn = function(data, value_name) {
  data %>%
    mutate(across(2:19, as.numeric)) %>%
    pivot_longer(cols = 2:19, names_to = "year", values_to = paste0(value_name))
}

# Putting data into long format

deaths_hb_number = make_long_fn(deaths_hb_number, "number")
deaths_hb_LCI = make_long_fn(deaths_hb_LCI, "lower_confidence_interval")
deaths_hb_UCI = make_long_fn(deaths_hb_UCI, "upper_confidence_interval")
deaths_rate_HB_rate = make_long_fn(deaths_rate_HB_rate, "rate")


# Joining the four dataframes (number, rate, confidence intervals)
deaths_rate_HB = deaths_hb_number %>%
  left_join(deaths_rate_HB_rate) %>%
  left_join(deaths_hb_LCI) %>%
  left_join(deaths_hb_UCI)

# Convert .. to NA and make numeric
deaths_rate_HB %<>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland", "Health Board"))

rm(deaths_hb_number, deaths_hb_LCI, deaths_hb_UCI, deaths_rate_HB_rate)

# Read in CA data

deaths_rate_CA = read_excel(paste0(path_in_pop, "drug-related-deaths.xlsx"),
                            sheet = "C4 - age-stand death rates", skip = 2) %>%
  slice(-(1:3)) %>%
  slice(-(34:41))

# Splitting into individual dataframes based on the columns (wide data)
deaths_CA_rate = deaths_rate_CA %>%
  select(1:19)

deaths_CA_LCI = deaths_rate_CA %>%
  select(1, 20:37)

deaths_CA_UCI = deaths_rate_CA %>%
  select(1, 38:55)

deaths_CA_number = deaths_rate_CA %>%
  select(1, 56:73)
# Assign col names
names(deaths_CA_number) <- names(deaths_CA_LCI) <- names(deaths_CA_UCI) <-
  names(deaths_CA_rate) <- col_names

# Put data in long format
deaths_CA_number = make_long_fn(deaths_CA_number, "number")
deaths_CA_LCI = make_long_fn(deaths_CA_LCI, "lower_confidence_interval")
deaths_CA_UCI = make_long_fn(deaths_CA_UCI, "upper_confidence_interval")
deaths_CA_rate = make_long_fn(deaths_CA_rate, "rate")

# Join all data together
deaths_rate_CA = deaths_CA_number %>%
  left_join(deaths_CA_rate) %>%
  left_join(deaths_CA_LCI) %>%
  left_join(deaths_CA_UCI)

# remove scotland duplicate
deaths_rate_CA %<>%
  filter(geography != "Scotland") %>%
  mutate(geography_type = "Council Area")

# Join CA and HB data together
deaths_rate_bind = rbind(deaths_rate_CA, deaths_rate_HB)

# Get summary variables
deaths_rate_bind %<>%
  summary_format_function(., .$year, .$geography_type, .$geography, .$rate,
                          "drug_deaths")
# Save out final dataframe
replace_file_fn(deaths_rate_bind, paste0(path_out, "/drug_related_deaths.rds"))
