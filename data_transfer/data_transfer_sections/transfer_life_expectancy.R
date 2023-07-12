##############################################.
# Life Expectancy----
##############################################.

### RATES #####

life_expectancy = read_excel(paste0(path_in_pop, "/life_expectancy_for_dashboard.xlsx")) %>%
  clean_names()

replace_file_fn(life_expectancy, paste0(path_out, "/life_expectancy.rds"))





###### SIMD #####

life_expectancy_simd = read_excel(paste0(path_in_pop, "/life-expectancy-19-21-figures.xlsx"),
                                  sheet = "Data Fig 13", range = "A3:E28") %>%
  clean_names() %>%
  slice(-c(1:2)) %>%
  mutate(sex = zoo::na.locf(sex)) %>%
  filter(!is.na(simd_2020_decile)) %>%
  mutate(simd_2020_decile = str_remove(simd_2020_decile, "decile "),
         simd_2020_decile = factor(simd_2020_decile, levels = as.character(c(1:10))),
         simd_2020_decile = recode(simd_2020_decile, "1" = "1 (Most deprived)",
                                   "10" = "10 (Least deprived)"),
         sex = str_remove(sex, "s"))

replace_file_fn(life_expectancy_simd, paste0(path_out, "/life_expectancy_simd.rds"))

