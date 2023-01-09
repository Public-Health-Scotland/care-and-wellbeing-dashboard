##############################################.
# HOUSEHOLD SPENDING ----
##############################################.

household_spending = read_xlsx(paste0(path_in, "/Household Spending.xlsx")) %>%
  clean_names()

cost_of_living_parts = household_spending %>%
  filter(household_spending %in% c("Food & non-alcoholic drinks",
                                   "Housing, fuel & power",
                                   "Household goods & services")) %>%
  mutate(geography = "Scotland",
         geography_type = "Scotland",
         pretty_date = year)


replace_file_fn(cost_of_living_parts,
                paste0(path_out, "/household_spending.rds"))

rm(household_spending, cost_of_living_parts)
