##############################################.
# HOSPITAL ADMISSIONS HEART ATTACK ----
##############################################.

## to transfer, you'll need to manually add the updated line to the excel

heart_attack <- read_excel(paste0(path_in_pop, "/heart-attack-hospital-admissions-table-4.1.xlsx")) %>%
  filter(date >= "2008") %>%
  clean_names() %>%
  select(-target_population_size) %>%
  summary_format_function(date = .$date,
                          geog_type = "Scotland",
                          geog = "Scotland",
                          indicator_in = .$total_admissions,
                          value_in = "hospital_admission_heart_attack")

replace_file_fn(heart_attack, paste0(path_out, "/heart_attack.rds"))

rm(heart_attack)
