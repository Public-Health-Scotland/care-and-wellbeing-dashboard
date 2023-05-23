
###################Vaccinations####################


####The column names and excel names are specific to the vaccination programme and the time it occured ("2022 winter ...")

## Certain names may need to be updated to allow this transfer to work successfully

data_path_flu <- paste0(path_in_pop, "equality-winter-2022-flu.xlsx")
data_path_covid <- paste0(path_in_pop, "equality-winter-2022-covid-19.xlsx")

input_flu_vacc <- read_excel(data_path_flu, sheet = "SIMD - HB", skip=4) %>%
  mutate(value = "Flu vaccinations uptake")
input_covid_vacc <- read_excel(data_path_covid, sheet = "SIMD - HB", skip=4) %>%
  mutate(value = "COVID-19 vaccinations uptake")


vaccinations <- rbind(input_flu_vacc, input_covid_vacc) %>%
  select(1:6,8:10) %>%
  clean_names() %>%
  rename(November = `x44866`,
         SIMD = "simd_2020_decile_1_most_deprived_10_least_deprived",
         geography = "health_board_name") %>%
  filter(!(SIMD == "Not Known")) %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland",
                                 ifelse(geography == "Not Known", "Not Known" ,"Health Board")),
         SIMD = factor(SIMD, levels = c("1", "2", "3", "4", "5",
                                        "6", "7", "8", "9", "10")))


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



