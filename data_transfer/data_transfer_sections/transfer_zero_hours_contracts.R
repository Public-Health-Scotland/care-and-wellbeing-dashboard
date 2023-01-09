##############################################.
# ZERO-HOURS CONTRACTS----
##############################################.

zero_hour_contracts_raw = read_excel(paste0(path_in, "/emp17may2022.xlsx"),
                                        sheet = "4",
                                        range = "A5:AM27",
                                        na = "N/A") %>%
  select(`...1`, `In employment on a zero-hours contract (thousands)...38`, `Percentage of people in employment on a zero-hours contract...39`) %>%
  rename(year_quarter = `...1`,
    number_of_people = `In employment on a zero-hours contract (thousands)...38`,
         percent_of_people = `Percentage of people in employment on a zero-hours contract...39`) %>%
  mutate(quarter_left = str_extract(year_quarter, ".*(?= 20[0-9]{2}.*)"),
         quarter_right = str_extract(year_quarter, "20[0-9]{2}"),

         quarter_left = case_when( quarter_left == "Jan-Mar" ~ " Q1",
                                   quarter_left == "Apr-Jun" ~ " Q2",
                                   quarter_left == "Jul-Sep" ~ " Q3",
                                   quarter_left == "Oct-Dec" ~ " Q4",
                                   TRUE ~ "wrong"),
         year_quarter = paste0(quarter_right, quarter_left)) %>%
select(-c(quarter_left, quarter_right))

quarter_range = tibble(date = seq(as.Date("2013-10-01"), as.Date("2022-01-01"), "month")) %>%
 mutate(date = paste0(year(date), " Q", quarter(date))) %>%
  unique()



zero_hour_contracts = quarter_range %>%
  left_join(zero_hour_contracts_raw, by = c("date" = "year_quarter")) %>%
  mutate(geography = "Scotland",
         geography_type = "Scotland",
         value = "zero_hours_contracts",
         indicator = paste0(round_half_up(percent_of_people, 2), "%"),
         pretty_date = date)


replace_file_fn(zero_hour_contracts,
                paste0(path_out, "/zero_hour_contracts.rds"))






