##### ASTHMA HOSPITAL ADMISSIONS #########

data_path <-paste0(path_in_pop, "Asthma-diagnosis-by-nhs-board-of-residence-2021-22.xlsx")
data_sheet_1718 <- "Data1"
data_sheet_1819 <- "Data2"
data_sheet_1920 <- "Data3"
data_sheet_2021 <- "Data4"
data_sheet_2122 <- "Data5"

input_asthma_admissions_1718 <- read_excel(data_path, sheet = data_sheet_1718, col_names = TRUE) %>%
  filter(grepl('Asthma', lookup))
input_asthma_admissions_1819 <- read_excel(data_path, sheet = data_sheet_1819, col_names = TRUE) %>%
  filter(grepl('Asthma', lookup))
input_asthma_admissions_1920 <- read_excel(data_path, sheet = data_sheet_1920, col_names = TRUE) %>%
  filter(grepl('Asthma', lookup))
input_asthma_admissions_2021 <- read_excel(data_path, sheet = data_sheet_2021, col_names = TRUE) %>%
  filter(grepl('Asthma', lookup))
input_asthma_admissions_2122 <- read_excel(data_path, sheet = data_sheet_2122, col_names = TRUE) %>%
  filter(grepl('Asthma', lookup))


input_asthma_admissions <- rbind(input_asthma_admissions_1718, input_asthma_admissions_1819, input_asthma_admissions_1920,
                                 input_asthma_admissions_2021, input_asthma_admissions_2122)

input_asthma_admissions %<>%
  select(lookup, stays_Number, stays_Rate) %>%
  separate(lookup, into = c("Date","Everything"), sep = 7) %>%
  separate(Everything, into = c("Everything", "Ages"), sep = " - ")

input_asthma_admissions_male <- input_asthma_admissions %>%
  filter(grepl("Male", Everything)) %>%
  separate(Everything, into = c("Everything", "Sex"), sep = -4)

input_asthma_admissions_female <- input_asthma_admissions %>%
  filter(grepl("Female", Everything)) %>%
  separate(Everything, into = c("Everything", "Sex"), sep = -6)

input_asthma_admissions_all <- input_asthma_admissions %>%
  filter(grepl("All Sexes", Everything)) %>%
  separate(Everything, into = c("Everything", "Sex"), sep = -9)

input_asthma_admissions <- rbind(input_asthma_admissions_all, input_asthma_admissions_female, input_asthma_admissions_male)


input <- input_asthma_admissions %>%
  str_remove(input_asthma_admissions$Ages, pattern = "Asthma")


