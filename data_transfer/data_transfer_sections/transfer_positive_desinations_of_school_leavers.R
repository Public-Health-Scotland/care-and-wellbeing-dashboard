##############################################.
# Positive desinations of school leavers----
##############################################.



positive_destinations_school_leavers = read_excel(paste0(path_in, "/supplementary-tables.xlsx"),
                                        sheet = "Table 3",
                                        range = "A5:N28",
                                        na = c("[z]","[c]")) %>%
  rename("category" = "Pupil Characteristic (Category)", "characteristic" = "Pupil Characteristic") %>%
  mutate(category = gsub(" \\[note [0-9]+\\]", "", category),
         characteristic = gsub(" \\[note [0-9]+\\]", "", characteristic)) %>%
  pivot_longer(`2009/10`:`2020/21`, names_to = "financial_year", values_to = "percent") %>%
  mutate(category = factor(category, levels = c("All Leavers",
                                            "Sex",
                                            "Ethnicity",
                                            "Urban/Rural",
                                            "Additional Support Needs")),
         percent = round_half_up(percent, digits = 2)
         ) %>%
  filter(!(characteristic %in% c("White - UK", "White - Other"))) %>%
  mutate(geography = "Scotland",
         geography_type = "Scotland",
         value = "positive_destinations",
         indicator = paste0(round_half_up(percent, 1), "%"),
         pretty_date = financial_year)





replace_file_fn(positive_destinations_school_leavers,
                paste0(path_out, "/positive_destinations_school_leavers.rds"))


