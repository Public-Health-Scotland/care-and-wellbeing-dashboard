##############################################.
# ADULT LIVING WITH LIMIIING LONG TERM CONDITION ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Adult long-term condition"
data_path_simd <-paste0(path_in_pop, "long_term_illness_simd.xlsx")

input_living_limiting_long_term_condition <- read_excel(data_path, sheet=data_sheet) %>% 
  filter(Indicator == "Long-term illness" & Categories == "Limiting long-term illness") %>%
  summary_format_function(date = .$Year, 
                          geog_type = .$Geographylevel, 
                          geog = .$Geographylevel, 
                          indicator_in = .$Percent, 
                          value_in = "adult_living_limiting_long_term_condition")

input_living_limiting_long_term_condition_simd <- read_excel(data_path_simd) %>% 
  filter(Indicator == "Long-term illness" & Categories == "Limiting long-term illness") %>%
  summary_format_function(date = .$Year, 
                          geog_type = .$Geographylevel, 
                          geog = .$Geographylevel, 
                          indicator_in = .$Percent, 
                          value_in = "adult_living_limiting_long_term_condition_simd")


replace_file_fn(input_living_limiting_long_term_condition,
                paste0(path_out, "/adult_living_limiting_long_term_condition.rds"))

replace_file_fn(input_living_limiting_long_term_condition_simd,
                paste0(path_out, "/adult_living_limiting_long_term_condition_simd.rds"))

