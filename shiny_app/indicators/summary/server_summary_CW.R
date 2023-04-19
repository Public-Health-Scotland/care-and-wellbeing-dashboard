################################################.
# STRENGTHEN THE ROLE AND IMPACT OF ILL HEALTH PREVENTION ----
################################################.

##### Asthma admissions #####


output$asthma_admissions_infobox <- renderInfoBox({

  recent_asthma <- asthma_admissions %>% filter(sex == 'All Sexes', age_group == 'All Ages', geography == 'Scotland') %>%
    arrange(date) %>% tail(1)

  infoBox(title=h5(glue("{recent_asthma %>% .$date}"),
                   summaryButtonUI("asthma_admissions_summary_info",
                                   "Admissions for asthma",
                                   glue("This is the yearly total number of admissions for asthma for the financial year (?). <br> <br>",
                                        "This data is available at Scotland and health board level. ",
                                        "(not true just example) Further breakdown information at intermediate zone level is available under strengthen the role and impact ",
                                        " of ill health prevention on the care and wellbeing tab. <br> <br>",
                                        "(eg) Further breakdown of age groups is available under ... "))),
          value= glue("{recent_asthma %>% .$stays_number}"),
          subtitle = glue("Yearly total"),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Alcohol deaths #####

output$alcohol_deaths_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("alcohol_deaths_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Alcohol admission #####

output$alcohol_admissions_infobox <- renderInfoBox({

  recent_alcohol_admissions <- alcohol_admissions %>% arrange(desc(financial_year)) %>%
    filter(sub_group_select_group_first == "Scotland",
           condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    head(1)

  infoBox(title=h5(glue("{recent_alcohol_admissions %>% .$financial_year}"),
                   summaryButtonUI("alcohol_admissions_summary_info",
                                   "Alcohol-related hospital admissions",
                                   glue("This is the European Age-sex standardised rate of alcohol-related hospital stays for people aged under 75 for the financial year ",
                                        "{recent_alcohol_admissions %>% .$financial_year}. <br> <br>",
                                        "This data is available at Scotland and health board level."))),
          value=glue("{recent_alcohol_admissions %>% .$stays_easr}"),
          subtitle = glue("Yearly total"),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### All cause mortality #####

output$all_cause_mortality_infobox <- renderInfoBox({

  recent_all_cause_mortality <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44", geography == "Scotland") %>% group_by(year) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000) %>% arrange(desc(year)) %>% head(1)

  infoBox(title=h5(glue("{recent_all_cause_mortality %>% .$year}"),
                   summaryButtonUI("all_cause_mortality_summary_info",
                                   "All-cause mortality (age 15 to 44)",
                                   glue("This is the rate of deaths per 100,000 population for people aged between 15 and 44 for the year {recent_all_cause_mortality %>% .$year}.",
                                        "The causes of death are coded in accordance with the International Statistical Classification of Diseases and Related Health Problems. <br> <br>",
                                        "This data is available at Scotland, health board and council area level."))),
          value=glue("{recent_all_cause_mortality %>% .$rate %>% round_half_up(2)}"),
          subtitle = glue("Rate of deaths per 100,000"),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### CHD deaths #####

output$chd_deaths_infobox <- renderInfoBox({

  recent_chd_deaths <- chd_deaths %>% filter(geography == "Scotland") %>% arrange(desc(period)) %>% head(1)

  infoBox(title=h5(glue("2018-2020"),
                   summaryButtonUI("chd_deaths_summary_info",
                                   "Coronary Heart Disease (CHD) deaths (aged 45-74)",
                                   glue("This is the age-sex standardised rate of coronary heart disese deaths per 100,000 population for people aged between 45 and 75 for the year range 2018 to 2020.",
                                        "This refers to diseases of the coronary arteries that supply the heart. This includes acute myocardial infarction, angina and most cases of heart failure. <br> <br>",
                                        "This data is available at Scotland, health board and council area level.  Further breakdown information at intermediate zone level, HSCP and HSC locality is ",
                                        "available under strengthen the role and impact of ill health prevention on the care and wellbeing tab."))),
          value=glue("{recent_chd_deaths %>% .$measure}"),
          subtitle = glue("Rate of deaths per 100,000"),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Drug deaths #####

output$drug_deaths_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("drug_deaths_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Drug admission #####

output$drug_admissions_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("drug_admissions_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Experience of social care recipients #####

output$experience_recipients_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("experience_recipients_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Experience of unpaid carers #####

output$experience_of_unpaid_carers_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("experience_of_unpaid_carers_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Hospital admissions for heart attack #####

output$hospital_admission_heart_attack_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("hospital_admission_heart_attack_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Health risk behaviours #####

output$health_risk_behaviours_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("health_risk_behaviours_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Healthy birthweight #####

output$healthy_birthweight_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("healthy_birthweight_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Healthy life expectancy #####

output$healthy_life_expectancy_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("healthy_life_expectancy_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Healthy weight adults #####

output$healthy_weight_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("healthy_weight_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Limiting long term conditions #####

output$adult_long_term_condition_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("adult_long_term_condition_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Mental wellbeing of adults #####

output$mental_wellbeing_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("mental_wellbeing_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Physical activity #####

output$physical_activity_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("physical_activity_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Premature mortality #####

output$premature_mortality_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("premature_mortality_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Quality of care experience #####

output$quality_care_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("quality_care_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Screening #####

output$screening_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("screening_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Self-assessed health of adults #####

output$adults_self_assessed_health_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("adults_self_assessed_health_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Vaccinations #####

output$vaccinations_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("vaccinations_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

##### Work-related ill health #####

output$work_related_health_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("work_related_health_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-circle-check"),
          color = "purple")
})

################################################.
# GIVE EVERY CHILD THE BEST START IN LIFE ----
################################################.

##### At risk of obesity #####

output$children_at_risk_of_obesity_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("children_at_risk_of_obesity_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Child material deprivation #####

output$child_material_deprivation_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("child_material_deprivation_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Child social and physical development #####

output$child_development_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("child_development_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Child wellbeing and happiness #####

output$child_wellbeing_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("child_wellbeing_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Infant mortality #####

output$infant_mortality_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("infant_mortality_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Perinatal mortality rate #####

output$perinatal_mortality_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("perinatal_mortality_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Physical activity #####

output$physical_activity_children_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("physical_activity_children_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})


################################################.
# ENABLE ALL CHILDREN, YOUNG PEOPLE AND ADULTS TO MAXIMISE THEIR CAPABILITES AND CONTROL OVER THEIR LIVES ----
################################################.

##### CAHMS waiting times #####

output$camhs_waiting_times_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("camhs_waiting_times_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Children have positive relationships #####

output$children_relationships_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("children_relationships_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Children’s voices #####

output$childrens_voices_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("childrens_voices_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Confidence and resilience of children and young people #####

output$confidence_of_young_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("confidence_of_young_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Mental health / mental wellbeing #####

output$mental_health_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("mental_health_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

################################################.
# CREATE FAIR EMPLOYMENT AND GOOD WORK FOR ALL ----
################################################.

##### Economic inactivity #####

output$economic_inactivity_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("economic_inactivity_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Employees on the living wage #####

output$employees_living_wage_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("employees_living_wage_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Pay gap #####

output$gender_pay_gap_cw_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("gender_pay_gap_cw_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

##### Work related ill health #####

output$work_related_ill_health_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("work_related_ill_health_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("carrot"),
          color = "purple")
})

################################################.
# ENSURE HEALTHY STANDARD OF LIVING FOR ALL ----
################################################.

##### Food insecurity money or other resources #####

output$food_insecurity_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("food_insecurity_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-pulse"),
          color = "purple")
})

##### Persistent poverty #####

output$persistent_poverty_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("persistent_poverty_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-pulse"),
          color = "purple")
})

##### Satisfaction with housing #####

output$satisfaction_with_housing_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("satisfaction_with_housing_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("heart-pulse"),
          color = "purple")
})

################################################.
# CREATE AND DEVELOP HEALTHY AND SUSTAINABLE PLACES AND COMMUNITIES ----
################################################.

##### Loneliness #####

output$loneliness_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("loneliness_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Number of areas where health inequalities are reducing #####

output$areas_of_health_inequalities_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("areas_of_health_inequalities_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Perceptions of local area #####

output$perceptions_of_local_area_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("perceptions_of_local_area_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Places to interact #####

output$places_to_intereact_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("places_to_intereact_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

################################################.
# TACKLING DISCRIMINATION, RACISM AND THEIR OUTCOMES ----
################################################.

##### Gender balance in organisations #####

output$gender_balance_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("gender_balance_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("people-group"),
          color = "purple")
})

##### Public services treat people with dignity and respect #####

output$dignity_respect_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("dignity_respect_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("people-group"),
          color = "purple")
})

################################################.
# PERSUING ENVIRONMENTAL SUSTAINBAILITY AND HEALTH EQUITY TOGETHER ----
################################################.

##### Access to green and blue space #####

output$blue_green_space_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("blue_green_space_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

##### Journeys by active travel #####

output$journeys_active_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("journeys_active_summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

##### Visits to the outdoors #####

output$visit_outdoors_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("visit_outdoors__summary_info",
                                   "",
                                   paste("Blah blah blah"))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

