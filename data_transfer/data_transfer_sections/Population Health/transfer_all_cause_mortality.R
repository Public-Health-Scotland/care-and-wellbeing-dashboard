##############################################.
# ALL-CAUSE MORTALITY (15-44)----
##############################################.

# Get all the names of the excel sheets to read in a loop
names = excel_sheets(paste0(path_in_pop,
                            "deaths-time-series-by age and council area.xlsx")) %>%
  as_tibble() %>%
  filter(value != "Links")

# New names for columns as these are broken when read in
col_names = c("geography", "all_ages", "age0", "age1-4", "age5-9", "age10-14",
              "age15-19", "age20-24", "age25-29", "age30-34", "age35-39", "age40-44",
              "age45-49", "age50-54", "age55-59", "age60-64", "age65-69", "age70-74",
              "age75-79", "age80-84", "age85-89", "age90+")


for (name in names$value) {

  print(name)
  data1 = read_excel(paste0(path_in_pop,
                            "deaths-time-series-by age and council area.xlsx"),
                     sheet = name, skip = 3) %>% clean_names() %>%
    select(1:22)

  names(data1) = col_names

  data2 = data1 %>%
    slice(-c(1,3,36:39)) %>%
    mutate(across(starts_with("age"), as.numeric)) %>%
    pivot_longer(cols = starts_with("age"), names_to = "age_band", values_to = "deaths") %>%
    replace_na(list(deaths = 0)) %>%
    mutate(age_band = gsub("age", "", age_band),
           geography = gsub("2", "", geography),
           geography = ifelse(geography == "SCOTLAND", "Scotland", geography),
           geography_type = ifelse(geography == "Scotland", "Scotland", "Council Area"),
           year = name)
  # Name the object
  assign(paste0("deaths_", name),data2)
}

# Merge the dataframes

deaths = do.call(rbind,
                 list(deaths_1997, deaths_1998, deaths_1999, deaths_2000,
                      deaths_2001, deaths_2002, deaths_2003, deaths_2004,
                      deaths_2005, deaths_2006, deaths_2007, deaths_2008,
                      deaths_2009, deaths_2010, deaths_2011, deaths_2012,
                      deaths_2013, deaths_2014, deaths_2015, deaths_2016,
                      deaths_2017, deaths_2018, deaths_2019, deaths_2020,
                      deaths_2021))

rm(deaths_1997, deaths_1998, deaths_1999, deaths_2000,
   deaths_2001, deaths_2002, deaths_2003, deaths_2004,
   deaths_2005, deaths_2006, deaths_2007, deaths_2008,
   deaths_2009, deaths_2010, deaths_2011, deaths_2012,
   deaths_2013, deaths_2014, deaths_2015, deaths_2016,
   deaths_2017, deaths_2018, deaths_2019, deaths_2020,
   deaths_2021)


# Join on master lookup for CA

lookup = master_lookup %>%
  group_by(ca2019name, hb2019name) %>%
  summarise()

deaths %<>%
  left_join(., lookup, by=c("geography" = "ca2019name"))



# Calculate rates against population estimates
ca_pop_est <- readRDS("/conf/linkage/output/lookups/Unicode/Populations/Estimates/CA2019_pop_est_1981_2021.rds")

ca_pop_est %<>%
  # Create age bands
  mutate(age_band = case_when(age == 0 ~ "0",
                              age %in% 1:4 ~ "1-4",
                              age %in% 5:9 ~ "5-9",
                              age %in% 10:14 ~ "10-14",
                              age %in% 15:19 ~ "15-19",
                              age %in% 20:24 ~ "20-24",
                              age %in% 25:29 ~ "25-29",
                              age %in% 30:34 ~ "30-34",
                              age %in% 35:39 ~ "35-39",
                              age %in% 40:44 ~ "40-44",
                              age %in% 45:49 ~ "45-49",
                              age %in% 50:54 ~ "50-54",
                              age %in% 55:59 ~ "55-59",
                              age %in% 60:64 ~ "60-64",
                              age %in% 65:69 ~ "65-69",
                              age %in% 70:74 ~ "70-74",
                              age %in% 75:79 ~ "75-79",
                              age %in% 80:84 ~ "80-84",
                              age %in% 85:89 ~ "85-89",
                              age >= 90 ~ "90+")) %>%
  # Agg to age band
  group_by(year, age_band, ca2019name) %>%
  summarise(pop = sum(pop)) %>%
  rename(geography = ca2019name)

# Match variable type to data
ca_pop_est$year = as.character(ca_pop_est$year)

# Get Scotland population
scotland_pop = ca_pop_est %>%
  group_by(year, age_band) %>%
  summarise(pop = sum(pop)) %>%
  mutate(geography = "Scotland")

# Join to data
ca_pop_est = rbind(ca_pop_est, scotland_pop)

# Join population onto data
deaths = left_join(deaths, ca_pop_est)

deaths_hb = deaths %>%
  group_by(hb2019name, year, age_band) %>%
  summarise(deaths = sum(deaths), pop = sum(pop)) %>%
  drop_na(hb2019name) %>%
  mutate(geography_type = "Health Board") %>%
  rename(geography = hb2019name)

deaths %<>%
  select(-hb2019name, -all_ages)

deaths = rbind(ungroup(deaths), ungroup(deaths_hb))

# Getting age bands between 15 to 44
age15to44 = c("15-19", "20-24", "25-29", "30-34", "35-39", "40-44")
# Creating indicator flag
deaths %<>%
  mutate(indicator_age = ifelse(age_band %in% age15to44, "15 to 44", "Other"),
         rate = deaths/pop*100000)



summary_deaths = deaths %>%
  filter(indicator_age == "15 to 44") %>%
  group_by(geography, geography_type, year) %>%
  summarise(pop = sum(pop), deaths = sum(deaths)) %>%
  mutate(rate = deaths/pop*100000) %>%
  ungroup() %>%
  summary_format_function(., .$year, .$geography_type, .$geography, round_half_up(.$rate, 1),
                          "all-cause_mortality")

replace_file_fn(deaths,
                paste0(path_out, "/all_cause_mortality.rds"))

replace_file_fn(summary_deaths,
                paste0(path_out, "/summary_all-cause-mortality.rds"))
