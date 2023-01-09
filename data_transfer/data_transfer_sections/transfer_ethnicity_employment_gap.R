##############################################.
# ETHNICITY EMPLOYMENT GAP - table data----
##############################################.

ethnicity_employment_gap_white = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                               sheet = "Table 1.6A",
                                               range = "A4:AI15",
                                               na = "-") %>%
  rename(regional_area = `...1`) %>%
  filter(regional_area != "Regional area:") %>%
  select(regional_area, matches("[0-9]{4}")) %>%
  mutate(category = "White")



ethnicity_employment_gap_minority = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                            sheet = "Table 1.6A",
                                            range = "A19:AI30",
                                            na = "-") %>%
  rename(regional_area = `...1`) %>%
  filter(regional_area != "Regional area:") %>%
  select(regional_area, matches("[0-9]{4}")) %>%
  mutate(category = "Minority Ethnic")



ethnicity_employment_gap_gap = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                               sheet = "Table 1.6A",
                                               range = "A34:AI45",
                                               na = "-") %>%
  rename(regional_area = `...1`) %>%
  filter(regional_area != "Regional area:") %>%
  select(regional_area, matches("[0-9]{4}")) %>%
  mutate(category = "Ethnicity Employment Gap")



ethnicity_employment_gap_data = rbind(ethnicity_employment_gap_white,
                                       ethnicity_employment_gap_minority,
                                       ethnicity_employment_gap_gap) %>%
  pivot_longer(cols = `2004`:`2020`, names_to = "year", values_to = "measure_value") %>%
  mutate(year = str_extract(year, "^20[0-9]{2}")) %>%
  mutate(category = factor(category, levels = c("Ethnicity Employment Gap",
                                                "White",
                                                "Minority Ethnic"))) %>%
  filter(as.numeric(year) >= 2014) %>%
  mutate(geography = regional_area,
         geography_type = ifelse(regional_area == "Scotland", "Scotland", "Regional Area"),
         value = "ethnicity_employment_gap",
         indicator = paste0(measure_value, "%"),
         pretty_date = year)

replace_file_fn(ethnicity_employment_gap_data,
                paste0(path_out, "/ethnicity_employment_gap_data.rds"))


##############################################.
# ETHNICITY EMPLOYMENT GAP - chart data----
##############################################.

ethnicity_employment_gap_chart_data = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Publication+Charts.xlsx"),
                                            sheet = "Chart 8",
                                            range = "A4:H14",
                                            na = "-") %>%
  rename(year_raw = `...1`,  `Ethnicity Employment Gap` = `...7`) %>%
  select(year_raw, White, `Minority Ethnic`, `Ethnicity Employment Gap`) %>%
  separate(col = year_raw, sep = " - ", into = c("year_temp_left","year_temp_right")) %>%
  mutate(year = paste0(str_extract(year_temp_left, "(?<=20)([0-9]{2})"),
                       "/",
                       str_extract(year_temp_right, "(?<=20)([0-9]{2})"))) %>%
  select(-c(year_temp_left, year_temp_right)) %>%
  relocate(year, .before = everything())

# %>%
#   pivot_longer(cols = c(White,`Minority Ethnic`,`Ethnicity Employment Gap`), names_to = "category", values_to = "measure_value") %>%
#   mutate(category = factor(category, levels = c("Ethnicity Employment Gap",
#                                                 "White",
#                                                 "Minority Ethnic")))

 replace_file_fn(ethnicity_employment_gap_chart_data,
                 paste0(path_out, "/ethnicity_employment_gap_chart_data.rds"))


