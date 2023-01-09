##############################################.
# Percentage of households with problem debt ----
##############################################.


unmanageable_debt = read_csv(paste0(path_in, "/Percentage of households with problem debt.csv")) %>%
  clean_names() %>%
  # Summary table
  mutate(pretty_date = year,
         geography = "Scotland",
         geography_type = "Scotland",
         value = "unmanageable_debt",
         indicator = paste0(perc_with_problem_debt, "%"))

replace_file_fn(unmanageable_debt,
                paste0(path_out, "/unmanageable_debt.rds"))
