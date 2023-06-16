##############################################.
# ADULT LIVING WITH LIMIIING LONG TERM CONDITION ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Adult long-term condition"

input_living_limiting_long_term_condition <- read_excel(data_path, sheet=data_sheet) %>% 
  filter(Indicator == "Long-term illness" & Sex == "All" & Categories == "Limiting long-term illness") %>%
  summary_format_function(date = .$Year, 
                          geog_type = .$Geographylevel, 
                          geog = .$Geographylevel, 
                          indicator_in = .$Percent, 
                          value_in = "adult_living_limiting_long_term_condition")


replace_file_fn(input_living_limiting_long_term_condition,
                paste0(path_out, "/adult_living_limiting_long_term_condition.rds"))

