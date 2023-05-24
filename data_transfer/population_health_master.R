##############################################.
# POPULATION HEALTH----
##############################################.

##############################################.
# ALL-CAUSE MORTALITY (15-44)----
##############################################.

source(paste0(path_pop_health, "transfer_all_cause_mortality.R"))

##############################################.
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
##############################################.

source(paste0(path_pop_health, "transfer_chd_deaths.R"))

##############################################.
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACKED (<75)----
##############################################.

source(paste0(path_pop_health, "transfer_hospital_admission_heart_attack.R"))

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.

source(paste0(path_pop_health, "transfer_drug_admissions.R"))

##############################################.
# DRUG RELATED DEATHS----
##############################################.

source(paste0(path_pop_health, "transfer_drug_deaths.R"))

##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.
source(paste0(path_pop_health, "transfer_alcohol_admissions.R"))

##############################################.
# ALCOHOL SPECIFIC DEATHS (45-74)----
##############################################.
source(paste0(path_pop_health, "transfer_alcohol_deaths.R"))

##############################################.
# ASTHMA HOSPITAL ADMISSIONS----
##############################################.
source(paste0(path_pop_health, "transfer_asthma_admissions.R"))

##############################################.
# INFANT MORTALITY (ALL DEATHS IN THE FIRST YEAR OF LIFE)----
##############################################.

##############################################.
# HEALTHY BIRTHWEIGHT BABIES----
##############################################.

source(paste0(path_pop_health, "/transfer_healthy_birthweight.R"))

##############################################.
# CHILDREN (2-15) AT RISK OF OBESITY----
##############################################.

source(paste0(path_pop_health, "transfer_childhood_obesity.R"))

##############################################.
# ADULTS (16+) SELF-ASSESSED HEALTH----
##############################################.

source(paste0(path_pop_health, "/transfer_adult_self_assessed_health.R"))

##############################################.
# ADULTS (16+) LIVING WITH LIMITING LONG-TERM CONDITIONS----
##############################################.

source(paste0(path_pop_health, "/transfer_adult_long_term_condition.R"))


##############################################.
# SCREENING UPTAKE----
##############################################.

##############################################.
# VACCINATIONS----
##############################################.

##############################################.
# EXPERIENCE OF SOCIAL CARE RECIPIENTS----
##############################################.


##############################################.
# EXPERIENCE OF UNPAID CARERS----
##############################################.

source(paste0(path_pop_health, "/transfer_experience_unpaid_carers.R"))


##############################################.
# PREMATURE MORTALITY----
##############################################.

source(paste0(path_pop_health, "/transfer_premature_mortality.R"))

