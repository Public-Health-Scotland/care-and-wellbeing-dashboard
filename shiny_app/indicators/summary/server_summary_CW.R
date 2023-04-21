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


################################################.
# `Strengthen the role and impact of ill health prevention` ----
################################################.

##### Asthma admissions #####


output$asthma_admissions_infobox <- renderInfoBox({

  recent_date <- asthma_admissions$date %>% max()

  recent_value <- asthma_admissions %>% filter(date == recent_date, sex == "All Sexes", age_group == "All Ages", geography == input$geog_name_summary_CW, ) %>%
    .$stays_number

  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("asthma_admissions_summary_info",
                                   "Admissions for asthma",
                                   glue("This is the yearly total number of admissions for asthma for the financial year {recent_date}. <br> <br>",
                                        "This data is available at Scotland and health board level. ",
                                        "(not true just example) Further breakdown information at intermediate zone level is available under `Srengthen the role and impact ",
                                        " of ill health prevention` on the `Care and Wellbeing` tab. <br> <br>",
                                        "(eg) Further breakdown of age groups and sex is available under strengthen the role and impact ",
                                        "of ill health prevention on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Yearly total"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Alcohol deaths #####

output$alcohol_deaths_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("alcohol_deaths_summary_info",
                                   "",
                                   glue("Not available"))),
          value=glue("Not available"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Alcohol admission #####

output$alcohol_admissions_infobox <- renderInfoBox({

  recent_date <- alcohol_admissions$financial_year %>% max()

  recent_value <- alcohol_admissions %>%
    filter(geography == input$geog_name_summary_CW,
           condition == "All alcohol conditions",
           smr_type == "Combined",
           financial_year == recent_date) %>% .$stays_easr


  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("alcohol_admissions_summary_info",
                                   "Alcohol-related hospital admissions",
                                   glue("This is the European Age-sex standardised rate of alcohol-related hospital stays for people aged under 75 for the financial year {recent_date}. <br> <br>",
                                        "This data is available at Scotland and health board level. Further information is available under `Strengthen the role and impact ",
                                        "of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Yearly total"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### All cause mortality #####

output$all_cause_mortality_infobox <- renderInfoBox({

  recent_date <- max(all_cause_mortality$year)

  recent_value <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44", geography == "Scotland", year == recent_date) %>%
    group_by(year) %>% summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000) %>% .$rate %>% round_half_up(2)

  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("all_cause_mortality_summary_info",
                                   "All-cause mortality (age 15 to 44)",
                                   glue("This is the rate of deaths per 100,000 population for people aged between 15 and 44 for the year {recent_date}.",
                                        "The causes of death are coded in accordance with the International Statistical Classification of Diseases and Related Health Problems. <br> <br>",
                                        "This data is available at Scotland, health board and council area level. Further information is available under `Strengthen the role and impact ",
                                        "of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Rate of deaths per 100,000"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### CHD deaths #####

output$chd_deaths_infobox <- renderInfoBox({

  recent_date <- max(chd_deaths$year)

  recent_value <- chd_deaths %>% filter(geography == input$geog_name_summary_CW, year == recent_date) %>%
    .$measure

  infoBox(title=h5(glue("2018-2020 {recent_date} is incorrect"),
                   summaryButtonUI("chd_deaths_summary_info",
                                   "Coronary Heart Disease (CHD) deaths (aged 45-74)",
                                   glue("This is the age-sex standardised rate of coronary heart disese deaths per 100,000 population for people aged between 45 and 75 for the year range 2018 to 2020.",
                                        "This refers to diseases of the coronary arteries that supply the heart. This includes acute myocardial infarction, angina and most cases of heart failure. <br> <br>",
                                        "This data is available at Scotland, health board and council area level. Further breakdown information at intermediate zone level, HSCP and HSC locality is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Rate of deaths per 100,000"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Drug deaths #####

output$drug_deaths_infobox <- renderInfoBox({

  recent_date <- max(drug_related_deaths$year)

  recent_value <- drug_related_deaths %>% filter(geography == input$geog_name_summary_CW, year == recent_date) %>%
    .$rate

  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("drug_deaths_summary_info",
                                   "Drug-related deaths",
                                   glue("This is the age-sex standardised rate of drug-related deaths per 100,000 population for the year range {recent_date}. <br> <br>",
                                        "This data is available at Scotland, health board and council area level. Further breakdown of number of deaths as well as confidence intervals is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Rate of deaths per 100,000"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Drug admission #####

output$drug_admissions_infobox <- renderInfoBox({

  recent_date <- max(drug_stays$financial_year)

  recent_value <- drug_stays %>% filter(geography_type == "Scotland", age_group == "All age groups", financial_year == recent_date) %>%
    .$rate

  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("drug_admissions_summary_info",
                                   "Drug-related hospital admissions",
                                   glue("This is the age-sex standardised rate of drug-related hospital admissions (stays) per 100,000 population for the financial year {recent_date}. ",
                                        "This data is relating to general acute and psychiatric hospital stays with a diagnosis of drug misuse. <br> <br>",
                                        "This data is available at Scotland level. Further breakdown of age groups is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
          subtitle = glue("Rate of stays per 100,000"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Experience of social care recipients #####

output$experience_recipients_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("experience_recipients_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Experience of unpaid carers #####

output$experience_of_unpaid_carers_agree_infobox <- renderInfoBox({

  recent_date <- max(experience_unpaid_carers$date)

  recent_value <- experience_unpaid_carers %>% filter(breakdown == "Strongly agree", date == recent_date) %>%
    .$indicator %>% as.numeric()*100

  infoBox(title=h5(glue("{recent_date}"),
                   summaryButtonUI("experience_of_unpaid_carers_agree_summary_info",
                                   "Experience of unpaid carers",
                                   glue("This is the percentage of unpaid carers who strongly agreed with the statement ",
                                        "“I feel supported to continue caring“ for the Health and Care Experience Survey {recent_date}. <br> <br>",
                                        "This data is available at Scotland level. Further breakdown for other levels of agreement with the statement is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}%"),
          subtitle = glue("Percentage who strongly agreed"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

output$experience_of_unpaid_carers_disagree_infobox <- renderInfoBox({

  recent_date <- max(experience_unpaid_carers$date)

  recent_value <- experience_unpaid_carers %>% filter(breakdown == "Strongly disagree", date == recent_date) %>%
    .$indicator %>% as.numeric()*100

  infoBox(title=h5(glue("{ifelse(length(recent_experience_unpaid_carers)[1] == 0,'-', recent_experience_unpaid_carers$date)}"),
                   summaryButtonUI("experience_of_unpaid_carers_disagree_summary_info",
                                   "Experience of unpaid carers",
                                   glue("This is the percentage of unpaid carers who strongly disagreed with the statement ",
                                        "“I feel supported to continue caring“ for the Health and Care Experience Survey {recent_experience_unpaid_carers$date}. <br> <br>",
                                        "This data is available at Scotland level. Further breakdowns of levels of appropriateness of birthweight is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_experience_unpaid_carers)[1] == 0,'Not available', recent_experience_unpaid_carers$indicator %>% as.numeric()*100)}%"),
          subtitle = glue("Percentage who strongly disagreed"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Hospital admissions for heart attack #####

output$hospital_admission_heart_attack_infobox <- renderInfoBox({

  recent_heart_attack <- heart_attack %>% arrange(desc(date)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_heart_attack)[1] == 0,'-', recent_heart_attack$date)}"),
                   summaryButtonUI("hospital_admission_heart_attack_summary_info",
                                   "First ever admission for heart attack",
                                   glue("This is the total number of first ever hospital admissions for acute myocardial infarction (heart attack) ",
                                        "amongst those aged under 75 years in the year {recent_heart_attack$date}. <br> <br>",
                                        "This data is available at Scotland, health board and council area level. Further breakdown information is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_heart_attack)[1] == 0,'Not available', recent_heart_attack$total_admissions)}"),
          subtitle = glue("Yearly total"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Health risk behaviours #####

output$health_risk_behaviours_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("health_risk_behaviours_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Healthy birthweight #####

output$healthy_birthweight_infobox <- renderInfoBox({

  recent_birthweight <- birthweight %>%
    filter(geography == input$geog_name_summary_CW, birthweight_for_gestational_age == "Appropriate") %>%
    arrange(desc(financial_year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_birthweight)[1] == 0,'-', recent_birthweight$financial_year)}"),
                   summaryButtonUI("healthy_birthweight_summary_info",
                                   "Healthy birthweight",
                                   glue("This is the percentage of babies with an appropriate birthweight based on gestational age in the financial year ",
                                        "{recent_birthweight$financial_year}. Birthweight for gestational age is an indicator used to differentiate between ",
                                        "babies who, for example, are light because they are preterm and those who are inappropriately light after adjustment for gestational age at birth. <br> <br>",
                                        "This data is available at Scotland level. Further information is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_birthweight)[1] == 0,'Not available', recent_birthweight$proportion %>% round_half_up(4)*100)}%"),
          subtitle = glue("Percentage of livebirths of an approporiate birthweight"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Healthy life expectancy #####

output$healthy_life_expectancy_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("healthy_life_expectancy_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Healthy weight adults #####

output$healthy_weight_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("healthy_weight_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Limiting long term conditions #####

output$adult_long_term_condition_infobox <- renderInfoBox({

  recent_adult_limiting_long_term <- adult_living_limiting_long_term_condition %>% arrange(desc(Year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_adult_limiting_long_term)[1] == 0,'-', recent_adult_limiting_long_term$Year)}"),
                   summaryButtonUI("adult_long_term_condition_summary_info",
                                   "Limiting long-term conditions",
                                   glue("This is the percentage of adults aged 16 and above who live with a limiting long-term condition in the year {recent_adult_limiting_long_term$Year}. ",
                                        "A limiting long-term condition is defined as a physical or mental condition & health condition or illness lasting, ",
                                        "or expected to last 12 limiting months or more. A long-term condition is defined as limiting if the respondent reported ",
                                        "that it limited their activities in any way. <br> <br>",
                                        "This data is available at Scotland level. Further information is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_adult_limiting_long_term)[1] == 0,'Not available', recent_adult_limiting_long_term$Percent)}%"),
          subtitle = glue("Percentage of adults"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Mental wellbeing of adults #####

output$mental_wellbeing_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("mental_wellbeing_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Physical activity #####

output$physical_activity_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("physical_activity_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Premature mortality #####

output$premature_mortality_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("premature_mortality_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Quality of care experience #####

output$quality_care_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("quality_care_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Screening #####

output$screening_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("screening_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Self-assessed health of adults #####

output$adults_self_assessed_health_infobox <- renderInfoBox({

  recent_adult_self_assessed_health <- adult_self_assessed_health %>% arrange(desc(Year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_adult_self_assessed_health)[1] == 0,'-', recent_adult_self_assessed_health$Year)}"),
                   summaryButtonUI("adults_self_assessed_health_summary_info",
                                   "Self-assessed health of adults",
                                   glue("This is the percentage of adults who rated their health as `good` or `very good` in the",
                                        "Scottish Health survey in {recent_adult_self_assessed_health$Year}. Participants who are aged 13 ",
                                        "(? - not 16?) and over are asked to rate their health in general with answer options ranging from `very good` to `very bad`. <br> <br>",
                                        "This data is available at Scotland level. Further information is ",
                                        "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_adult_self_assessed_health)[1] == 0,'Not available', recent_adult_self_assessed_health$Percent)}%"),
          subtitle = glue("Percentage of adults"),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Vaccinations #####

output$vaccinations_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("vaccinations_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Work-related ill health #####

output$work_related_health_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("work_related_health_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

################################################.
# GIVE EVERY CHILD THE BEST START IN LIFE ----
################################################.

##### At risk of obesity #####

output$children_at_risk_of_obesity_infobox <- renderInfoBox({

  recent_childhood_obesity <-  childhood_obesity %>% arrange(desc(date)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_childhood_obesity)[1] == 0,'-', recent_childhood_obesity$date)}"),
                   summaryButtonUI("children_at_risk_of_obesity_summary_info",
                                   "Children at risk of obesity",
                                   glue("This is the percentage of children aged between 2 and 15 at risk of obesity in {recent_childhood_obesity$date}. <br> <br> ",
                                        "This data is available at Scotland level. Further information is ",
                                        "available under `Giving every child the best start in life` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_childhood_obesity)[1] == 0,'Not available', recent_childhood_obesity$indicator %>% as.numeric() %>% round_half_up(2))}%"),
          subtitle = glue("Percentage of children"),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Child material deprivation #####

output$child_material_deprivation_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("child_material_deprivation_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Child social and physical development #####

output$child_development_cw_infobox <- renderInfoBox({

  recent_preschool <- preschool %>% filter(geography == input$geog_name_summary_CW) %>% arrange(desc(financial_year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_preschool)[1] == 0,'-', recent_preschool$financial_year)}"),
                   summaryButtonUI("child_development_cw_summary_info",
                                   "Child social and physical development",
                                   glue("This is the percentage of children with a concern at their 27-30 month review recorded in {recent_preschool$financial_year}. ",
                                        "This data is available at Scotland, health board and council area level. Further information is ",
                                        "available under `Giving every child the best start in life` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_preschool)[1] == 0,'Not available', recent_preschool$prop_concern_any %>% round_half_up(4)*100)}%"),
          subtitle = glue("Percentage showing concern"),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Child wellbeing and happiness #####

output$child_wellbeing_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("child_wellbeing_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Infant mortality #####

output$infant_mortality_cw_infobox <- renderInfoBox({

  recent_inf_deaths <- inf_deaths %>% arrange(desc(date)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_inf_deaths)[1] == 0,'-', recent_inf_deaths$date %>% format('%b %y'))}"),
                   summaryButtonUI("infant_mortality_cw_summary_info",
                                   "Infant mortality",
                                   glue("This is the rate of infant deaths per 1,000 live births in {recent_inf_deaths$date %>% format('%B %Y')}. <br> <br>",
                                        "This data is available at Scotland level. Further information is ",
                                        "available under `Giving every child the best start in life` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_inf_deaths)[1] == 0,'Not available', recent_inf_deaths$rate %>% round_half_up(2))}"),
          subtitle = glue("Rate per 1,000 livebirths"),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Perinatal mortality rate #####

output$perinatal_mortality_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("perinatal_mortality_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})

##### Physical activity #####

output$physical_activity_children_cw_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("physical_activity_children_cw_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("baby"),
          color = "purple")
})


################################################.
# ENABLE ALL CHILDREN, YOUNG PEOPLE AND ADULTS TO MAXIMISE THEIR CAPABILITES AND CONTROL OVER THEIR LIVES ----
################################################.

##### CAHMS waiting times #####

output$camhs_waiting_times_cw_infobox <- renderInfoBox({

  recent_camhs_waiting_times <-  camhs_waiting_times2 %>%
    filter(geography == input$geog_name_summary_CW, wait_time == "0 to 18 weeks") %>%
    arrange(desc(date)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_camhs_waiting_times)[1] == 0,'-', recent_camhs_waiting_times$date %>% format('%b %y'))}"),
                   summaryButtonUI("camhs_waiting_times_cw_summary_info",
                                   "CAMHS waiting times",
                                   glue("This is the percentage of children and young people who were seen within 18 weeks of referral ",
                                        "to CAMHS (Children and Adolescent Mental Health Services) in {recent_camhs_waiting_times$date %>% format('%B %Y')}. <br> <br>",
                                        "This data is available at Scotland and health board level. Further breakdown information for other wait times is ",
                                        "available under `Enable all children, young people and adults to maximise their capabilities and control over their lives` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_camhs_waiting_times)[1] == 0,'Not available', recent_camhs_waiting_times$proportion %>% round_half_up(4)*100)}%"),
          subtitle = glue("Percentage of children and young people"),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Children have positive relationships #####

output$children_relationships_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("children_relationships_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Children’s voices #####

output$childrens_voices_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("childrens_voices_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Confidence and resilience of children and young people #####

output$confidence_of_young_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("confidence_of_young_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

##### Mental health / mental wellbeing #####

output$mental_health_cw_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("mental_health_cw_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("children"),
          color = "purple")
})

################################################.
# CREATE FAIR EMPLOYMENT AND GOOD WORK FOR ALL ----
################################################.

##### Economic inactivity #####

output$economic_inactivity_cw_want_infobox <- renderInfoBox({

  recent_economic_activity <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Wants to Work") %>%
    arrange(desc(year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_economic_activity)[1] == 0,'-', recent_economic_activity$year)}"),
                   summaryButtonUI("economic_inactivity_cw_want_summary_info",
                                   "Economic inactivity",
                                   glue("This is the percentage of economically inactive people who want to work in {recent_economic_activity$year}. <br> <br>",
                                        "This data is available at Scotland and council area level. Further information is available under ",
                                        "`Create fair employment and good work for all` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_economic_activity)[1] == 0,'Not available', recent_economic_activity$percent %>% round_half_up(2))}%"),
          subtitle = glue("Percentage who want to work"),
          icon = icon_no_warning_fn("building-user"),
          color = "purple")
})


output$economic_inactivity_cw_not_want_infobox <- renderInfoBox({

  recent_economic_activity <- economic_inactivity %>%
    filter(geography == input$geog_name_summary_CW, breakdown == "Does Not\r\nWant to Work") %>%
    arrange(desc(year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_economic_activity)[1] == 0,'-', recent_economic_activity$year)}"),
                   summaryButtonUI("economic_inactivity_cw_not_want_summary_info",
                                   "Economic inactivity",
                                   glue("This is the percentage of economically inactive people who don`t want to work in {recent_economic_activity$year}. <br> <br>",
                                        "This data is available at Scotland and council area level. Further information is available under ",
                                        "`Create fair employment and good work for all` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_economic_activity)[1] == 0,'Not available', recent_economic_activity$percent %>% round_half_up(2))}%"),
          subtitle = glue("Percentage who don't want to work"),
          icon = icon_no_warning_fn("building-user"),
          color = "purple")
})

##### Employees on the living wage #####

output$employees_living_wage_cw_infobox <- renderInfoBox({

  recent_employees_living_wage <- employees_living_wage_by_LA %>%
    filter(geography == input$geog_name_summary_CW, earning == "Earning less than the living wage") %>%
    arrange(desc(year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_employees_living_wage)[1] == 0,'-', recent_employees_living_wage$year)}"),
                   summaryButtonUI("employees_living_wage_cw_summary_info",
                                   "Employees on the living wage",
                                   glue("This is the percentage of employees earning less than the living wage in {recent_employees_living_wage$year}. <br> <br>",
                                        "This data is available at Scotland and council area level. Further breakdown information of employees by sector is available under ",
                                        "`Create fair employment and good work for all` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_employees_living_wage)[1] == 0,'Not available', recent_employees_living_wage$measure_value %>% round_half_up(2))}%"),
          subtitle = glue("Percentage of employees earning less than the living wage"),
          icon = icon_no_warning_fn("building-user"),
          color = "purple")
})

##### Pay gap #####

output$gender_pay_gap_cw_infobox <- renderInfoBox({

  recent_gender_pay_gap <- gender_pay_gap_by_sector %>%
    filter(gender == "Pay Gap", work_pattern == "All", sector == "All") %>%
    arrange(desc(year)) %>% head(1)

  infoBox(title=h5(glue("{ifelse(length(recent_gender_pay_gap)[1] == 0,'-', recent_gender_pay_gap$year)}"),
                   summaryButtonUI("gender_pay_gap_cw_summary_info",
                                   "Pay gap",
                                   glue("This is the percentage difference between men`s and women`s hourly earnings as a percentage of men`s earnings (excluding overtime) in {recent_gender_pay_gap$year}. <br> <br>",
                                        "This data is available at Scotland level. Further breakdown information of sector, work pattern and information regarding median hourly earnings for each sex is available under ",
                                        "`Create fair employment and good work for all` on the `Care and Wellbeing` tab."))),
          value=glue("{ifelse(length(recent_gender_pay_gap)[1] == 0,'Not available', recent_gender_pay_gap$measure_value)}%"),
          subtitle = glue("Percentage difference between men`s and women`s hourly earnings"),
          icon = icon_no_warning_fn("building-user"),
          color = "purple")
})

##### Work related ill health #####

output$work_related_ill_health_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("work_related_ill_health_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("building-user"),
          color = "purple")
})

################################################.
# ENSURE HEALTHY STANDARD OF LIVING FOR ALL ----
################################################.

##### Food insecurity money or other resources #####

output$food_insecurity_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("food_insecurity_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Persistent poverty #####

output$persistent_poverty_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("persistent_poverty_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

##### Satisfaction with housing #####

output$satisfaction_with_housing_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("satisfaction_with_housing_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("user-shield"),
          color = "purple")
})

################################################.
# CREATE AND DEVELOP HEALTHY AND SUSTAINABLE PLACES AND COMMUNITIES ----
################################################.

##### Loneliness #####

output$loneliness_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("loneliness_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Number of areas where health inequalities are reducing #####

output$areas_of_health_inequalities_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("areas_of_health_inequalities_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Perceptions of local area #####

output$perceptions_of_local_area_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("perceptions_of_local_area_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

##### Places to interact #####

output$places_to_intereact_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("places_to_intereact_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("tree-city"),
          color = "purple")
})

################################################.
# TACKLING DISCRIMINATION, RACISM AND THEIR OUTCOMES ----
################################################.

##### Gender balance in organisations #####

output$gender_balance_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("gender_balance_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("people-group"),
          color = "purple")
})

##### Public services treat people with dignity and respect #####

output$dignity_respect_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("dignity_respect_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("people-group"),
          color = "purple")
})

################################################.
# PERSUING ENVIRONMENTAL SUSTAINBAILITY AND HEALTH EQUITY TOGETHER ----
################################################.

##### Access to green and blue space #####

output$blue_green_space_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("blue_green_space_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

##### Journeys by active travel #####

output$journeys_active_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("journeys_active_summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

##### Visits to the outdoors #####

output$visit_outdoors_infobox <- renderInfoBox({
  infoBox(title=h5(glue(""),
                   summaryButtonUI("visit_outdoors__summary_info",
                                   "",
                                   glue("TBC"))),
          value=glue("TBC"),
          subtitle = glue(""),
          icon = icon_no_warning_fn("seedling"),
          color = "purple")
})

