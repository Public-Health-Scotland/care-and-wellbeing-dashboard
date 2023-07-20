##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS----
##############################################.

# drug_stays = read_csv(paste0(path_in_pop, "/Drug Standardised hospital stays age_sex_trend_data.csv")) %>%
#   clean_names() %>%
#   mutate(geography_type = "Scotland",
#          geography = "Scotland",
#          sex = recode(sex, `Both sexes` = "All sexes")) %>%
#   rename("rate" = "value") %>%
#   select(-measure)
#
# replace_file_fn(drug_stays, paste0(path_out, "/drug_stays.rds"))


drug_admission_age_sex_source<-read_csv(paste0(path_in_pop,"drug_admissions_age_sex.csv"))

  drug_admission_age_sex<-drug_admission_age_sex_source %>%
  clean_names() %>%
  filter(hospital_type=="Any hospital type"&
          activity_type== "Stays" &
           diagnosis_grouping=="Any diagnosis"&
           drug_type=="Any drug type")

  drug_admission_age_sex_count<-drug_admission_age_sex %>%
    filter(measure!="Rate")%>%
    rename("count" = "value") %>%
    select(-measure)

  drug_admission_age_sex_rate<-drug_admission_age_sex %>%
    filter(measure!="Number")%>%
    rename("rate" = "value") %>%
    select(-measure)

  drug_admission_agesex<-drug_admission_age_sex_count %>%
    left_join(drug_admission_age_sex_rate, by=c("financial_year","hospital_type",
              "diagnosis_grouping","activity_type","drug_type",
              "age_group", "sex")) %>%
    mutate(geography_type = "Scotland",
           geography = "Scotland",
           sex = recode(sex, `Both sexes` = "All sexes"))

  rm(drug_admission_age_sex_source, drug_admission_age_sex, drug_admission_age_sex_count, drug_admission_age_sex_rate)

replace_file_fn(drug_admission_agesex, paste0(path_out, "/drug_admission_agesex.rds"))

  #filter options age group, sex, number or rate

# for future development , dowladed SIMD data set from source
# but hashtagging out until needed
# will have option to filter SIMD by  health board,  number or rate
# however TBC if geog aspects  needed

# drug_admin_simd<-read_csv(paste0(path_in_pop,"drug_admissions_simd.csv"))
#
#   drug_admin_simd<-drug_admin_simd %>%
#     clean_names() %>%
#     filter(hospital_type=="Any hospital type"&
#              activity_type== "Stays" &
#              diagnosis_grouping=="Any diagnosis"&
#              drug_type=="Any drug type" )

#rm(drug_admin_simd)

