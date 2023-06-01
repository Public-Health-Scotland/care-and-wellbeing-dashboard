###################### SCREENING UPTAKE ############################


##### BREAST #############

breast_board_path <- paste0(path_in_pop, "breast_screening_uptake_by_board.xlsx")
breast_simd_path <- paste0(path_in_pop, "breast_screening_uptake_by_SIMD.xlsx")


input_breast_board <- read_excel(breast_board_path, range = "A7:M24") %>%
  rename("geography" = `NHS Board of Residence`) %>%
  filter(!is.na(geography))


previous_years <- ncol(input_breast_board)-2
current_year <- ncol(input_breast_board)-0

breast_by_board <- input_breast_board %>%
  select(1, previous_years:current_year) %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland", "Health Board"),
         geography = str_replace(geography, "&", "and"),
         geography = ifelse(geography == "Scotland", geography, paste("NHS", geography))) %>%
  pivot_longer(cols = starts_with("2"), names_to = "year_range", values_to = "percentage_uptake") %>%
  mutate(year_range = str_replace(year_range, "/", "-")) %>%
  select(geography_type, geography, year_range, percentage_uptake)


input_breast_simd <- read_excel(breast_simd_path, range = "A6:S12") %>%
  select(-starts_with(".")) %>%
  rename("SIMD" = "SIMD2 Deprivation Category") %>%
  filter(!is.na(SIMD)) %>%
  pivot_longer(cols = 2:16, names_to = "geography", values_to = "percentage_uptake") %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland", "Health Board"),
         geography = ifelse(geography == "Scotland", geography, paste("NHS", geography))) %>%
  arrange(geography, SIMD) %>%
  select(geography_type, geography, SIMD, percentage_uptake)


replace_file_fn(breast_by_board,
                paste0(path_out, "/screening_breast_board.rds"))

replace_file_fn(input_breast_simd,
                paste0(path_out, "/screening_breast_simd.rds"))

rm(breast_board_path, breast_simd_path,
   input_breast_board, input_breast_simd,
   previous_years, current_year,
   breast_by_board)


##########################

####### BOWEL ############

bowel_path <- paste0(path_in_pop, "bowel_screening_uptake.xlsx")

input_bowel_board <- read_excel(bowel_path, sheet = "KPI_1", range = "B16:Q20") %>%
  rename("Sex" = `...1`) %>%
  filter(!is.na(Sex)) %>%
  pivot_longer(cols = 2:16, names_to = "geography", values_to = "percentage_uptake") %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland", "Health Board"),
         geography = ifelse(geography == "Scotland", geography, paste("NHS", geography))) %>%
  arrange(geography, Sex) %>%
  select(geography_type, geography, Sex, percentage_uptake)


input_bowel_simd <- read_excel(bowel_path, sheet = "KPI_2", range = "A16:Q39") %>%
  rename("Sex" = `...1`,
         "SIMD" = `...2`) %>%
  slice(-1) %>%
  mutate(Sex = zoo::na.locf(Sex),
         SIMD = recode(SIMD, "1 most deprived" = "1 (Most deprived)",
                       "5 least deprived" = "5 (Least deprived)")) %>%
  filter(!is.na(SIMD)) %>%
  pivot_longer(cols = 3:17, names_to = "geography", values_to = "percentage_uptake") %>%
  mutate(geography_type = ifelse(geography == "Scotland", "Scotland", "Health Board"),
         geography = ifelse(geography == "Scotland", geography, paste("NHS", geography))) %>%
  arrange(geography, SIMD) %>%
  select(geography_type, geography, Sex, SIMD, percentage_uptake)


replace_file_fn(input_bowel_board,
                paste0(path_out, "/screening_bowel_board.rds"))

replace_file_fn(input_bowel_simd,
                paste0(path_out, "/screening_bowel_simd.rds"))

rm(bowel_path,
   input_bowel_board, input_bowel_simd)
##########################
