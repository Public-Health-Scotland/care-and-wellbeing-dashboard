##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS----
##############################################.

drug_stays = read_csv(paste0(path_in_pop, "/Drug Standardised hospitals stays age_sex_trend_data.csv")) %>%
  clean_names() %>%
  mutate(geography_type = "Scotland",
         geography = "Scotland")


drug_stays_summary = drug_stays %>%
  filter(age_group == "All age groups") %>%
  summary_format_function(., .$financial_year, .$geography_type, .$geography,
                          round_half_up(.$rate, 1), "drug_admissions")

replace_file_fn(drug_stays, paste0(path_out, "/drug_stays.rds"))
replace_file_fn(drug_stays_summary, paste0(path_out, "/drug_stays_summary.rds"))