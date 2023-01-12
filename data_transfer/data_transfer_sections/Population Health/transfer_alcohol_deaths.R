##### ALCOHOL-SPECIFIC DEATHS #########

data_path <-paste0(path_in_pop, "alcohol-specific-deaths-21-all-tabs.xlsx")
data_sheet <- "Table_2C"


input_alcohol_deaths <- read_excel(data_path, sheet = data_sheet, col_names = TRUE, range="A5:H89") %>%
  clean_names() %>%
  pivot_longer(cols = c(age_10_24:age_75_or_more), names_to = "breakdown", values_to = "indicator") %>%
  mutate(value = "alcohol_deaths",
         geography_type = "Scotland",
         geography = "Scotland") %>%
  summary_format_function(date = .$year,
                          geog_type = .$geography_type,
                          geog = .$geography,
                          indicator_in = .$indicator,
                          value_in = .$value)

replace_file_fn(input_alcohol_deaths,
                paste0(path_out, "/alcohol_deaths.rds"))






