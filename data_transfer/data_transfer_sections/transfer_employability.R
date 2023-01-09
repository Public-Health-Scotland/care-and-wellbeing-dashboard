##############################################.
# EMPLOYABILITY----
##############################################.



employability_FSS_referral = read_excel(paste0(path_in, "/publication-tables.xlsx"),
                                               sheet = "Fair Start Scotland (FSS)",
                                               range = "B5:F21",
                                               na = "N/A") %>%
  rename(`Starts from referrals` = `Starts from referrals (by referral date - see note 1 below)`) %>%
  select(-`Quarterly change`)  %>%
  clean_names() %>%
  mutate(quarter_left = str_extract(quarter, ".*(?= 20[0-9]{2})"),
         quarter_right = str_extract(quarter, "20[0-9]{2}$"),
         quarter_left_date = case_when( quarter_left == "January - March" ~ "01-01",
                                        quarter_left == "April - June" ~ "04-01",
                                        quarter_left == "July - September" ~ "07-01",
                                        quarter_left == "October - December" ~ "10-01",
                                        TRUE ~ "wrong"),
         quarter_left = case_when( quarter_left == "January - March" ~ " Q1",
                                    quarter_left == "April - June" ~ " Q2",
                                    quarter_left == "July - September" ~ " Q3",
                                    quarter_left == "October - December" ~ " Q4",
                                   TRUE ~ "wrong"),
         year_quarter = paste0(quarter_right, quarter_left),
         year_quarter_date = paste0(quarter_right, "-",quarter_left_date)) %>%
  select(-c(quarter_left, quarter_right, quarter, quarter_left_date)) %>%
  relocate(year_quarter, .before = everything()) %>%
  mutate(year_quarter_date = as.Date(year_quarter_date),
         pretty_date = year_quarter,
         geography = "Scotland",
         geography_type = "Scotland",
         indicator = format(starts_from_referrals, big.mark = ","),
         value = "employability")


replace_file_fn(employability_FSS_referral,
                paste0(path_out, "/employability_FSS_referral.rds"))








employability_FSS_start_raw = read_excel(paste0(path_in, "/publication-tables.xlsx"),
                                        sheet = "Fair Start Scotland (FSS)",
                                        range = "B33:M112",
                                        na = "N/A") %>%
  clean_names() %>%
  filter(!is.na(quarter_month)) %>%
  rename("sustained_employment_3_month" = "x3_months_sustained_employment_13_weeks",
         "sustained_employment_6_month" = "x6_months_sustained_employment_26_weeks",
         "sustained_employment_1_year" = "x1_year_sustained_employment_52_weeks") %>%
  select(c("quarter_month", "starts", "early_leavers", "job_starts", "sustained_employment_3_month", "sustained_employment_6_month", "sustained_employment_1_year"))




employability_FSS_start_quarter = employability_FSS_start_raw %>%
  filter(str_detect(quarter_month, " - ")) %>%
  mutate(quarter_left = str_extract(quarter_month, ".*(?= 20[0-9]{2})"),
         quarter_right = str_extract(quarter_month, "20[0-9]{2}$"),
         quarter_left_date = case_when( quarter_left == "January - March" ~ "01-01",
                                        quarter_left == "April - June" ~ "04-01",
                                        quarter_left == "July - September" ~ "07-01",
                                        quarter_left == "October - December" ~ "10-01",
                                        TRUE ~ "wrong"),
         quarter_left = case_when( quarter_left == "January - March" ~ " Q1",
                                   quarter_left == "April - June" ~ " Q2",
                                   quarter_left == "July - September" ~ " Q3",
                                   quarter_left == "October - December" ~ " Q4",
                                   TRUE ~ "wrong"),
         year_quarter = paste0(quarter_right, quarter_left),
         year_quarter_date = paste0(quarter_right, "-",quarter_left_date)) %>%
  select(-c(quarter_left, quarter_right, quarter_month, quarter_left_date)) %>%
  relocate(year_quarter, year_quarter_date, .before = everything())


employability_FSS_start_month = employability_FSS_start_raw %>%
  filter(!str_detect(quarter_month, " - ")) %>%
  mutate(year_quarter = parse_date(quarter_month, format = "%B %Y"),
         year_quarter_date = year_quarter) %>%
  select(-c(quarter_month)) %>%
  relocate(year_quarter, year_quarter_date, .before = everything()) %>%
  mutate(year_quarter =format(.$year_quarter, "%Y-%m"))



replace_file_fn(employability_FSS_start_quarter,
                paste0(path_out, "/employability_FSS_start_quarter.rds"))

replace_file_fn(employability_FSS_start_month,
                paste0(path_out, "/employability_FSS_start_month.rds"))




