##############################################.
# CHILDREN AT RISK OF OBESITY ----
##############################################.

data_path <-paste0(path_in_pop, "SHeS and HACE data for dashboard.xlsx")
data_sheet <- "Child BMI"

input_child_obesity <-  full_join(
  
  # year
  read_excel(data_path, sheet = data_sheet, range = "B3:P3", col_names = FALSE) %>% 
  clean_names() %>%     
  mutate(across(everything(), as.character)) %>%
  pivot_longer(everything(), names_to = "column", values_to ="date"), 
  
  # percentage children at risk of obesity
  read_excel(data_path, sheet = data_sheet, range = "B21:P21", col_names = FALSE) %>% 
    clean_names() %>%     
    mutate(across(everything(), as.character)) %>%
    pivot_longer(everything(), names_to = "column", values_to ="indicator")
  
  ) %>%
  mutate(value = "children_at_risk_of_obesity", 
         geography_type = "Scotland", 
         geography = "Scotland", 
         date = case_when(date == "2021a" ~ "2021", 
                          T ~ date)) %>%
  select(-column) %>%
  summary_format_function(.$date, 
                          .$geography_type, 
                          .$geography, 
                          .$indicator,
                          .$value)

replace_file_fn(input_child_obesity,
                paste0(path_out, "/childhood_obesity.rds"))
