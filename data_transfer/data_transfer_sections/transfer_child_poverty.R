##############################################.
# Child poverty----
##############################################.
# Read in the data


poverty <- read_excel(paste0(path_in, "/data2023.xlsx"),
                      sheet = "1", skip = 6, n_max = 4)%>%
   pivot_longer(cols = 2:ncol(.),
               names_to = "financial_year",
               values_to = "proportion") %>%
  filter(Group %in% c("Children", "All people")) %>%
  # Summary table
  mutate(pretty_date = financial_year,
         indicator = scales::percent(proportion, accuracy = .1),
         geography = "Scotland",
         geography_type = "Scotland",
         value = "child_poverty")


# Save output
replace_file_fn(poverty,
                paste0(path_out, "/child_poverty.rds"))
