##############################################.
# Life Expectancy----
##############################################.


life_expectancy = read_excel(paste0(path_in_pop, "/life_expectancy_for_dashboard.xlsx")) %>%
  clean_names()

replace_file_fn(life_expectancy, paste0(path_out, "/life_expectancy.rds"))



