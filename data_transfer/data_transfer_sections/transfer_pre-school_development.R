##############################################.
# Pre-school development----
##############################################.
# Read in the data
preschool = read_csv(paste0(path_in, "/open27mlatotals.csv")) %>%
  clean_names() %>%
  select(ca2019 = ca, financial_year, number_of_reviews, concern_any) %>%
  left_join(., lookup_LA)# Geography lookup

# Recoding unknown geographies
preschool_unknown = preschool %>%
  filter(ca2019 == "RA2704") %>%
  mutate_at(c("ca2019name", "hb2019name", "hb2019"),
            ~"Unknown")

# Rejoining unknowns
preschool %<>%
  filter(ca2019 != "RA2704") %>%
  rbind(., preschool_unknown)

# Agg to health board level
preschool_HB = preschool %>%
  group_by(hb2019name, hb2019, financial_year) %>%
  summarise(number_of_reviews = sum(number_of_reviews),
            concern_any = sum(concern_any)) %>%
  mutate(ca2019 = "Health Board",
         ca2019name = "Health Board",
         geography_type = "Health Board",
         geography = hb2019name) %>%
  ungroup()

# Agg to Scotland level
preschool_Scotland = preschool %>%
  group_by(financial_year) %>%
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

# Joining all the structures together
preschool_structures = do.call(rbind, list(preschool, preschool_HB, preschool_Scotland))

# Calculating proportion
preschool_structures %<>%
  mutate(prop_concern_any = concern_any/number_of_reviews,
         indicator = scales::percent(prop_concern_any, accuracy = .1),
         pretty_date = financial_year,
         value = "pre_school_development") %>%
  arrange(pretty_date, geography_type, geography)

# Cleanup
rm(preschool, preschool_HB, preschool_Scotland)

# Save output
replace_file_fn(preschool_structures,
                paste0(path_out, "/preschool.rds"))

