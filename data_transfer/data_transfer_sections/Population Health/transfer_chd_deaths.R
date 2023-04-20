##############################################.
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
##############################################.

chd = read_csv(paste0(path_in_pop, "CHD death extract.csv"))

chd %<>%
  mutate(area_type = str_to_title(area_type),
         area_type = case_when(area_type == "Hsc Partnership" ~ "HSCP",
                               area_type == "Hsc Locality" ~ "Locality",
                               TRUE ~ area_type),
         area_name = gsub("&", "and", area_name)) %>%
  summary_format_function(., .$year,
                          .$area_type,
                          .$area_name,
                          .$measure,
                          "chd_deaths") %>%
  arrange(year,geography_type, geography)


replace_file_fn(chd,
                paste0(path_out, "/chd_deaths.rds"))
