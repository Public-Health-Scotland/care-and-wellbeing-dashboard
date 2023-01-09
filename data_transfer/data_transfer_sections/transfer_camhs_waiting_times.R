##############################################.
# CAMHS WAITING TIMES DATA PROCESSING ----
##############################################.

camhs = read_csv(paste0(path_in, "/camhs-adjusted-patients-seen.csv")) %>%
  clean_names() %>%
  mutate(hb2019 = hb) %>%
  left_join(., lookup_HB) %>%
  # Manually coding some of the HBs that have changed code/Scotland
  mutate(hb2019name = case_when(hb2019 == "S92000003" ~ "Scotland",
                                hb2019 == "S08000018" ~ "NHS Fife", # 2014 Lookup
                                hb2019 == "S08000021" ~ "NHS Greater Glasgow and Clyde", # 2018 lookup
                                hb2019 == "S08000023" ~ "NHS Lanarkshire", # 2014 Lookup
                                hb2019 == "S08000027" ~ "NHS Tayside", # 2014 Lookup
                                TRUE ~ hb2019name),
         date = ymd(paste0(month, "01")),
         prop18wks = number_of_patients_seen0to18weeks/total_patients_seen) %>%

  select(date, hb2019name, hb2019, total_patients_seen,
         number_of_patients_seen0to18weeks, prop18wks,
         number_of_patients_seen19to35weeks, number_of_patients_seen36to52weeks,
         number_of_patients_seen_over52weeks)

camhs2 = camhs %>%
  select(date,
         hb2019name,
         total_patients_seen,
         number_of_patients_seen0to18weeks,
         number_of_patients_seen19to35weeks,
         number_of_patients_seen36to52weeks,
         number_of_patients_seen_over52weeks) %>%
  pivot_longer(cols = starts_with("number"),
               values_to = "number",
               names_to = "wait_time") %>%
  mutate(wait_time = gsub("number_of_patients_seen", "", wait_time),
         wait_time = gsub("to", " to ", wait_time),
         wait_time = gsub("weeks", " weeks", wait_time),
         wait_time = gsub("_over", "Over ", wait_time),
         proportion = number/total_patients_seen) %>%
  mutate(geography_type = ifelse(hb2019name == "Scotland", "Scotland", "Health Board"),
         geography = hb2019name,
         indicator = scales::percent(proportion, accuracy = .1),
         value = "camhs_waiting_times",
         pretty_date = date)


replace_file_fn(camhs2,
                paste0(path_out, "/camhs_waiting_times2.rds"))
