##### Geog selectors #####

observeEvent(input$geog_type_summary_CW,
             {

               geog_filtered = geog_lookup %>%
                 filter(geography_type == input$geog_type_summary_CW)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "geog_name_summary_CW",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(geog_filtered$geography))#,
               #selected = "")
             })


######### USE TO TEST IF DROPDOWNS MATCH GEOGRAPHY COLUMNS IN DATA ##############
# test_geogs <-  unique(geog_lookup %>% filter(!(geography_type %in% c("HSCP", "Health board"))) %>% arrange(geography) %>% .$geography)

################################################.
# `Strengthen the role and impact of ill health prevention` ----
################################################.

##### Asthma admissions #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(asthma_admissions$date)
  previous_date <- max(asthma_admissions %>% filter(date != recent_date) %>% .$date)

  value <- asthma_admissions %>% filter(sex == "All Sexes", age_group == "All Ages", geography == input$geog_name_summary_CW)

  recent_value <- value %>% filter(date == recent_date) %>% .$stays_number
  previous_value <- value %>% filter(date == previous_date) %>% .$stays_number

  summaryBoxServer("asthma_admissions",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   value_dp = 0
                   )
})


##### Alcohol deaths #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("alcohol_deaths")
})

##### Alcohol admission #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- alcohol_admissions$financial_year %>% max()
  previous_date <- max(alcohol_admissions %>% filter(financial_year != recent_date) %>% .$financial_year)

  value <- alcohol_admissions %>%
    filter(geography == input$geog_name_summary_CW,
           condition == "All alcohol conditions",
           smr_type == "Combined")

  recent_value <- value %>% filter(financial_year == recent_date) %>% .$stays_easr
  previous_value <- value %>% filter(financial_year == previous_date) %>% .$stays_easr

  summaryBoxServer("alcohol_admissions",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   value_dp = 0
                   )

})

##### All cause mortality #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(all_cause_mortality$year)
  previous_date <- max(all_cause_mortality %>% filter(year != recent_date) %>% .$year)

  value <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44", geography == input$geog_name_summary_CW
           ) %>%
    group_by(year) %>% summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000)

  recent_value <- value %>% filter(year == recent_date) %>% .$rate
  previous_value <- value %>% filter(year == previous_date) %>% .$rate

  summaryBoxServer("all_cause_mortality",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value
                   )
})

##### CHD deaths #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(chd_deaths$year_range)
  previous_date <- max(chd_deaths %>% filter(year_range != recent_date) %>% .$year_range)

  value <- chd_deaths %>% filter(geography == input$geog_name_summary_CW)

  recent_value <- value %>% filter(year_range == recent_date) %>% .$measure
  previous_value <- value %>% filter(year_range == previous_date) %>% .$measure

  summaryBoxServer("chd_deaths",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value
  )
})

##### Drug deaths #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(drug_related_deaths$year)
  previous_date <- max(drug_related_deaths %>% filter(year != recent_date) %>% .$year)

  value <- drug_related_deaths %>% filter(geography == input$geog_name_summary_CW)

  recent_value <- value %>% filter(year == recent_date) %>% .$rate
  previous_value <- value %>% filter(year == previous_date) %>% .$rate

  summaryBoxServer("drug_deaths",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value
  )
})

##### Drug admission #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(drug_stays$financial_year)
  previous_date <- max(drug_stays %>% filter(financial_year != recent_date) %>% .$financial_year)

  value <- drug_stays %>% filter(geography == input$geog_name_summary_CW, age_group == "All age groups")

  recent_value <- value %>% filter(financial_year == recent_date) %>% .$rate
  previous_value <-  value %>% filter(financial_year == previous_date) %>% .$rate

  summaryBoxServer("drug_admissions",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value
  )
})

##### Experience of social care recipients #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("experience_recipients")
})

##### Experience of unpaid carers #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(experience_unpaid_carers$date)
  previous_date <- max(experience_unpaid_carers %>% filter(date != recent_date) %>% .$date)

  value <- experience_unpaid_carers %>% filter(geography == input$geog_name_summary_CW) %>% mutate(indicator = as.numeric(indicator)*100)

  recent_value_agree <- value %>% filter(breakdown == "Strongly agree", date == recent_date) %>% .$indicator
  previous_value_agree <- value %>% filter(breakdown == "Strongly agree", date == previous_date) %>% .$indicator

  recent_value_disagree <- value %>% filter(breakdown == "Strongly disagree", date == recent_date) %>% .$indicator
  previous_value_disagree <- value %>% filter(breakdown == "Strongly disagree", date == previous_date) %>% .$indicator

  summaryBoxServer("experience_of_unpaid_carers_agree",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value_agree,
                   previous_value = previous_value_agree,
                   percentage_symbol = "%"
  )

  summaryBoxServer("experience_of_unpaid_carers_disagree",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value_disagree,
                   previous_value = previous_value_disagree,
                   percentage_symbol = "%"

  )

})

##### Hospital admissions for heart attack #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(heart_attack$date)
  previous_date <- max(heart_attack %>% filter(date != recent_date) %>% .$date)

  value <- heart_attack %>% filter(geography == input$geog_name_summary_CW)

  recent_value <- value %>% filter(date == recent_date) %>% .$total_admissions
  previous_value <- value %>% filter(date == previous_date) %>% .$total_admissions

  summaryBoxServer("hospital_admission_heart_attack",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   value_dp = 0
  )
})

##### Health risk behaviours #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("health_risk_behaviours")
})

##### Healthy birthweight #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(birthweight$financial_year)
  previous_date <- max(birthweight %>% filter(financial_year != recent_date) %>% .$financial_year)

  recent_value <- birthweight %>%
    filter(geography == input$geog_name_summary_CW, birthweight_for_gestational_age == "Appropriate",
           financial_year == recent_date) %>%
    .$proportion %>% round_half_up(4)*100
  previous_value <- birthweight %>%
    filter(geography == input$geog_name_summary_CW, birthweight_for_gestational_age == "Appropriate",
           financial_year == previous_date) %>%
    .$proportion %>% round_half_up(4)*100

  summaryBoxServer("healthy_birthweight",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})

##### Healthy life expectancy #####


observeEvent(input$geog_name_summary_CW,{
  recent_date <- max(healthy_life_expectancy$time_period)
  previous_date <- max(healthy_life_expectancy%>% filter(time_period != recent_date) %>% .$time_period)

  value <- healthy_life_expectancy %>% filter(geography == input$geog_name_summary_CW, stage_of_life == "At birth")

  recent_value_male <- value %>% filter(sex == "Male", time_period == recent_date) %>% .$indicator
  previous_value_male <- value %>% filter(sex == "Male", time_period == previous_date) %>% .$indicator

  recent_value_female <- value %>% filter(sex == "Female", time_period == recent_date) %>% .$indicator
  previous_value_female <- value %>% filter(sex == "Female", time_period == previous_date) %>% .$indicator

  summaryBoxServer("healthy_life_expectancy_male",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value_male,
                   previous_value = previous_value_male
  )

  summaryBoxServer("healthy_life_expectancy_female",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value_female,
                   previous_value = previous_value_female
  )
})

##### Healthy weight adults #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("healthy_weight")
})

##### Limiting long term conditions #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(adult_living_limiting_long_term_condition$Year)
  previous_date <- max(adult_living_limiting_long_term_condition %>% filter(Year != recent_date) %>% .$Year)

  recent_value <- adult_living_limiting_long_term_condition %>%
    filter(Year == recent_date, geography == input$geog_name_summary_CW) %>%
    .$Percent
  previous_value <- adult_living_limiting_long_term_condition %>%
    filter(Year == previous_date, geography == input$geog_name_summary_CW) %>%
    .$Percent

  summaryBoxServer("adult_long_term_condition",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")

})

##### Mental wellbeing of adults #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("mental_wellbeing")
})

##### Physical activity #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("physical_activity")
})

##### Premature mortality #####

observeEvent(input$geog_name_summary_CW,{
  recent_date <- max(premature_mortality_all_cause_hb$date)
  previous_date <- max(premature_mortality_all_cause_hb %>% filter(date != recent_date) %>% .$date)

  value <- premature_mortality_all_cause_hb %>% filter(geography == input$geog_name_summary_CW)

  recent_value <- value %>% filter(date == recent_date) %>% .$indicator
  previous_value <- value %>% filter(date == previous_date) %>% .$indicator

  summaryBoxServer("premature_mortality",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value
  )
})


##### Quality of care experience #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("quality_care")
})

##### Screening #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("screening")
})

##### Self-assessed health of adults #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(adult_self_assessed_health$Year)
  previous_date <- max(adult_self_assessed_health %>% filter(Year != recent_date) %>% .$Year)

  recent_value <- adult_self_assessed_health %>% filter(Year == recent_date, geography == input$geog_name_summary_CW) %>%
    .$Percent
  previous_value <- adult_self_assessed_health %>% filter(Year == previous_date, geography == input$geog_name_summary_CW) %>%
    .$Percent

  summaryBoxServer("adults_self_assessed_health",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")

})

##### Vaccinations #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("vaccinations")
})

##### Work-related ill health #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("work_related_health")
})

################################################.
# GIVE EVERY CHILD THE BEST START IN LIFE ----
################################################.

##### At risk of obesity #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(childhood_obesity$date)
  previous_date <- max(childhood_obesity %>% filter(date != recent_date) %>% .$date)

  recent_value <-  childhood_obesity %>% filter(date == recent_date, geography == input$geog_name_summary_CW) %>%
    .$indicator %>% as.numeric() %>% round_half_up(2)
  previous_value <-  childhood_obesity %>% filter(date == previous_date, geography == input$geog_name_summary_CW) %>%
    .$indicator %>% as.numeric() %>% round_half_up(2)

  summaryBoxServer("children_at_risk_of_obesity",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")

})

##### Child material deprivation #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("child_material_deprivation")
})

##### Child social and physical development #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(preschool$financial_year)
  previous_date <- max(preschool %>% filter(financial_year != recent_date) %>% .$financial_year)

  recent_value <- preschool %>% filter(geography == input$geog_name_summary_CW, financial_year == recent_date) %>%
    .$prop_concern_any %>% round_half_up(4)*100
  previous_value <- preschool %>% filter(geography == input$geog_name_summary_CW, financial_year == previous_date) %>%
    .$prop_concern_any %>% round_half_up(4)*100

  summaryBoxServer("child_development_cw",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")

})

##### Child wellbeing and happiness #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("child_wellbeing")
})


##### Infant mortality #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(inf_deaths$date)
  previous_date <- max(inf_deaths$date) - years(1)

  recent_value <- inf_deaths %>% filter(date == recent_date, geography == input$geog_name_summary_CW) %>%
    .$rate %>% round_half_up(2)
  previous_value <- inf_deaths %>% filter(date == previous_date, geography == input$geog_name_summary_CW) %>%
    .$rate %>% round_half_up(2)

  summaryBoxServer("infant_mortality_cw",
                   recent_date = recent_date %>% format('%B %Y'),
                   previous_date = previous_date %>% format('%B %Y'),
                   recent_value = recent_value,
                   previous_value = previous_value
  )
})

##### Perinatal mortality rate #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("perinatal_mortality")
})

##### Physical activity #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("physical_activity_children_cw")
})

################################################.
# ENABLE ALL CHILDREN, YOUNG PEOPLE AND ADULTS TO MAXIMISE THEIR CAPABILITES AND CONTROL OVER THEIR LIVES ----
################################################.

##### CAHMS waiting times #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(camhs_waiting_times2$date)
  previous_date <- max(camhs_waiting_times2$date) - years(1)

  recent_value <-  camhs_waiting_times2 %>%
    filter(geography == input$geog_name_summary_CW, wait_time == "0 to 18 weeks",
           date == recent_date) %>%
    .$proportion %>% round_half_up(4)*100
  previous_value <-  camhs_waiting_times2 %>%
    filter(geography == input$geog_name_summary_CW, wait_time == "0 to 18 weeks",
           date == previous_date) %>%
    .$proportion %>% round_half_up(4)*100

  summaryBoxServer("camhs_waiting_times_cw",
                   recent_date = recent_date %>% format('%B %Y'),
                   previous_date = previous_date %>% format('%B %Y'),
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")

})

##### Children have positive relationships #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("children_relationships")
})


##### Children’s voices #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("childrens_voices")
})

##### Confidence and resilience of children and young people #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("confidence_of_young")
})

##### Mental health / mental wellbeing #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("mental_health_cw")
})


################################################.
# CREATE FAIR EMPLOYMENT AND GOOD WORK FOR ALL ----
################################################.

##### Economic inactivity #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(economic_inactivity$year)
  previous_date <- max(economic_inactivity %>% filter(year != recent_date) %>% .$year)

  recent_value <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Wants to Work", year == recent_date) %>%
    .$percent %>% round_half_up(2)
  previous_value <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Wants to Work", year == previous_date) %>%
    .$percent %>% round_half_up(2)

  summaryBoxServer("economic_inactivity_cw_want",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})


observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(economic_inactivity$year)
  previous_date <- max(economic_inactivity %>% filter(year != recent_date) %>% .$year)

  recent_value <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Does Not\r\nWant to Work", year == recent_date) %>%
    .$percent %>% round_half_up(2)
  previous_value <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Does Not\r\nWant to Work", year == previous_date) %>%
    .$percent %>% round_half_up(2)

  summaryBoxServer("economic_inactivity_cw_not_want",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})

##### Employees on the living wage #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(employees_living_wage_by_LA$year)
  previous_date <- max(employees_living_wage_by_LA %>% filter(year != recent_date) %>% .$year)

  recent_value <- employees_living_wage_by_LA %>%
    filter(geography == input$geog_name_summary_CW, earning == "Earning less than the living wage", year == recent_date) %>%
    .$measure_value %>% round_half_up(2)
  previous_value <- employees_living_wage_by_LA %>%
    filter(geography == input$geog_name_summary_CW, earning == "Earning less than the living wage", year == previous_date) %>%
    .$measure_value %>% round_half_up(2)

  summaryBoxServer("employees_living_wage_cw",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})

##### Pay gap #####

observeEvent(input$geog_name_summary_CW,{

  recent_date <- max(gender_pay_gap_by_sector$year)
  previous_date <- max(gender_pay_gap_by_sector %>% filter(year != recent_date) %>% .$year)

  recent_value <- gender_pay_gap_by_sector %>%
    filter(gender == "Pay Gap", work_pattern == "All", sector == "All",
           year == recent_date, geography == input$geog_name_summary_CW) %>%
    .$measure_value
  previous_value <- gender_pay_gap_by_sector %>%
    filter(gender == "Pay Gap", work_pattern == "All", sector == "All",
           year == previous_date, geography == input$geog_name_summary_CW) %>%
    .$measure_value

  summaryBoxServer("gender_pay_gap_cw",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})

##### Work related ill health #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("work_related_ill_health")
})

################################################.
# ENSURE HEALTHY STANDARD OF LIVING FOR ALL ----
################################################.

##### Food insecurity money or other resources #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("food_insecurity")
})

##### Persistent poverty #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("persistent_poverty")
})

##### Satisfaction with housing #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("satisfaction_with_housing")
})

################################################.
# CREATE AND DEVELOP HEALTHY AND SUSTAINABLE PLACES AND COMMUNITIES ----
################################################.

##### Loneliness #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("loneliness")
})

##### Number of areas where health inequalities are reducing #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("areas_of_health_inequalities")
})

##### Perceptions of local area #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("perceptions_of_local_area")
})

##### Places to interact #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("places_to_intereact")
})

################################################.
# TACKLING DISCRIMINATION, RACISM AND THEIR OUTCOMES ----
################################################.

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("gender_balance")
})

##### Public services treat people with dignity and respect #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("dignity_respect")
})

################################################.
# PERSUING ENVIRONMENTAL SUSTAINBAILITY AND HEALTH EQUITY TOGETHER ----
################################################.

##### Access to green and blue space #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("blue_green_space")
})

##### Journeys by active travel #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("journeys_active")
})

##### Visits to the outdoors #####

observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("visit_outdoors")
})



