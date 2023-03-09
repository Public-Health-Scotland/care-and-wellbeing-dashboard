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
         lookup = ifelse(provisional == "1", substring(lookup,2), lookup)) %>%
  mutate(geog_type = ifelse(lookup == "All Scottish and Non-Scottish Residents", "Scotland",
                                 ifelse(str_starts(lookup, "NHS"), "Health Board", "Other")),
         geography = lookup
         ) %>%
  mutate(age_group = str_remove(age_group, " years")) %>%
  summary_format_function(date = .$date,
                          geog_type = .$geog_type,
                          geog = .$lookup,
                          indicator_in = .$stays_number,
                          value_in = "asthma_admissions")



replace_file_fn(input_asthma_admissions,
                paste0(path_out, "/asthma_admissions.rds"))

rm(input_asthma_admissions, input_asthma_admissions_1718, input_asthma_admissions_1819,
   input_asthma_admissions_1920, input_asthma_admissions_2021, input_asthma_admissions_2122,
   input_asthma_admissions_all, input_asthma_admissions_female, input_asthma_admissions_male)
