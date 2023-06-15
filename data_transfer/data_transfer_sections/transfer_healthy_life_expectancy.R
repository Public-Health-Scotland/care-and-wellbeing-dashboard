##############################################.
# Healthy Life Expectancy----
##############################################.


healthy_life_expectancy = read_excel(paste0(path_in_pop, "/healthy_life_expectancy_for_dashboard.xlsx")) %>%
  clean_names()

replace_file_fn(healthy_life_expectancy, paste0(path_out, "/healthy_life_expectancy.rds"))
