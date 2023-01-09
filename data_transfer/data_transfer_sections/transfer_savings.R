##############################################.
# Savings----
##############################################.


savings_low_income_raw = read_excel(paste0(path_in, "/percentage of households with net annual household income of up to 30,000 that have no savings.xlsx"),
                                    skip = 2,
                                    na = c("*","-")) %>%
  clean_names()

savings_low_income = savings_low_income_raw %>%
  select( "year","council","net_income","no_savings","has_savings","do_not_know","refused") %>%
  pivot_longer(cols = c(no_savings, has_savings, do_not_know, refused), names_to = "savings", values_to = "percentage") %>%
  mutate(savings = case_when(savings == "no_savings" ~ "No savings",
            savings == "has_savings" ~ "Has savings",
            savings == "do_not_know" ~ "Do not know",
            savings == "refused" ~ "Refused",
            TRUE ~ "Wrong data")) %>%
  mutate(savings = factor(savings, levels = c("No savings",
                                              "Has savings",
                                              "Do not know",
                                              "Refused"))) %>%
  mutate(council = replace(council, council == "Edinburgh, City of", "City of Edinburgh")) %>%
  left_join(lookup_LA, by = c("council" = "ca2019name")) %>%
  mutate(ca2019 = replace(ca2019, council == "Scotland", "S92000003")) %>%
  select(-c(hb2019, hb2019name)) %>%
  mutate(year = as.character(year),
         pretty_date = year,
         indicator = ifelse(is.na(percentage), NA, paste0(percentage, "%")),
         geography = council,
         geography_type = ifelse(council == "Scotland", "Scotland", "Council Area"),
         value="savings")




replace_file_fn(savings_low_income,
                paste0(path_out, "/savings_low_income.rds"))
