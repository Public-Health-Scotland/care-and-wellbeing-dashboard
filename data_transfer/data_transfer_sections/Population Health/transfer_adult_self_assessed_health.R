##############################################.
# ADULT SELF ASSESSED HEALTH ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Adult self-assessed health"

input_adult_self_assessed_health <- read_excel(data_path, sheet=data_sheet) %>%
  filter(Indicator == "Self-assessed general health" & Sex == "All" & Categories == "Very good/Good") %>%
  mutate(Year = as.character(Year)) %>%
  summary_format_function(date = .$Year,
                          geog_type = .$Geographylevel,
                          geog = .$Geographylevel,
                          indicator_in = .$Percent,
                          value_in = "adults_self_assessed_health")


replace_file_fn(input_adult_self_assessed_health,
                paste0(path_out, "/adult_self_assessed_health.rds"))

