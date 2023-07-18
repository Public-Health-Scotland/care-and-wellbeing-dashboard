##############################.
# PREMATURE MORTALITY ----
##############################.


#################### READ IN HB DATA ############################

data_path <-paste0(path_in_pop, "premature_mortality_nrs.xlsx")

# Read in full table
hb_rate_full <- read_excel(data_path, sheet = "Table 6",
                         range = "B119:BJ137")

#Rates
hb_rate <- hb_rate_full %>%
  select(c(1, seq(2, 61, by = 4)))
names(hb_rate)[1] <- "date"

column_names <- names(hb_rate)

hb_rate <- hb_rate %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:16, names_to = "geography",
               values_to = "indicator") %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 1))

# Lower confidence interval
hb_rate_lcl <- hb_rate_full %>%
  select(c(1, seq(3, 61, by = 4)))
names(hb_rate_lcl) <- column_names
hb_rate_lcl <- hb_rate_lcl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:16, names_to = "geography",
               values_to = "lower_confidence_interval") %>%
  mutate(lower_confidence_interval = round_half_up(as.numeric(lower_confidence_interval), 1))

# Upper confidence interval
hb_rate_ucl <- hb_rate_full %>%
  select(c(1, seq(4, 61, by = 4)))
names(hb_rate_ucl) <- column_names
hb_rate_ucl <- hb_rate_ucl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:16, names_to = "geography",
               values_to = "upper_confidence_interval") %>%
  mutate(upper_confidence_interval = round_half_up(as.numeric(upper_confidence_interval), 1))

# # Number of deaths
# hb_deaths <- hb_rate_full %>%
#   select(c(1, seq(5, 61, by = 4)))
# names(hb_deaths) <- column_names
# hb_deaths <- hb_deaths %>%
#   filter(!is.na(date)) %>%
#   pivot_longer(cols = 2:16, names_to = "geography",
#                values_to = "number_of_deaths") %>%
#   mutate(number_of_deaths = round_half_up(as.numeric(number_of_deaths), 0))

# Join together
hb_rate <- hb_rate %>%
  left_join(hb_rate_lcl) %>%
  left_join(hb_rate_ucl) %>%
  # left_join(hb_deaths) %>%
  filter(date >= 2008) %>%
  mutate(date = as.character(date)) %>%
  mutate(geography_type = ifelse(geography == "Scotland",
                                 "Scotland", "Health Board")) %>%
  mutate(geography = ifelse(geography_type == "Health Board",
                            paste0("NHS ", geography), geography))

# Remove
rm(hb_rate_full, hb_rate_lcl, hb_rate_ucl) #, hb_deaths)



################### READ IN LA DATA ##########################

##########LAs##############

data_path <-paste0(path_in_pop, "premature_mortality_tab4.xlsx")

# Read in full table
la_rate_full <- read_excel(data_path, sheet = "Table 4 LAs",
                           range = "A5:CV23") %>%
  slice(-c(1:2))

#Rates
la_rate <- la_rate_full %>%
  select(c(1, seq(2, 100, by = 3)))
names(la_rate)[1] <- "date"

column_names <- names(la_rate)

la_rate <- la_rate %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:34, names_to = "geography",
               values_to = "indicator") %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 1))

# Lower confidence interval
la_rate_lcl <- la_rate_full %>%
  select(c(1, seq(3, 100, by = 3)))
names(la_rate_lcl) <- column_names
la_rate_lcl <- la_rate_lcl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:34, names_to = "geography",
               values_to = "lower_confidence_interval") %>%
  mutate(lower_confidence_interval = round_half_up(as.numeric(lower_confidence_interval), 1))

# Upper confidence interval
la_rate_ucl <- la_rate_full %>%
  select(c(1, seq(4, 100, by = 3)))
names(la_rate_ucl) <- column_names
la_rate_ucl <- la_rate_ucl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = 2:34, names_to = "geography",
               values_to = "upper_confidence_interval") %>%
  mutate(upper_confidence_interval = round_half_up(as.numeric(upper_confidence_interval), 1))

# Join together
la_rate <- la_rate %>%
  left_join(la_rate_lcl) %>%
  left_join(la_rate_ucl) %>%
  filter(date >= 2008) %>%
  mutate(date = as.character(date)) %>%
  mutate(geography_type = ifelse(geography == "Scotland",
                                 "Scotland", "Council Area"))

# Remove
rm(la_rate_full, la_rate_lcl, la_rate_ucl)


#### JOIN HB AND LA DATA ###############
# LA data does not contain number of deaths, only hb does

premature_mortality_rate <- rbind(hb_rate, la_rate) %>%
  arrange(date, geography_type, geography) %>%
  distinct(.keep_all = TRUE)


data_path <-paste0(path_in_pop, "premature_mortality_nrs.xlsx")

# Read in full SIMD data
simd_rate_full <- read_excel(data_path, sheet = "Table 8",
                             range = "A6:S29")

#Rates
simd_rate <- simd_rate_full %>%
  select(c(1, seq(5, 19, by = 3)))
names(simd_rate)[1] <- "date"
column_names <- names(simd_rate)
simd_rate <- simd_rate %>%
  filter(!is.na(date) & date != "Registration Year") %>%
  pivot_longer(cols = 2:6, names_to = "simd",
               values_to = "indicator") %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 1))

# Lower confidence interval
simd_rate_lcl <- simd_rate_full %>%
  select(c(1, seq(6, 19, by = 3)))
names(simd_rate_lcl) <- column_names
simd_rate_lcl <- simd_rate_lcl %>%
  filter(!is.na(date) & date != "Registration Year") %>%
  pivot_longer(cols = 2:6, names_to = "simd",
               values_to = "lower_confidence_interval") %>%
  mutate(lower_confidence_interval = round_half_up(as.numeric(lower_confidence_interval), 1))

# Upper confidence interval
simd_rate_ucl <- simd_rate_full %>%
  select(c(1, seq(7, 19, by = 3)))
names(simd_rate_ucl) <- column_names
simd_rate_ucl <- simd_rate_ucl %>%
  filter(!is.na(date) & date != "Registration Year") %>%
  pivot_longer(cols = 2:6, names_to = "simd",
               values_to = "upper_confidence_interval") %>%
  mutate(upper_confidence_interval = round_half_up(as.numeric(upper_confidence_interval), 1))

# Join together
simd_rate <- simd_rate %>%
  left_join(simd_rate_lcl) %>%
  left_join(simd_rate_ucl) %>%
  filter(date >= 2008)

# Remove
rm(simd_rate_full, simd_rate_lcl, simd_rate_ucl)

replace_file_fn(premature_mortality_rate,
                paste0(path_out, "/premature_mortality_all_cause.rds"))

replace_file_fn(simd_rate,
                paste0(path_out, "/premature_mortality_all_cause_simd.rds"))



