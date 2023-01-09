
##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS----
##############################################.
alcohol_admissions = read_excel(paste0(path_in_pop, "Alcohol-related Hospital Statistics (Scotland) for Financial years 2021.xlsx"),
                     sheet = "Data", skip = 4) %>%
          filter(Group %in% c("Scotland","NHS Board")) %>%
          clean_names()


replace_file_fn(alcohol_admissions, paste0(path_out, "/alcohol_admissions.rds"))



















