
###################Vaccinations####################


####The column names and excel names are specific to the vaccination programme and the time it occured ("2022 winter ...")

## Certain names may need to be updated to allow this transfer to work successfully

# dates: change these manually when running the transfer

recent_date <- "29 January 2023"
previous_date <- "15 November 2022"

#~~~~~~~~~~~~~~~~~~~~~

# read in paths
data_path_flu <- paste0(path_in_pop, "equality-winter-2022-flu.xlsx")
data_path_covid <- paste0(path_in_pop, "equality-winter-2022-covid-19.xlsx")

# read excels in
input_flu_vacc <- read_excel(data_path_flu, sheet = "SIMD - HB", skip=4) %>%
  mutate(value = "Flu vaccinations uptake")
input_covid_vacc <- read_excel(data_path_covid, sheet = "SIMD - HB", skip=4) %>%
  mutate(value = "COVID-19 vaccinations uptake")


## create data frame
vaccinations <- rbind(input_flu_vacc, input_covid_vacc) %>%
  select(1:3,6,8:10) %>%
  clean_names() %>%
  rename(previous = `x44866`,
         SIMD = "simd_2020_decile_1_most_deprived_10_least_deprived",
         geography = "health_board_name") %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland",
                                 ifelse(geography == "Not Known", "Not Known" ,"Health Board")))

# add in 0% for nhs boards with no population for certain SIMD categories - so the plot has a full x axis for all boards
add_ons <- vaccinations %>%
  filter(!(SIMD == "Not Known")) %>%
  select(health_board_code, geography, geography_type, value, SIMD, uptake_percent) %>%
  # add in incorrect value so can set a flag - needs to be a numeric so 111 is used randomly
  pivot_wider(names_from = "SIMD", values_from = "uptake_percent", values_fill = 111) %>%
  pivot_longer(cols = c("1", "2", "3", "4", "5",
                        "6", "7", "8", "9", "10"), values_to = "uptake_percent", names_to = "SIMD")

# bind together and update SIMD and dates to be factors and take the values defined above
vaccinations <- full_join(vaccinations, add_ons) %>%
  rename(recent = uptake_percent) %>%
  # add in fill flag where uptake_percent has been set to 0 for plot, f = filled
  mutate(fill_flag = ifelse(recent == 111, "f", ""),
         recent = ifelse(fill_flag == "f", 0, recent),
         SIMD = factor(SIMD, levels = c("1", "2", "3", "4", "5",
                                        "6", "7", "8", "9", "10", "Not Known"),
                       labels = c("1 (Most deprived)", "2", "3", "4", "5",
                                  "6", "7", "8", "9", "10 (Least deprived)", "Not Known")),
         previous = ifelse(is.na(previous), recent, previous)) %>%
  pivot_longer(cols = c(recent, previous), values_to = "percentage_uptake", names_to = "date") %>%

  ## add in specified dates
  mutate(date = recode(date, recent = recent_date,
                       previous = previous_date),
         date = factor(date, levels = c(previous_date, recent_date))) %>%
  arrange(geography, SIMD)



####### save out

vaccinations_flu <- vaccinations %>% filter(value == "Flu vaccinations uptake")
vaccinations_covid <- vaccinations %>% filter(value == "COVID-19 vaccinations uptake")

replace_file_fn(vaccinations_flu,
                paste0(path_out, "/vaccinations_flu.rds"))

replace_file_fn(vaccinations_covid,
                paste0(path_out, "/vaccinations_covid.rds"))

rm(data_path_flu,data_path_covid,
   input_flu_vacc,input_covid_vacc,
   vaccinations,
   vaccinations_flu,vaccinations_covid)



