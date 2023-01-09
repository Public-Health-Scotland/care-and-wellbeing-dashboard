##############################################.
# MANAGING FINANCIALLY----
##############################################.


managing_financially = read_excel(paste0(path_in, "/Managing financially.xlsx"), 
                                        sheet = "3_1_data")


replace_file_fn(managing_financially,
                paste0(path_out, "/managing_financially.rds"))



