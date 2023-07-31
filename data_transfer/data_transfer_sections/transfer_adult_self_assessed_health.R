##############################################.
# ADULT SELF ASSESSED HEALTH ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Adult self-assessed health"
data_path_simd <-paste0(path_in_pop, "adult_self_assesed_simd.xlsx")

input_adult_self_assessed_health <- read_excel(data_path, sheet=data_sheet) %>%
  filter(Indicator == "Self-assessed general health" & Categories == "Very good/Good") %>%
  mutate(Year = as.character(Year)) %>%
  summary_format_function(date = .$Year,
                          geog_type = .$Geographylevel,
                          geog = .$Geographylevel,
                          indicator_in = .$Percent,
                          value_in = "adults_self_assessed_health")

input_adult_self_assessed_health_simd <- read_excel(data_path_simd) %>%
  filter(Indicator == "Self-assessed general health" & Categories == "Very good/Good") %>%
  mutate(Year = as.character(Year)) %>%
  mutate(SIMD = recode(SIMD, `1st-Most deprived` = "1 - Most deprived",
                       `2nd` = "2",
                       `3rd` = "3",
                       `4th` = "4",
                       `5th-Least deprived` = "5 - Least deprived")) %>% 
  summary_format_function(date = .$Year,
                          geog_type = .$Geographylevel,
                          geog = .$Geographylevel,
                          indicator_in = .$Percent,
                          value_in = "adults_self_assessed_health_simd")


replace_file_fn(input_adult_self_assessed_health,
                paste0(path_out, "/adult_self_assessed_health.rds"))

replace_file_fn(input_adult_self_assessed_health_simd,
                paste0(path_out, "/adult_self_assessed_health_simd.rds"))

