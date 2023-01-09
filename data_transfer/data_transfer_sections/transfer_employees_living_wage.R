##############################################.
# EMPLOYEES ON THE LIVING WAGE by sector ----
##############################################.

employees_living_wage_less = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                              sheet = "Table 5.5",
                                              range = "A6:W10",
                                              na = ":") %>%
  rename(`sector` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-level", .x), .cols = `2012...2`:`2021...11`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-proportion", .x), .cols = `2012...14`:`2021...23`) %>%
  select(-`Annual change`, -`...13`) %>%
  mutate(earning = "Earning less than the living wage")



employees_living_wage_more = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                        sheet = "Table 5.5",
                                        range = "A14:W18",
                                        na = ":") %>%
  rename(`sector` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-level", .x), .cols = `2012...2`:`2021...11`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-proportion", .x), .cols = `2012...14`:`2021...23`) %>%
  select(-`Annual change`, -`...13`) %>%
  mutate(earning = "Earning the living wage or more")



employees_living_wage_by_sector = rbind(employees_living_wage_less, employees_living_wage_more) %>%
  pivot_longer(cols = ends_with(c("level","proportion")), names_to = "year", values_to = "measure_value") %>%
  separate(col = year, into = c("year", "measure"))



replace_file_fn(employees_living_wage_by_sector,
                paste0(path_out, "/employees_living_wage_by_sector.rds"))



##############################################.
# EMPLOYEES ON THE LIVING WAGE by local authority ----
##############################################.


employees_living_wage_less = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                        sheet = "Table 5.7",
                                        range = "A6:W39",
                                        na = c(":","x","..")) %>%
  rename(`local_authority` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-level", .x), .cols = `2012...2`:`2021...11`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-proportion", .x), .cols = `2012...14`:`2021...23`) %>%
  select(-c(`Annual Change`, `...13`)) %>%
  mutate(earning = "Earning less than the living wage")



employees_living_wage_more = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                        sheet = "Table 5.7",
                                        range = "A44:W77",
                                        na = c(":","x","..")) %>%
  rename(`local_authority` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-level", .x), .cols = `2012...2`:`2021...11`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "-proportion", .x), .cols = `2012...14`:`2021...23`) %>%
  select(-c(`Annual Change`, `...13`)) %>%
  mutate(earning = "Earning the living wage or more")




employees_living_wage_by_LA = rbind(employees_living_wage_less, employees_living_wage_more) %>%
  pivot_longer(cols = ends_with(c("level","proportion")), names_to = "year", values_to = "measure_value") %>%
  separate(col = year, into = c("year", "measure") ) %>%
  left_join(lookup_LA, by = c("local_authority" = "ca2019name")) %>%
  mutate(local_authority = replace(local_authority, local_authority == "All", "Scotland")) %>%
  mutate(ca2019 = replace(ca2019, local_authority == "Scotland", "S92000003")) %>%
  filter(#local_authority != "All",
         #remove the filter if level data is needed
         measure == "proportion") %>%
  mutate(earning = factor(earning, levels = c("Earning less than the living wage",
                                              "Earning the living wage or more"))) %>%
  select("local_authority", "earning", "year", "measure", "measure_value", "ca2019" ) %>%
  mutate(value = "employees_living_wage",
         geography = local_authority,
         geography_type = ifelse(local_authority == "Scotland", "Scotland", "Council Area"),
         indicator = ifelse(is.na(measure_value), NA, paste0(measure_value, "%")),
         pretty_date = year)


replace_file_fn(employees_living_wage_by_LA,
                paste0(path_out, "/employees_living_wage_by_LA.rds"))

