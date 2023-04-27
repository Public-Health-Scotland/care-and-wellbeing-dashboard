####################################################.
# ECONOMIC INACTIVITY DATA PROCESSING ----
####################################################.

data_path <- paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx")
data_sheet = "Table 3.7"

economic_inactivity_scotland_rate <- bind_rows(read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "B5:D6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "I5:K6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "P5:R6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "W5:Y6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "AD5:AF6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "AK5:AM6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "AR5:AT6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "AY5:BA6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "BF5:BH6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "BM5:BO6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "BT5:BV6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "CA5:CC6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "CH5:CJ6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "CO5:CQ6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "CV5:CX6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "DC5:DE6"),
                                               read_excel(data_path,
                                                          sheet = data_sheet,
                                                          range = "DJ5:DL6")
                                               ) %>%
  mutate(year = seq(from = 2004, to = 2020, by = 1)) %>%
  select(year, `Wants to Work`, `Does Not\r\nWant to Work`) %>%
  pivot_longer(!year, names_to = "breakdown", values_to = "percent")


economic_inactivity_scotland_n <- bind_rows(read_excel(data_path, # 2004 table
                                                       sheet = data_sheet,
                                                       range = "B44:D45"),
                                            read_excel(data_path, # 2005 table
                                                       sheet = data_sheet,
                                                       range = "I44:K45"),
                                            read_excel(data_path, # 2006 table
                                                       sheet = data_sheet,
                                                       range = "P44:R45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "W44:Y45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "AD44:AF45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "AK44:AM45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "AR44:AT45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "AY44:BA45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "BF44:BH45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "BM44:BO45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "BT44:BV45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "CA44:CC45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "CH44:CJ45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "CO44:CQ45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "CV44:CX45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "DC44:DE45"),
                                            read_excel(data_path,
                                                       sheet = data_sheet,
                                                       range = "DJ44:DL45")
                                            ) %>%
  select(`Wants to Work`, `Does Not\r\nWant to Work`) %>%
  mutate(year = seq(from = 2004, to = 2020, by = 1)) %>%
  pivot_longer(!year, names_to = "breakdown", values_to = "n")

economic_inactivity_scotland <- economic_inactivity_scotland_n %>%
  left_join(., economic_inactivity_scotland_rate, by = c("year", "breakdown")) %>%
  select(year, breakdown, n, percent) %>%
  mutate(region = "Scotland")


# add region data

regions <- read_excel(data_path,
                      sheet = data_sheet,
                      range = "A8:A39",
                      col_names = FALSE)
regions <- as.list(regions$...1)

economic_inactivity_region_rate <- bind_rows(read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "B7:D39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "I7:K39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "P7:R39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "W7:Y39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AD7:AF39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AK7:AM39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AR7:AT39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AY7:BA39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BF7:BH39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BM7:BO39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BT7:BV39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CA7:CC39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CH7:CJ39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CO7:CQ39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CV7:CX39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "DC7:DE39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "DJ7:DL39",
                                                        col_types = "numeric"
                                                        )) %>%
  clean_names() %>%
  select(x1, x3) %>%
  rename(`Wants to Work` = x1,
         `Does Not\r\nWant to Work` = x3) %>%
  mutate(year = rep(2004:2020, each = 32),
         region = rep(regions, 17)) %>%
  pivot_longer(!c(year, region), names_to = "breakdown", values_to = "percent")


economic_inactivity_region_rate <- bind_rows(read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "B7:D39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "I7:K39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "P7:R39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "W7:Y39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AD7:AF39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AK7:AM39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AR7:AT39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "AY7:BA39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BF7:BH39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BM7:BO39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "BT7:BV39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CA7:CC39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CH7:CJ39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CO7:CQ39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "CV7:CX39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "DC7:DE39",
                                                        col_types = "numeric"
                                                        ),
                                             read_excel(data_path,
                                                        sheet = data_sheet,
                                                        range = "DJ7:DL39",
                                                        col_types = "numeric"
                                                        )) %>%
  clean_names() %>%
  select(x1, x3) %>%
  rename(`Wants to Work` = x1,
         `Does Not\r\nWant to Work` = x3) %>%
  mutate(year = rep(2004:2020, each = 32),
         region = rep(regions, 17)) %>%
  pivot_longer(!c(year, region), names_to = "breakdown", values_to = "percent")


economic_inactivity_region_n <- bind_rows(read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "B46:D78",
                                                     col_types = "numeric"),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "I46:K78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "P46:R78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "W46:Y78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "AD46:AF78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "AK46:AM78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "AR46:AT78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "AY46:BA78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "BF46:BH78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "BM46:BO78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "BT46:BV78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "CA46:CC78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "CH46:CJ78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "CO46:CQ78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "CV46:CX78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "DC46:DE78",
                                                     col_types = "numeric"
                                          ),
                                          read_excel(data_path,
                                                     sheet = data_sheet,
                                                     range = "DJ46:DL78",
                                                     col_types = "numeric"
                                          )) %>%
  clean_names() %>%
  select(x1, x3) %>%
  rename(`Wants to Work` = x1,
         `Does Not\r\nWant to Work` = x3) %>%
  mutate(year = rep(2004:2020, each = 32),
         region = rep(regions, 17)) %>%
  pivot_longer(!c(year, region), names_to = "breakdown", values_to = "n")

economic_inactivity_region <- economic_inactivity_region_n %>%
  left_join(., economic_inactivity_region_rate, by = c("year", "breakdown", "region")) %>%
  mutate(region = as.character(region))

economic_inactivity <- economic_inactivity_scotland %>%
  bind_rows(economic_inactivity_region) %>%
  select(year, region, breakdown, n, percent) %>%
  arrange(year)

economic_inactivity %<>%
  mutate(geography = region,
         geography_type = ifelse(region == "Scotland", "Scotland", "Council Area"),
         value = "economic_inactivity",
         indicator = paste0(percent, "%"),
         pretty_date = year,
         geography = recode(geography, "Edinburgh, City of" = "City of Edinburgh"))

replace_file_fn(economic_inactivity,
                paste0(path_out, "/economic_inactivity.rds"))

rm(economic_inactivity_scotland_rate, economic_inactivity_scotland_n, economic_inactivity_region_n, economic_inactivity_region_rate)
