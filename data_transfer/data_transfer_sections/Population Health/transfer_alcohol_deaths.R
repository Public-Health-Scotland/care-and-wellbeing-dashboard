##### ALCOHOL-SPECIFIC DEATHS #########

data_path <-paste0(path_in_pop, "alcohol-specific-deaths-21-all-tabs.xlsx")
data_sheet_rate <- "Table_1"
data_sheet_ages <- "Table_2C"

input_alcohol_deaths_rates <- read_excel(data_path, sheet = data_sheet_rate,
                                         col_names = c("year", "number_all", "number_females", "number_males",
                                                       "rate_all", "lower_ci_all", "upper_ci_all",
                                                       "rate_females", "lower_ci_females", "upper_ci_females",
                                                       "rate_males", "lower_ci_males", "upper_ci_males"), range="A6:M48") %>%
  filter(!is.na(rate_all),
         year >= 2008)

pivot_number <- input_alcohol_deaths_rates %>% select(year, number_all, number_females, number_males) %>%
  pivot_longer(starts_with("number"), values_to = "number", names_to = "sex") %>%
  mutate(sex = recode(sex, number_all = "All sexes", number_females = "Female", number_males = "Male"))

pivot_rate <- input_alcohol_deaths_rates %>% select(year, rate_all, rate_females, rate_males) %>%
  pivot_longer(starts_with("rate"), values_to = "rate", names_to = "sex") %>%
  mutate(sex = recode(sex, rate_all = "All sexes", rate_females = "Female", rate_males = "Male"))

pivot_lower_ci <- input_alcohol_deaths_rates %>% select(year, lower_ci_all, lower_ci_females, lower_ci_males) %>%
  pivot_longer(starts_with("lower_ci"), values_to = "lower_ci", names_to = "sex") %>%
  mutate(sex = recode(sex, lower_ci_all = "All sexes", lower_ci_females = "Female", lower_ci_males = "Male"))

pivot_upper_ci <- input_alcohol_deaths_rates %>% select(year, upper_ci_all, upper_ci_females, upper_ci_males) %>%
  pivot_longer(starts_with("upper_ci"), values_to = "upper_ci", names_to = "sex") %>%
  mutate(sex = recode(sex, upper_ci_all = "All sexes", upper_ci_females = "Female", upper_ci_males = "Male"))

alcohol_list <- list(pivot_number, pivot_rate, pivot_lower_ci, pivot_upper_ci)

alcohol_deaths <- reduce(alcohol_list, full_join) %>%
  mutate(geography_type = "Scotland",
          geography = "Scotland")


### need to split sexes so can pivot seperately and then join

input_alcohol_deaths_ages <- read_excel(data_path, sheet = data_sheet_ages,
                                        col_names =  c("year", "sex", "measure", "10-24", "25-44", "45-64", "65-74", "75+"),
                                        range="A6:H89") %>%
  filter(year >= 2008) %>%
  pivot_longer(cols =  c("10-24", "25-44", "45-64", "65-74", "75+"), names_to = "age_group", values_to = "indicator") %>%
  select(-measure) %>%
  mutate(value = "alcohol_deaths",
         geography_type = "Scotland",
         geography = "Scotland",
         sex = recode(sex, Persons = "All sexes", Females = "Female", Males = "Male")) %>%
  summary_format_function(date = .$year,
                          geog_type = .$geography_type,
                          geog = .$geography,
                          indicator_in = .$indicator,
                          value_in = .$value)

replace_file_fn(alcohol_deaths,
                paste0(path_out, "/alcohol_deaths.rds"))

replace_file_fn(input_alcohol_deaths_ages,
                paste0(path_out, "/alcohol_deaths_by_age.rds"))




