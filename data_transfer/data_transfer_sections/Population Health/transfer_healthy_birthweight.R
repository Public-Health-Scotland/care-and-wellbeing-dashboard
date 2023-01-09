##############################################.
# HEALTHY BIRTHWEIGHT BABIES----
##############################################.

birthweight = read_csv(paste0(path_in_pop, "/12.2_birthweight.csv")) %>%
  clean_names() %>%
  rename(ca2019 = ca)

# Join on HB lookup
lookup = lookup_master %>%
  select(ca2019, ca2019name, hb2019name, hb2019)

birthweight %<>%
  left_join(lookup) %>%
  filter(ca2019 != "RA2704")

birthweight_ca = birthweight %>%
  mutate(geography_type = "Council Area",
         geography = ca2019name) %>%
  select(-c(ca2019, ca2019name, hb2019name, hb2019)) %>%
  select(-starts_with("simd")) %>% ungroup()

# Aggregate to hb/scotland level
birthweight_hb = birthweight %>%
  group_by(financial_year, age_group, birthweight, gestation,
           birthweight_for_gestational_age, hb2019name) %>%
  summarise(livebirths = sum(livebirths)) %>%
  mutate(geography_type = "Health Board",
         geography = hb2019name) %>%
  select(-hb2019name) %>% ungroup()

birthweight_scotland = birthweight %>%
  group_by(financial_year, age_group, birthweight, gestation,
           birthweight_for_gestational_age) %>%
  summarise(livebirths = sum(livebirths)) %>%
  mutate(geography_type = "Scotland",
         geography = "Scotland") %>% ungroup()

birthweight_all = birthweight_scotland %>%
  rbind(birthweight_hb, birthweight_ca)

birthweight_all %<>%
  group_by(geography, geography_type, financial_year,
           birthweight_for_gestational_age) %>%
  summarise(livebirths = sum(livebirths)) %>%
  group_by(geography, geography_type, financial_year) %>%
  mutate(proportion = livebirths/sum(livebirths)) %>%
  ungroup() %>%
  summary_format_function(., .$financial_year, .$geography_type,
                          .$geography, scales::percent(.$proportion, 1),
                          "healthy_birthweight")


replace_file_fn(birthweight_all, paste0(path_out, "/birthweight.rds"))

rm(birthweight, birthweight_all, birthweight_ca, birthweight_hb,
   birthweight_scotland)
