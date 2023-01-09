##############################################.
# PROTECTION FROM HARM----
##############################################.



protect = read_excel(paste0(path_in, "/Protection from harm.xlsx"))

# Split date into start and end of fortnight period
protect[,c("date_start", "date_end")] = str_split_fixed(protect$Date, "-", n=2)

# Reformat dates
protect %<>%
  mutate(date_start = dmy(date_start), date_end = dmy(date_end),
         mean = mean(Value), median = median(Value)) %>%
  mutate(geography = "Scotland",
         geography_type = "Scotland",
         value = "protection_from_harm",
         indicator = Value,
         pretty_date = date_end)

replace_file_fn(protect,
                paste0(path_out, "/protection_from_harm.rds"))


