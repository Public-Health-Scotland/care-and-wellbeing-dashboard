####################################################.
# ELC UPTAKE DATA PROCESSING ----
####################################################.

elc_uptake_3yo <- read_excel(paste0(path_in, "/Data Collections % of children taking 1140.xlsx"),
                             range = "A2:D8") %>%
  clean_names() %>%
  mutate(breakdown = "Eligible 3-5 year olds",
         region = "Scotland")



elc_uptake_2yo <- read_excel(paste0(path_in, "/Data Collections % of children taking 1140.xlsx"),
                             range = "A11:D17") %>%
  clean_names() %>%
  mutate(breakdown = "Eligible 2 year olds",
         region = "Scotland")

elc_uptake <- bind_rows(elc_uptake_2yo, elc_uptake_3yo) %>%
  rename(date = "collection",
         percent = "percent_taking_1140",
         n = "taking_1140")

# Formatting for summary table
elc_uptake %<>%
  mutate(geography = region,
         geography_type = "Scotland",
         value = ifelse(str_detect(breakdown, "3-5"), "childcare_uptake_three_to_five", "childcare_uptake_two"),
         indicator = scales::percent(percent, .1),
         pretty_date = date)

replace_file_fn(elc_uptake,
                paste0(path_out, "/childcare_elc_uptake.rds"))

