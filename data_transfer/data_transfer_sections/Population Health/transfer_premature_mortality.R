##############################.
# PREMATURE MORTALITY ----
##############################.

data_path <-paste0(path_in_pop, "premature_mortality_nrs.xlsx")

# Read in full data
hb_rate_full <- read_excel(data_path, sheet = "data for tab 3",
                      range = "A3:AW116")

# Rates
hb_rate <- hb_rate_full %>%
  select(1:17) %>%
  row_to_names(row_number = 1)
names(hb_rate)[1] <- "date"
names(hb_rate)[2] <- "cause"
hb_rate <- hb_rate %>%
  filter(cause == "All causes of death") %>%
  pivot_longer(cols = Scotland:`Western Isles`,
               names_to = "geography",
               values_to = "indicator") %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 1))

# Rates - LCL
hb_rate_lcl <- hb_rate_full %>%
  select(1, 18:33) %>%
  row_to_names(row_number = 1)
names(hb_rate_lcl)[1] <- "date"
names(hb_rate_lcl)[2] <- "cause"
hb_rate_lcl <- hb_rate_lcl %>%
  filter(cause == "All causes of death") %>%
  pivot_longer(cols = Scotland:`Western Isles`,
               names_to = "geography",
               values_to = "lower_confidence_interval") %>%
  mutate(lower_confidence_interval = round_half_up(as.numeric(lower_confidence_interval), 1))

# Rates - UCL
hb_rate_ucl <- hb_rate_full %>%
  select(1, 34:49) %>%
  row_to_names(row_number = 1)
names(hb_rate_ucl)[1] <- "date"
names(hb_rate_ucl)[2] <- "cause"
hb_rate_ucl <- hb_rate_ucl %>%
  filter(cause == "All causes of death") %>%
  pivot_longer(cols = Scotland:`Western Isles`,
               names_to = "geography",
               values_to = "upper_confidence_interval") %>%
  mutate(upper_confidence_interval = round_half_up(as.numeric(upper_confidence_interval), 1))

# Join together
hb_rate <- hb_rate %>%
  left_join(hb_rate_lcl) %>%
  left_join(hb_rate_ucl) %>%
  select(-cause) %>%
  filter(date >= 2008) %>%
  mutate(geography_type = ifelse(geography == "Scotland",
                                 "Scotland", "Health Board")) %>%
  mutate(geography = ifelse(geography_type == "Health Board",
                            paste0("NHS ", geography), geography))

rm(hb_rate_full, hb_rate_lcl, hb_rate_ucl)

# Read in full SIMD data
simd_rate_full <- read_excel(data_path, sheet = "data for tab 8",
                           range = "A2:S24")

# Rates
simd_rate <- simd_rate_full %>%
  select(1:7)
names(simd_rate) <- c("date", "All", "SIMD 1", "SIMD 2", "SIMD 3",
                      "SIMD 4", "SIMD 5")
simd_rate <- simd_rate %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = All:`SIMD 5`,
               names_to = "simd",
               values_to = "indicator") %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 1))

# Rates - LCL
simd_rate_lcl <- simd_rate_full %>%
  select(1, 8:13)
names(simd_rate_lcl) <- c("date", "All", "SIMD 1", "SIMD 2", "SIMD 3",
                          "SIMD 4", "SIMD 5")
simd_rate_lcl <- simd_rate_lcl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = All:`SIMD 5`,
               names_to = "simd",
               values_to = "lower_confidence_interval") %>%
  mutate(lower_confidence_interval = round_half_up(as.numeric(lower_confidence_interval), 1))

# Rates - UCL
simd_rate_ucl <- simd_rate_full %>%
  select(1, 14:19)
names(simd_rate_ucl) <- c("date", "All", "SIMD 1", "SIMD 2", "SIMD 3",
                          "SIMD 4", "SIMD 5")
simd_rate_ucl <- simd_rate_ucl %>%
  filter(!is.na(date)) %>%
  pivot_longer(cols = All:`SIMD 5`,
               names_to = "simd",
               values_to = "upper_confidence_interval") %>%
  mutate(upper_confidence_interval = round_half_up(as.numeric(upper_confidence_interval), 1))

# Join together
simd_rate <- simd_rate %>%
  left_join(simd_rate_lcl) %>%
  left_join(simd_rate_ucl) %>%
  filter(date >= 2008)

rm(simd_rate_full, simd_rate_lcl, simd_rate_ucl)

replace_file_fn(hb_rate,
                paste0(path_out, "/premature_mortality_all_cause_hb.rds"))

replace_file_fn(simd_rate,
                paste0(path_out, "/premature_mortality_all_cause_simd.rds"))
