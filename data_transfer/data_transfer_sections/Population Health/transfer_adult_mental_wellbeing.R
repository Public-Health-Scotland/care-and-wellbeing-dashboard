##############################################.
# MENTAL WELLBEING OF ADULTS----
##############################################.

adult_mental_welbeing <- read_csv(paste0(path_in_pop, "Mental wellbeing SHeS data gender.csv")) %>%
  clean_names() %>%
  mutate(year = as.character(year)) %>%
  select(year, geographylevel, sex, mean) %>%
  rename(geography = geographylevel, indicator = mean)

adult_mental_welbeing_simd <- read_csv(paste0(path_in_pop, "Mental wellbeing SHeS data SIMD.csv")) %>%
  clean_names() %>%
  mutate(year = as.character(year)) %>%
  mutate(simd = recode(simd, `1st-Most deprived` = "1 - Most deprived",
                        `2nd` = "2",
                        `3rd` = "3",
                        `4th` = "4",
                        `5th-Least deprived` = "5 - Least deprived")) %>%
  select(year, geographylevel, simd, mean) %>%
  rename(geography = geographylevel, indicator = mean)

replace_file_fn(adult_mental_welbeing,
                paste0(path_out, "/adult_mental_welbeing.rds"))

replace_file_fn(adult_mental_welbeing_simd,
                paste0(path_out, "/adult_mental_welbeing_simd.rds"))
