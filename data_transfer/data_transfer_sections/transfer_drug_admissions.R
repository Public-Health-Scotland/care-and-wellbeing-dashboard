##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS----
##############################################.

drug_stays = read_csv(paste0(path_in_pop, "/Drug Standardised hospital stays age_sex_trend_data.csv")) %>%
  clean_names() %>%
  mutate(geography_type = "Scotland",
         geography = "Scotland",
         sex = recode(sex, `Both sexes` = "All sexes")) %>%
  rename("rate" = "value") %>%
  select(-measure)

replace_file_fn(drug_stays, paste0(path_out, "/drug_stays.rds"))
