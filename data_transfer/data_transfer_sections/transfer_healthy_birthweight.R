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
  select(-c(simd_quintile_qf, simd_version)) %>%
  ungroup()

# Aggregate to hb/scotland level
birthweight_hb = birthweight %>%
  group_by(financial_year, simd_quintile, age_group, birthweight, gestation,
           birthweight_for_gestational_age, hb2019name) %>%
  summarise(livebirths = sum(livebirths)) %>%
  mutate(geography_type = "Health Board",
         geography = hb2019name) %>%
  select(-hb2019name) %>% ungroup()

birthweight_scotland = birthweight %>%
  group_by(financial_year, simd_quintile, age_group, birthweight, gestation,
           birthweight_for_gestational_age) %>%
  summarise(livebirths = sum(livebirths)) %>%
  mutate(geography_type = "Scotland",
         geography = "Scotland") %>% ungroup()

birthweight_all = birthweight_scotland %>%
  rbind(birthweight_hb, birthweight_ca)

birthweight <- birthweight_all %>%
  group_by(geography, geography_type, financial_year,
           birthweight_for_gestational_age) %>%
  summarise(livebirths = sum(livebirths)) %>%
  group_by(geography, geography_type, financial_year) %>%
  mutate(proportion = livebirths/sum(livebirths)) %>%
  ungroup() %>%
  filter(str_detect(financial_year, "20")) %>%
  filter(!(financial_year %in% c("2000/01","2001/02","2002/03","2003/04","2004/05","2005/06","2006/07","2007/08"))) %>%
  summary_format_function(., .$financial_year, .$geography_type,
                          .$geography, scales::percent(.$proportion, 1),
                          "healthy_birthweight")


replace_file_fn(birthweight, paste0(path_out, "/birthweight.rds"))

rm(birthweight, birthweight_ca, birthweight_hb,
   birthweight_scotland)


birthweight_simd <- birthweight_all %>%
  mutate(birthweight = ifelse(birthweight %in% c("1500-2499g", "Under 1500g"), "<2500g", ">2500g")) %>%
  filter(birthweight == "<2500g") %>%
  select(-birthweight_for_gestational_age) %>%
  group_by(financial_year, simd_quintile, geography) %>%
  summarise(livebirths = sum(livebirths)) %>%
  ungroup() %>%
  group_by(financial_year, geography) %>%
  mutate(proportion = (100 * livebirths / sum(livebirths))) %>%
  ungroup() %>%
  filter(financial_year >= "2008/09",
         !is.na(simd_quintile)) %>%
  mutate(simd = factor(simd_quintile, levels = c(1:5),
                       labels = c("1 (Most deprived)", "2", "3", "4", "5 (Least deprived)")),
         geography_type = ifelse(geography == "Scotland", "Scotland",
                                 ifelse(str_starts(geography, "NHS"), "NHS Health Board", "Council Area"))) %>%
  select(-simd_quintile) %>%
  arrange(financial_year, geography_type, geography, simd)

replace_file_fn(birthweight_simd, paste0(path_out, "/birthweight_simd.rds"))

rm(birthweight_all, birthweight_simd)
