##############################################.
# EXPERIENCE OF UNPAID CARERS ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Experience of unpaid carers"

input_unpaid_carers <- full_join(read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B3:F3")%>% # year
                                   clean_names() %>%
                                   mutate(across(everything(), as.character)) %>%
                                   pivot_longer(everything(), names_to = "column", values_to ="date"),

                                 read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B4:F4") %>% # strongly agree percentage
                                   clean_names() %>%
                                   mutate(across(everything(), as.character)) %>%
                                   pivot_longer(everything(), names_to = "column", values_to ="Strongly agree")) %>%
  full_join(.,
            read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B5:F5") %>% # agree percentage
              clean_names() %>%
              mutate(across(everything(), as.character)) %>%
              pivot_longer(everything(), names_to = "column", values_to ="Agree")) %>%
  full_join(.,
            read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B6:F6") %>% # neither agree/disagree percentage
              clean_names() %>%
              mutate(across(everything(), as.character)) %>%
              pivot_longer(everything(), names_to = "column", values_to ="Neither agree nor disagree")) %>%
  full_join(.,
            read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B7:F7") %>% # disagree
              clean_names() %>%
              mutate(across(everything(), as.character)) %>%
              pivot_longer(everything(), names_to = "column", values_to ="Disagree")) %>%
  full_join(., read_excel(data_path, sheet = data_sheet, col_names = FALSE, range = "B8:F8") %>% # strongly disagree
              clean_names() %>%
              mutate(across(everything(), as.character)) %>%
              pivot_longer(everything(), names_to = "column", values_to ="Strongly disagree")) %>%
  pivot_longer(cols = c("Strongly agree", "Agree", "Neither agree nor disagree", "Disagree", "Strongly disagree"),
               names_to = "breakdown", values_to = "indicator") %>%
  mutate(value = "experience_of_unpaid_carers",
         geography_type = "Scotland",
         geography = "Scotland",
         breakdown = factor(breakdown, levels = c( "Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree"))) %>%
  select(-column) %>%
  summary_format_function(date = .$date,
                          geog_type = .$geography_type,
                          geog = .$geography,
                          indicator_in = .$indicator,
                          value_in = .$value)

replace_file_fn(input_unpaid_carers,
                paste0(path_out, "/experience_unpaid_carers.rds"))


