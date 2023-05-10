##### ASTHMA HOSPITAL ADMISSIONS #########

data_path <-paste0(path_in_pop, "Asthma-diagnosis-by-nhs-board-of-residence-2021-22.xlsx")
data_sheet_1718 <- "Data1"
data_sheet_1819 <- "Data2"
data_sheet_1920 <- "Data3"
data_sheet_2021 <- "Data4"
data_sheet_2122 <- "Data5"


input_asthma_admissions_1718 <- read_excel(data_path, sheet = data_sheet_1718, col_names = TRUE)
input_asthma_admissions_1819 <- read_excel(data_path, sheet = data_sheet_1819, col_names = TRUE)
input_asthma_admissions_1920 <- read_excel(data_path, sheet = data_sheet_1920, col_names = TRUE)
input_asthma_admissions_2021 <- read_excel(data_path, sheet = data_sheet_2021, col_names = TRUE)
input_asthma_admissions_2122 <- read_excel(data_path, sheet = data_sheet_2122, col_names = TRUE)


input_asthma_admissions <- rbind(input_asthma_admissions_1718, input_asthma_admissions_1819, input_asthma_admissions_1920,
                                 input_asthma_admissions_2021, input_asthma_admissions_2122) %>%
  filter(grepl('Asthma', lookup)) %>%
  clean_names()


input_asthma_admissions %<>%
  select(lookup, stays_number, stays_rate) %>%
  mutate(lookup = str_remove(lookup, pattern = "Asthma")) %>%
  separate(lookup, into = c("date","lookup"), sep = 7) %>%
  separate(lookup, into = c("lookup", "age_group"), sep = " - ")

input_asthma_admissions_male <- input_asthma_admissions %>%
  filter(grepl("Male", lookup)) %>%
  separate(lookup, into = c("lookup", "sex"), sep = -4)

input_asthma_admissions_female <- input_asthma_admissions %>%
  filter(grepl("Female", lookup)) %>%
  separate(lookup, into = c("lookup", "sex"), sep = -6)

input_asthma_admissions_all <- input_asthma_admissions %>%
  filter(grepl("All Sexes", lookup)) %>%
  separate(lookup, into = c("lookup", "sex"), sep = -9)

input_asthma_admissions <- rbind(input_asthma_admissions_all, input_asthma_admissions_female, input_asthma_admissions_male)

input_asthma_admissions %<>%
  mutate(provisional = ifelse(str_starts(lookup, "p"),"1","0"),
         lookup = ifelse(provisional == "1", substring(lookup,2), lookup),
         lookup = recode(lookup, "NHS Ayrshire & Arran" = "NHS Ayrshire and Arran",
                         "NHS Dumfries & Galloway" = "NHS Dumfries and Galloway",
                         "NHS Greater Glasgow & Clyde" = "NHS Greater Glasgow and Clyde")) %>%
  mutate(geog_type = ifelse(lookup == "All Scottish and Non-Scottish Residents", "Scotland",
                                 ifelse(str_starts(lookup, "NHS"), "Health Board", "Other")),
         geography = lookup
         ) %>%
  mutate(geog = recode(lookup, `All Scottish and Non-Scottish Residents` = "Scotland")) %>%
  mutate(age_group = str_remove(age_group, " years"),
         age_group = factor(age_group, levels = c( "0-4", "5-9", "10-14", "15-19", "<18", "20-24", "25-29", "30-34",
                                                   "35-39", "40-44",  "45-49", "50-54", "55-59", "60-64", "65+",
                                                   "65-69", "70-74", "75+", "75-79", "80-84", "85+",  "85-89", "90+", "All Ages"))) %>%
  arrange(age_group) %>%
  summary_format_function(date = .$date,
                          geog_type = .$geog_type,
                          geog = .$geog,
                          indicator_in = .$stays_number,
                          value_in = "asthma_admissions") %>%
  select(-c(geog, geog_type))



replace_file_fn(input_asthma_admissions,
                paste0(path_out, "/asthma_admissions.rds"))

rm(input_asthma_admissions, input_asthma_admissions_1718, input_asthma_admissions_1819,
   input_asthma_admissions_1920, input_asthma_admissions_2021, input_asthma_admissions_2122,
   input_asthma_admissions_all, input_asthma_admissions_female, input_asthma_admissions_male)
