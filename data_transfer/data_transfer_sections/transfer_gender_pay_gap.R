##############################################.
# GENDER PAY GAP----
##############################################.
gender_pay_gap_all = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                        sheet = "Table 2.2",
                                        range = "A6:L14",
                                        na = ":") %>%
  rename(`year` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Men", .x), .cols = `Full-time...2`:`All...4`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Woman", .x), .cols = `Full-time...6`:`All...8`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Pay Gap", .x), .cols = `Full-time...10`:`All...12`) %>%
  select(-`...5`, -`...9`) %>%
  mutate(sector = "All")



gender_pay_gap_public = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                sheet = "Table 2.2",
                                range = "A17:L25",
                                na = ":") %>%
  rename(`year` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Men", .x), .cols = `Full-time...2`:`All...4`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Woman", .x), .cols = `Full-time...6`:`All...8`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Pay Gap", .x), .cols = `Full-time...10`:`All...12`) %>%
  select(-`...5`, -`...9`) %>%
  mutate(sector = "Public")


gender_pay_gap_private = read_excel(paste0(path_in, "/Annual+Survey+of+Hours+and+Earnings+2021+-+Tables.xlsx"),
                                   sheet = "Table 2.2",
                                   range = "A28:L36",
                                   na = ":") %>%
  rename(`year` = `...1`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Men", .x), .cols = `Full-time...2`:`All...4`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Woman", .x), .cols = `Full-time...6`:`All...8`) %>%
  rename_with(~gsub("[.]{3}[0-9]*", "...Pay Gap", .x), .cols = `Full-time...10`:`All...12`) %>%
  select(-`...5`, -`...9`) %>%
  mutate(sector = "Private")





gender_pay_gap_by_sector = rbind(gender_pay_gap_all, gender_pay_gap_public, gender_pay_gap_private) %>%
  pivot_longer(cols = ends_with(c("...Men","...Woman", "...Pay Gap")), names_to = "mixed_categories", values_to = "measure_value") %>%
  separate(col = mixed_categories, into = c("work_pattern", "gender"), sep = "[.]{3}" ) %>%
  mutate(sector = factor(sector, levels = c( "All", "Public", "Private")),
         work_pattern = factor(work_pattern, levels = c( "All", "Full-time", "Part-time")),
         gender = factor(gender, levels = c( "Men", "Woman", "Pay Gap"))) %>%
  mutate(value = "gender_pay_gap",
         geography = "Scotland",
         geography_type = "Scotland",
         indicator = paste0(measure_value, "%"),
         pretty_date = year)



replace_file_fn(gender_pay_gap_by_sector,
                paste0(path_out, "/gender_pay_gap_by_sector.rds"))




