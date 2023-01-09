##############################################.
# UNDEREMPLOYMENT----
##############################################.

underemployment = read_excel(paste0(path_in, "/Scotland%27s+Labour+Market+-+People+Places+and+Regions+-+Jan-Dec+Tables.xlsx"),
                                               sheet = "Table 1.15",
                                               range = "A4:AI40",
                                               na = "-") %>%
  rename(local_authority = `Proportion (per cent)`) %>%
  filter(local_authority != "Local Authority area:", !is.na(local_authority) ) %>%
  select(local_authority, matches("[0-9]{4}")) %>%
  #mutate(`2004` =  as.numeric(`2004`))
  mutate(across(`2004`:`2020`, ~as.numeric(.x))) %>%
  mutate(local_authority = replace(local_authority,
                                   local_authority == "Edinburgh, City of",
                                   "City of Edinburgh")) %>%
  pivot_longer(cols = `2004`:`2020`, names_to = "year", values_to = "proportion") %>%
  mutate(geography = local_authority,
         pretty_date = year,
         geography_type = ifelse(local_authority == "Scotland", "Scotland",
                                 local_authority),
         indicator = paste0(proportion, "%"),
         value = "underemployment")



replace_file_fn(underemployment,
                paste0(path_out, "/underemployment.rds"))
