##############################################.
# FUEL AFFORDABILITY DATA PROCESSING ----
##############################################.

fuel = read_excel(paste0(path_in, "/Fuel affordability.xlsx")) %>%
  clean_names()

fuel_num = fuel %>%
  select(-all) %>%
  filter(pct_num == "Num") %>%
  pivot_longer(cols = c("income_poor", "not_income_poor"),
               values_to = "number", names_to = "income_poor?")

replace_file_fn(fuel_num,
                paste0(path_out, "/fuel_number.rds"))




##############################################.
# FUEL POWERTY FROM SHCS DATA PROCESSING ----
##############################################.

fuel_SHCS = read_csv(paste0(path_in, "/Fuel poverty SHCS.csv")) %>%
  clean_names()


fuel_SHCS_num = fuel_SHCS %>%
  filter(feature_code == "S92000003",
         age_of_dwelling == "All",
         type_of_dwelling == "All",
         number_of_bedrooms == "All",
         type_of_tenure == "All",
         household_type == "All",
         #!grepl('-', fuel_SHCS$date_code)
         grepl('^[0-9]{4}$', fuel_SHCS$date_code)
         ) %>%
  select(feature_code, date_code, measurement, value, fuel_poverty) %>%
  mutate(date_code = as.integer(date_code) ) %>%
  arrange(date_code)

summary_fuel = fuel_SHCS_num %>%
  mutate(pretty_date = date_code,
         geography = "Scotland",
         geography_type = "Scotland",
         indicator = paste0(value, "%"),
         value = "fuel_affordability")



replace_file_fn(fuel_SHCS_num,
                  paste0(path_out, "/fuel_SHCS_num.rds"))

replace_file_fn(summary_fuel,
                paste0(path_out, "/summary_fuel.rds"))



##data for map


lookup_LA_temp = lookup_LA %>%
  add_row(ca2019name = "Scotland", ca2019 = "S92000003", hb2019name = "Scotland", hb2019 = "S92000003") %>%
  select(ca2019name, ca2019)


fuel_SHCS_LA = fuel_SHCS %>%
  filter(age_of_dwelling == "All",
         type_of_dwelling == "All",
         number_of_bedrooms == "All",
         type_of_tenure == "All",
         household_type == "All",
         measurement == "Percent",
         #!grepl('-', fuel_SHCS$date_code)
         grepl('^[0-9]{4}-[0-9]{4}$', fuel_SHCS$date_code)
  ) %>%
  select(feature_code, date_code, measurement, value, fuel_poverty) %>%
  left_join(lookup_LA_temp, by = c("feature_code" = "ca2019"))




replace_file_fn(fuel_SHCS_LA,
                paste0(path_out, "/fuel_SHCS_LA.rds"))


# ShapeFile = paste0(path_in, "/pub_las.shp")
# pub_las = readOGR(ShapeFile)
# pub_las$code = as.character(pub_las$code)
# pub_las = spTransform(pub_las,
#                        CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# replace_file_fn(pub_las,
#                 paste0(path_out, "/pub_las.rds"))


# ShapeFile = paste0(path_in, "/pub_las_simplified.shp")
# pub_las_simplified = readOGR(ShapeFile)
# pub_las_simplified$code = as.character(pub_las_simplified$code)
# pub_las_simplified = spTransform(pub_las_simplified,
#                       CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# replace_file_fn(pub_las_simplified,
#                 paste0(path_out, "/pub_las_simplified.rds"))


