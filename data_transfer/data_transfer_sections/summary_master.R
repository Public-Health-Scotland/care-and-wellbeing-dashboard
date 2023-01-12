##############################################.
# MASTER DATA - SUMMARY TABLES----
##############################################.

# Reads in all RDS files from the output folder
data_files = list.files(path_out) %>%
  as_tibble() %>%
  filter(str_detect(value, ".rds"))

for (file in data_files$value) {
  data = readRDS(paste0(path_out, "/", file))
  name = gsub(".rds", "", file)
  assign(name, data)
}


## Function set-up
## Inputs:
### Data must be in the correct format and named as follows
### geography = (e.g. Scotland, NHS Highland)
### geography_type (e.g. Scotland, Health Board)
### value - Base this off the tab values excel document
### indicator - this is the value for the indicator - must be pre-formatted
### date - the relevant date for indicator
###
### date_format = tweak the date to a pretty style (e.g. "%B %Y")
###
### Outputs:

summary_fn = function(data, pretty_month = F, pretty_day = F) {

  data %<>%
    arrange(pretty_date) %>%
    group_by(geography_type, geography) %>%
    do(tail(., 2)) %>%
    select(value, indicator, date = pretty_date, geography, geography_type)

  if(pretty_month) {
    data %<>%
      mutate(date = format(date, "%B %Y"))
  }

  if(pretty_day) {
    data %<>%
      mutate(date = paste0(format(date, "%d %B %Y"), " (fortnight ending)"))
  }

  latest = data %>%
    slice(-1) %>%
    ungroup() %>%
    rename(latest = indicator)

  previous = data %>%
    slice(1) %>%
    ungroup() %>%
    rename(previous = indicator, previous_date = date)

  out = left_join(latest, previous)

  return(out)
}

##############################################.
# WELLBEING OF CHILDREN AND YOUNG PEOPLE TAB----
##############################################.

## Child poverty ----
summary_child_poverty = child_poverty %>%
  filter(Group == "Children") %>%
  summary_fn(.)

## Positive destinations of school leavers ----
summary_positive = positive_destinations_school_leavers %>%
  filter(category == "All Leavers", characteristic == "All Leavers") %>%
  summary_fn(.)

## Pre-school development ----
summary_preschool = preschool %>%
  summary_fn(.)

## Protection from harm ----
summary_protect = protection_from_harm %>%
  summary_fn(., FALSE, TRUE)

## CAMHS Waiting Times ----
summary_camhs = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks") %>%
  summary_fn(., TRUE)

## Infant mortality ----
summary_infant = inf_deaths %>%
  summary_fn(., TRUE)

summary_wellbeing = do.call(rbind, list(summary_child_poverty, summary_positive,
                                        summary_preschool, summary_protect,
                                        summary_camhs, summary_infant))

rm(summary_child_poverty, summary_positive,
   summary_preschool, summary_protect,
   summary_camhs, summary_infant)

##############################################.
# FINANCIAL SECURITY FOR LOW INCOME HOUSEHOLDS TAB ----
##############################################.

## ELC (Early Learning and Childcare) Uptake ----
summary_elc_3to5 = childcare_elc_uptake %>%
  filter(value == "childcare_uptake_three_to_five") %>%
  summary_fn(., TRUE)

summary_elc_2 = childcare_elc_uptake %>%
  filter(value == "childcare_uptake_two") %>%
  summary_fn(., TRUE)

## Fuel affordability ----
summary_fuel = summary_fuel %>%
  filter(fuel_poverty == "Fuel Poor", measurement == "Percent") %>%
  summary_fn(.)

## Cost of Living ----
summary_cost_of_living = household_spending %>%
  group_by(pretty_date, geography, geography_type) %>%
  summarise(indicator = paste0(sum(scotland), "%")) %>%
  mutate(value = "cost_of_living") %>%
  summary_fn(.)

## Food affordability ----
summary_food = household_spending %>%
  filter(household_spending == "Food & non-alcoholic drinks") %>%
  mutate(value = "food_affordability",
         indicator = paste0(scotland, "%")) %>%
  summary_fn(.)

## Unmanageable debt ----
summary_unmanageable = unmanageable_debt %>%
  summary_fn(.)

## Savings ----
summary_savings = savings_low_income %>%
  filter(savings == "No savings", net_income == "All") %>%
  summary_fn(.)

summary_financial = do.call(rbind, list(summary_elc_3to5, summary_elc_2,
                                        summary_unmanageable,
                                        summary_fuel, summary_cost_of_living,
                                        summary_food, summary_savings))

rm(summary_elc_3to5, summary_elc_2, summary_unmanageable,
   summary_fuel, summary_cost_of_living, summary_food, summary_savings)
##############################################.
# GOOD, GREEN JOBS AND FAIR WORK ----
##############################################.

## Employees below the minimum wage ----
summary_living_wage = employees_living_wage_by_LA %>%
  filter(earning == "Earning less than the living wage") %>%
  summary_fn(.)

## Gender pay gap ----
summary_gender = gender_pay_gap_by_sector %>%
  filter(work_pattern == "All", sector == "All", gender == "Pay Gap") %>%
  summary_fn(.)

## Disability employment gap ----
summary_disability = disability_employment_gap_data %>%
  filter(category == "Disability Employment Gap") %>%
  summary_fn(.)

## Ethnicity employment gap ----
summary_ethnicity = ethnicity_employment_gap_data %>%
  filter(category == "Ethnicity Employment Gap") %>%
  summary_fn(.)


## Economic inactivity ----
summary_economic_inactivity = economic_inactivity %>%
  filter(breakdown == "Wants to Work") %>%
  summary_fn(.)

## Employability ----
summary_employability = employability_FSS_referral %>%
  summary_fn(.)

## Zero Hour Contracts ----
summary_zero = zero_hour_contracts %>%
  summary_fn(.)

## Skills Shortage Vacancies ----
summary_skills = skills_shortage_vacancies %>%
  summary_fn(.)

summary_underemployment = underemployment %>%
  summary_fn(.)

summary_jobs = do.call(rbind, list(summary_living_wage, summary_gender,
                                   summary_disability, summary_ethnicity,
                                   summary_economic_inactivity, summary_zero,
                                   summary_employability, summary_skills,
                                   summary_underemployment))

rm(summary_living_wage, summary_gender, summary_zero,
   summary_disability, summary_ethnicity, summary_skills,
   summary_economic_inactivity, summary_underemployment,
   summary_employability)


##############################################.
# POPULATION HEALTH ----
##############################################.

## All cause mortality (age 15-44) ----
summary_all_cause_mortality = `summary_all-cause-mortality` %>%
  summary_fn(.)

## Coronary heart disease deaths ----
summary_chd = chd_deaths %>%
  summary_fn(.)

## Drug related stays ----
drug_stays_summary %<>%
  summary_fn(.)

## Drug deaths ----
drug_deaths_summary = drug_related_deaths %>%
  summary_fn(.)

## Health birthweight ----

summary_birthweight = birthweight %>%
  filter(birthweight_for_gestational_age == "Appropriate") %>%
  summary_fn(.)

## children at risk of obesity

summary_child_obesity <- childhood_obesity %>%
  summary_fn()

## adults living with long term condition
summary_adult_long_term_condition <- adult_living_limiting_long_term_condition %>%
  summary_fn()

## adults self assessed health
summary_adult_self_assessed_health <- adult_self_assessed_health %>%
  summary_fn()

## experience of unpaid carers
summary_unpaid_carers <- experience_unpaid_carers %>%
  summary_fn()

## alcohol deaths

# alcohol_deaths_all <- input_alcohol_deaths
# summary_alcohol_deaths <- alcohol_deaths_all %>%
#   group_by(sex, breakdown) %>%
#   summary_fn()


## Summary pop health ----
summary_pop_health = do.call(rbind,
                             list(summary_all_cause_mortality, summary_chd,
                                  drug_stays_summary, drug_deaths_summary,
                                  summary_birthweight, summary_child_obesity,
                                  summary_adult_long_term_condition, summary_adult_self_assessed_health,
                                  summary_unpaid_carers))
rm(summary_all_cause_mortality, summary_chd, drug_stays_summary, drug_deaths_summary,
   summary_birthweight, summary_child_obesity,
   summary_adult_long_term_condition, summary_adult_self_assessed_health,
   summary_unpaid_carers)


##############################################.
# FINAL SUMMARY DATA ----
##############################################.


summary_final = do.call(rbind, list(summary_wellbeing, summary_financial,
                                    summary_jobs, summary_pop_health))

rm(summary_wellbeing, summary_financial, summary_jobs)


indicator_lookup = read_excel(paste0(path_out, "/tab values.xlsx"))

summary_final %<>%
  left_join(indicator_lookup, .)

saveRDS(summary_final, paste0(path_out, "/summary_table.rds"))

