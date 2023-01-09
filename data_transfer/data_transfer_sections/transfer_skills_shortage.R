####################################################.
# SKILLS SHORTAGE & VACANCIES DATA PROCESSING ----
####################################################.

#### create incidence of vacancies data frame (Table 1 & Table 2) - to be used as baseline? ####
incidence_vacancies_rownames <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                           sheet = "Recruitment and SSVs",
                                           range = "A6:A10") %>%
  rename(rowname = "...1")

incidence_vacancies_2020_total <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                             sheet = "Recruitment and SSVs",
                                             range = "B6:B10") %>%
  mutate(year = "2020") %>%
  bind_cols(incidence_vacancies_rownames)


incidence_vacancies_2017_total <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                             sheet = "Recruitment and SSVs",
                                             range = "B19:B23") %>%
  mutate(year = "2017") %>%
  bind_cols(incidence_vacancies_rownames)

incidence_vacancies_total <- bind_rows(incidence_vacancies_2017_total,
                                       incidence_vacancies_2020_total) %>%
  filter(!is.na(rowname)) %>%
  pivot_wider(names_from=rowname, values_from=c(Total)) %>%
  clean_names() %>%
  mutate(region = "Scotland",
         breakdown_type = "Scotland")

# get region data
incidence_vacancies_2017_by_region <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                 sheet = "Recruitment and SSVs",
                                                 range = "C19:P23") %>%
  mutate(year = "2017") %>%
  bind_cols(incidence_vacancies_rownames)

incidence_vacancies_2020_by_region <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                 sheet = "Recruitment and SSVs",
                                                 range = "C6:P10") %>%
  mutate(year = "2020") %>%
  bind_cols(incidence_vacancies_rownames)

incidence_vacancies_by_region <- bind_rows(incidence_vacancies_2017_by_region,
                                           incidence_vacancies_2020_by_region) %>%
  filter(!is.na(rowname)) %>%
  pivot_longer(!c(rowname, year), names_to = "region") %>%
  pivot_wider(names_from=rowname, values_from=c(value)) %>%
  clean_names() %>%
  mutate(breakdown_type = "ROA Region")

# create vacancies data file

incidence_of_vacancies = bind_rows(incidence_vacancies_total,
                                   incidence_vacancies_by_region) %>%
  rename(n_vacancies = "establishments_that_have_at_least_one_vacancy") %>%
  mutate(vacancy_type = "All Vacancies") %>%
  select(year, breakdown_type, region, vacancy_type, all_establishments, n_vacancies, percent)

#### skills shortage vacancies (Table 4 & 5) ####
incidence_ss_vacancies_rownames <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                              sheet = "Recruitment and SSVs",
                                              range = "A45:A49") %>%
  rename(rowname = "...1")

incidence_ss_vacancies_2020_total <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                sheet = "Recruitment and SSVs",
                                                range = "B45:B49") %>%
  mutate(year = "2020") %>%
  bind_cols(., incidence_ss_vacancies_rownames)

incidence_ss_vacancies_2017_total <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                sheet = "Recruitment and SSVs",
                                                range = "B58:B62") %>%
  mutate(year = "2017") %>%
  bind_cols(., incidence_ss_vacancies_rownames)

incidence_ss_vacancies_total <- bind_rows(incidence_ss_vacancies_2017_total,
                                          incidence_ss_vacancies_2020_total) %>%
  filter(!is.na(rowname)) %>%
  pivot_wider(names_from=rowname, values_from=c(Total)) %>%
  clean_names() %>%
  mutate(region = "Scotland",
         breakdown_type = "Scotland")

# get region data
incidence_ss_vacancies_2017_by_region <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                    sheet = "Recruitment and SSVs",
                                                    range = "C58:P62") %>%
  mutate(year = "2017") %>%
  bind_cols(incidence_ss_vacancies_rownames)

incidence_ss_vacancies_2020_by_region <- read_excel(paste0(path_in, "/scottish-employer-skills-survey-2020.xlsx"),
                                                 sheet = "Recruitment and SSVs",
                                                 range = "C45:P49") %>%
  mutate(year = "2020") %>%
  bind_cols(incidence_ss_vacancies_rownames)

incidence_ss_vacancies_by_region <- bind_rows(incidence_ss_vacancies_2017_by_region,
                                              incidence_ss_vacancies_2020_by_region) %>%
  filter(!is.na(rowname)) %>%
  pivot_longer(!c(rowname, year), names_to = "region") %>%
  pivot_wider(names_from=rowname, values_from=c(value)) %>%
  clean_names() %>%
  mutate(breakdown_type = "ROA Region")

# create skill shortage vacancies data frame

incidence_ss_vacancies <- bind_rows(incidence_ss_vacancies_total,
                                    incidence_ss_vacancies_by_region) %>%
  mutate(vacancy_type = "Skills Shortage Vacancies") %>%
  rename(n_vacancies = "establishments_that_have_a_skill_shortage_vacancy_prompted_or_unprompted")

vacancies <- bind_rows(incidence_of_vacancies, incidence_ss_vacancies)

vacancies %<>%
  mutate(geography = breakdown_type,
         pretty_date = year,
         geography_type = ifelse(breakdown_type == "Scotland", "Scotland", region),
         indicator = scales::percent(percent, accuracy = .1),
         value = "skills_shortage_vacancies")

replace_file_fn(vacancies,
                paste0(path_out, "/skills_shortage_vacancies.rds"))

