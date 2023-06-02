##############################.
# PREMATURE MORTALITY ----
##############################.

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

# Join together
hb_rate <- hb_rate %>%
  left_join(hb_rate_lcl) %>%
  left_join(hb_rate_ucl) %>%
  filter(date >= 2008) %>%
  mutate(geography_type = ifelse(geography == "Scotland",
                                 "Scotland", "Health Board")) %>%
  mutate(geography = ifelse(geography_type == "Health Board",
                            paste0("NHS ", geography), geography))

# Remove
rm(hb_rate_full, hb_rate_lcl, hb_rate_ucl)

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

replace_file_fn(hb_rate,
                paste0(path_out, "/premature_mortality_all_cause_hb.rds"))

replace_file_fn(simd_rate,
                paste0(path_out, "/premature_mortality_all_cause_simd.rds"))
