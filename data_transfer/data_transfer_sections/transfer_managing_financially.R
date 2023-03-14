##############################################.
# MANAGING FINANCIALLY----
##############################################.


managing_financially = read_excel(paste0(path_in, "/Managing financially.xlsx"),
                                        sheet = "3_1_data") %>%
  clean_names() %>%
  summary_format_function(date = "2020",
         geog_type = "Scotland",
         geog = "Scotland",
         value_in = "managing_financially",
         indicator_in = .$number)


replace_file_fn(managing_financially,
                paste0(path_out, "/managing_financially.rds"))

rm(managing_financially)



