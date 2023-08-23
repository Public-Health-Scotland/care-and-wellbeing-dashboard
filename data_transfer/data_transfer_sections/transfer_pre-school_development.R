##############################################.
# Pre-school development----
##############################################.
# Read in simd data
preschool = read_csv(paste0(path_in, "/open27mlasimd.csv")) %>%
  clean_names() %>%
  select(ca2019 = ca, simd_quintile, financial_year, number_of_reviews, concern_any) %>%
  left_join(., lookup_LA) %>% # Geography lookup
  mutate(simd_quintile = case_when(simd_quintile == 1 ~ "1 - Most deprived",
                                   simd_quintile == 2 ~ "2",
                                   simd_quintile == 3 ~ "3",
                                   simd_quintile == 4 ~ "4",
                                   simd_quintile == 5 ~ "5 - Least deprived"))

# Read in sex data
preschool_sex = read_csv(paste0(path_in, "/open27mlasex.csv")) %>%
  clean_names() %>%
  select(ca2019 = ca, sex, financial_year, number_of_reviews, concern_any) %>%
  left_join(., lookup_LA)

# Read in ethnicity data
preschool_ethnicity = read_csv(paste0(path_in, "/open27mscethnicity.csv")) %>%
  clean_names() %>%
  select(ethnicity, financial_year, number_of_reviews, concern_any) %>%
  mutate(geography_type = "Scotland",
         ca2019 = "Scotland", ca2019name = "Scotland",
         hb2019 = "Scotland", hb2019name = "Scotland",
         geography = "Scotland",
         ethnicity = str_replace(ethnicity, "WhiteScot", "White Scottish"),
         ethnicity = str_replace(ethnicity, "WhiteBrit", "White Other British"),
         ethnicity = str_replace(ethnicity, "Pole", "White Polish"),
         ethnicity = str_replace(ethnicity, "Other", "White Other"),
         ethnicity = str_replace(ethnicity, "Mixed", "Mixed / Multiple Ethnicity"),
         ethnicity = str_replace(ethnicity, "Black", " Black, Caribbean, or African"),
         ethnicity = str_replace(ethnicity, "Unknown", "Other / Unknown")) %>%
  filter(ethnicity != "Not Applicable")

# Recoding unknown geographies
preschool_unknown = preschool %>%
  filter(ca2019 == "RA2704") %>%
  mutate_at(c("ca2019name", "hb2019name", "hb2019"),
            ~"Unknown")

preschool_sex_unknown = preschool_sex %>%
  filter(ca2019 == "RA2704") %>%
  mutate_at(c("ca2019name", "hb2019name", "hb2019"),
            ~"Unknown")

# Rejoining unknowns
preschool %<>%
  filter(ca2019 != "RA2704") %>%
  rbind(., preschool_unknown)

preschool_sex %<>%
  filter(ca2019 != "RA2704") %>%
  rbind(., preschool_sex_unknown)

# Agg to health board level
preschool_HB = preschool %>%
  group_by(simd_quintile, hb2019name, hb2019, financial_year) %>%
  summarise(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(ca2019 = "Health Board",
         ca2019name = "Health Board",
         geography_type = "Health Board",
         geography = hb2019name) %>%
  ungroup()

preschool_sex_HB = preschool_sex %>%
  group_by(sex, hb2019name, hb2019, financial_year) %>%
  summarise(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(ca2019 = "Health Board",
         ca2019name = "Health Board",
         geography_type = "Health Board",
         geography = hb2019name) %>%
  ungroup()

# Agg to Scotland level
preschool_Scotland = preschool %>%
  group_by(simd_quintile, financial_year) %>%
  summarise(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(geography_type = "Scotland",
         ca2019 = "Scotland", ca2019name = "Scotland",
         hb2019 = "Scotland", hb2019name = "Scotland",
         geography = "Scotland") %>%
  ungroup()

preschool_sex_Scotland = preschool_sex %>%
  group_by(sex, financial_year) %>%
  summarise(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(geography_type = "Scotland",
         ca2019 = "Scotland", ca2019name = "Scotland",
         hb2019 = "Scotland", hb2019name = "Scotland",
         geography = "Scotland") %>%
  ungroup()

# Adding geog type to LA structure
preschool %<>%
  mutate(geography_type = "Council Area",
         geography = ca2019name)

preschool_sex %<>%
  mutate(geography_type = "Council Area",
         geography = ca2019name)

# Joining all the structures together
preschool_structures = do.call(rbind, list(preschool, preschool_HB, preschool_Scotland))
preschool_structures_sex = do.call(rbind, list(preschool_sex, preschool_sex_HB, preschool_sex_Scotland))

# Calculating proportion
preschool_structures_total <- preschool_structures %>%
  group_by(financial_year, ca2019name, hb2019name, geography_type, geography) %>%
  summarize(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(prop_concern_any = 100*concern_any/number_of_reviews,
         # indicator = prop_concern_any, accuracy = .1,
         pretty_date = financial_year,
         value = "pre_school_development") %>% 
  ungroup() %>%
  arrange(pretty_date, geography_type, geography)

preschool_structures_simd <- preschool_structures %>%
  mutate(prop_concern_any = 100*concern_any/number_of_reviews,
         # indicator = prop_concern_any, accuracy = .1,
         pretty_date = financial_year,
         value = "pre_school_development") %>%
  na.omit() %>%
  arrange(pretty_date, geography_type, geography)

preschool_structures_sex <- preschool_structures_sex %>%
  mutate(prop_concern_any = 100*concern_any/number_of_reviews,
         # indicator = prop_concern_any, accuracy = .1,
         pretty_date = financial_year,
         value = "pre_school_development") %>%
  arrange(pretty_date, geography_type, geography)

preschool_structures_ethnicity <- preschool_ethnicity %>%
  mutate(prop_concern_any = 100*concern_any/number_of_reviews,
         # indicator = prop_concern_any, accuracy = .1,
         pretty_date = financial_year,
         value = "pre_school_development") %>%
  na.omit() %>%
  arrange(pretty_date, geography_type, geography)

# Cleanup
rm(preschool, preschool_HB, preschool_Scotland,
   preschool_sex, preschool_sex_HB, preschool_sex_Scotland,
   preschool_ethnicity)

# Save output
replace_file_fn(preschool_structures_total,
                paste0(path_out, "/preschool.rds"))

replace_file_fn(preschool_structures_simd,
                paste0(path_out, "/preschool_simd.rds"))

replace_file_fn(preschool_structures_sex,
                paste0(path_out, "/preschool_sex.rds"))

replace_file_fn(preschool_structures_ethnicity,
                paste0(path_out, "/preschool_ethnicity.rds"))

