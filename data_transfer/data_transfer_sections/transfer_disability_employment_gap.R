##############################################.
# DISABILITY EMPLOYMENT GAP----
##############################################.

disability_employment_gap_not_EAD = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                sheet = "Table 1.5A",
                                range = "A4:AI38",
                                na = "-") %>%
  rename(local_authority = `...1`) %>%
  filter(local_authority != "Local Authority area:") %>%
  select(local_authority, matches("[0-9]{4}")) %>%
  mutate(category = "Not Equality Act Disabled") %>%
  mutate(local_authority = replace(local_authority, local_authority == "Edinburgh, City of", "City of Edinburgh"))

disability_employment_gap_EAD = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                               sheet = "Table 1.5A",
                                               range = "A42:AI76",
                                               na = "-") %>%
  rename(local_authority = `...1`) %>%
  filter(local_authority != "Local Authority area:") %>%
  select(local_authority, matches("[0-9]{4}")) %>%
  mutate(category = "Equality Act Disabled") %>%
  mutate(local_authority = replace(local_authority, local_authority == "Edinburgh, City of", "City of Edinburgh"))


disability_employment_gap_GAP = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                           sheet = "Table 1.5A",
                                           range = "A80:AI114",
                                           na = "-") %>%
  rename(local_authority = `...1`) %>%
  filter(local_authority != "Local Authority area:") %>%
  select(local_authority, matches("[0-9]{4}")) %>%
  mutate(category = "Disability Employment Gap") %>%
  mutate(local_authority = replace(local_authority, local_authority == "Edinburgh, City of", "City of Edinburgh"))


disability_employment_gap_data = rbind(disability_employment_gap_not_EAD,
      disability_employment_gap_EAD,
      disability_employment_gap_GAP) %>%
  pivot_longer(cols = `2004`:`2020`, names_to = "year", values_to = "measure_value") %>%
  mutate(year = str_extract(year, "^20[0-9]{2}")) %>%
  mutate(category = factor(category, levels = c("Equality Act Disabled",
                                                "Not Equality Act Disabled",
                                                "Disability Employment Gap"))) %>%
  left_join(lookup_LA, by = c("local_authority" = "ca2019name")) %>%
  mutate(ca2019 = replace(ca2019, local_authority == "Scotland", "S92000003")) %>%
  select(-c(hb2019name, hb2019)) %>%
  filter(as.numeric(year) >= 2014) %>%
  mutate(geography = local_authority,
         geography_type = ifelse(geography == "Scotland", "Scotland",
                                 "Council Area"),
         pretty_date = year,
         value = "disability_employment_gap",
         indicator = paste0(measure_value, "%"))




replace_file_fn(disability_employment_gap_data,
                paste0(path_out, "/disability_employment_gap_data.rds"))


