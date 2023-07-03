
##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS----
##############################################.
alcohol_admissions = read_excel(paste0(path_in_pop, "Alcohol-related Hospital Statistics (Scotland) for Financial years 2022.xlsx"),
                                sheet = "Data", skip = 4) %>%
  filter(Group %in% c("Scotland","NHS Board")) %>%
  clean_names() %>%
  mutate(group = recode(group, `NHS Board` = "Health Board")) %>%
  rename(geography_type = group, geography = sub_group_select_group_first) %>%
  filter(str_detect(financial_year, "20")) %>%
  filter(!(financial_year %in% c("2000/01","2001/02","2002/03","2003/04","2004/05","2005/06","2006/07","2007/08")))




replace_file_fn(alcohol_admissions, paste0(path_out, "/alcohol_admissions.rds"))



















