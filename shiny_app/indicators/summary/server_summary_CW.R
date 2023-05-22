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


  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("hospital_admission_heart_attack_summary_info",
  #                                  "First ever admission for heart attack",
  #                                  glue("This is the total number of first ever hospital admissions for acute myocardial infarction (heart attack) ",
  #                                       "amongst those aged under 75 years in the year {recent_date}. <br> <br>",
  #                                       "This data is available at Scotland level. Further breakdown information is ",
  #                                       "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
  #         subtitle = glue("Yearly total"),
  #         icon = icon_no_warning_fn("user-shield"),
  #         color = "purple")

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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("healthy_birthweight_summary_info",
  #                                  "Healthy birthweight",
  #                                  glue("This is the percentage of babies with an appropriate birthweight based on gestational age in the financial year ",
  #                                       "{recent_date}. Birthweight for gestational age is an indicator used to differentiate between ",
  #                                       "babies who, for example, are light because they are preterm and those who are inappropriately light after adjustment for gestational age at birth. <br> <br>",
  #                                       "This data is available at Scotland, health board and council area level. Further information is ",
  #                                       "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value= ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of livebirths of an approporiate birthweight"),
  #         icon = icon_no_warning_fn("user-shield"),
  #         color = "purple")

  summaryBoxServer("healthy_birthweight",
                   recent_date = recent_date,
                   previous_date = previous_date,
                   recent_value = recent_value,
                   previous_value = previous_value,
                   percentage_symbol = "%")
})

##### Healthy life expectancy #####


observeEvent(input$geog_name_summary_CW,{
  summaryBoxServer("healthy_life_expectancy")
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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("adult_long_term_condition_summary_info",
  #                                  "Limiting long-term conditions",
  #                                  glue("This is the percentage of adults aged 16 years and above who live with a limiting long-term condition in the year {recent_date}. <br> <br>",
  #                                       "A limiting long-term condition is defined as a physical or mental condition & health condition or illness lasting, ",
  #                                       "or expected to last 12 limiting months or more. <br> <br> A long-term condition is defined as limiting if the respondent reported ",
  #                                       "that it limited their activities in any way. <br> <br>",
  #                                       "This data is available at Scotland level. Further information is ",
  #                                       "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of adults"),
  #         icon = icon_no_warning_fn("user-shield"),
  #         color = "purple")

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
  summaryBoxServer("premature_mortality")
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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("adults_self_assessed_health_summary_info",
  #                                  "Self-assessed health of adults",
  #                                  glue("This is the percentage of adults who rated their health as `good` or `very good` in the ",
  #                                       "Scottish Health survey in {recent_date}. Participants who are aged 13 years",
  #                                       "(? - not 16?) and over are asked to rate their health in general with answer options ranging from `very good` to `very bad`. <br> <br>",
  #                                       "This data is available at Scotland level. Further information is ",
  #                                       "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of adults"),
  #         icon = icon_no_warning_fn("user-shield"),
  #         color = "purple")

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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("children_at_risk_of_obesity_summary_info",
  #                                  "Children at risk of obesity",
  #                                  glue("This is the percentage of children aged between 2 and 15 years at risk of obesity in {recent_date}. <br> <br> ",
  #                                       "This data is available at Scotland level. Further information is ",
  #                                       "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of children"),
  #         icon = icon_no_warning_fn("baby"),
  #         color = "purple")

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

#   infoBox(title=h5(glue("{recent_date}"),
#                    summaryButtonUI("child_development_cw_summary_info",
#                                    "Child social and physical development",
#                                    glue("This is the percentage of children with a concern at their 27-30 month health review recorded in {recent_date}. <br> <br> ",
#                                         "This data is available at Scotland, health board and council area level. Further information is ",
#                                         "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
#                                         "<br> <br> {strong('Click again to close.')}"))),
#           value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
#           subtitle = glue("Percentage showing concern"),
#           icon = icon_no_warning_fn("baby"),
#           color = "purple")

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

  # infoBox(title=h5(glue("{recent_date %>% format('%B %Y')}"),
  #                  summaryButtonUI("infant_mortality_cw_summary_info",
  #                                  "Infant mortality",
  #                                  glue("This is the rate of infant deaths per 1,000 live births in {recent_date %>% format('%B %Y')}. <br> <br>",
  #                                       "This data is available at Scotland level. Further information is ",
  #                                       "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=glue("{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}"),
  #         subtitle = glue("Rate per 1,000 livebirths"),
  #         icon = icon_no_warning_fn("baby"),
  #         color = "purple")

  summaryBoxServer("infant_mortality_cw",
                   recent_date = recent_date,
                   previous_date = previous_date,
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

  # infoBox(title=h5(glue("{recent_date %>% format('%B %Y')}"),
  #                  summaryButtonUI("camhs_waiting_times_cw_summary_info",
  #                                  "CAMHS waiting times",
  #                                  glue("This is the percentage of children and young people who were seen within 18 weeks of referral ",
  #                                       "to CAMHS (Children and Adolescent Mental Health Services) in {recent_date %>% format('%B %Y')}. <br> <br>",
  #                                       "This data is available at Scotland and health board level. Further breakdown information for other wait times is ",
  #                                       "available under `Enable all children, young people and adults to maximise their capabilities and control over their lives` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of children and young people"),
  #         icon = icon_no_warning_fn("children"),
  #         color = "purple")

  summaryBoxServer("camhs_waiting_times_cw",
                   recent_date = recent_date,
                   previous_date = previous_date,
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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("economic_inactivity_cw_want_summary_info",
  #                                  "Economic inactivity",
  #                                  glue("This is the percentage of economically inactive people who want to work in {recent_date}. <br> <br>",
  #                                       "This data is available at Scotland and council area level. Further information is available under ",
  #                                       "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage who want to work"),
  #         icon = icon_no_warning_fn("building-user"),
  #         color = "purple")

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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("economic_inactivity_cw_not_want_summary_info",
  #                                  "Economic inactivity",
  #                                  glue("This is the percentage of economically inactive people who don`t want to work in {recent_date}. <br> <br>",
  #                                       "This data is available at Scotland and council area level. Further information is available under ",
  #                                       "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage who don't want to work"),
  #         icon = icon_no_warning_fn("building-user"),
  #         color = "purple")

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
    filter(geography == "East Renfrewshire", earning == "Earning less than the living wage", year == recent_date) %>%
    .$measure_value %>% round_half_up(2)
  previous_value <- employees_living_wage_by_LA %>%
    filter(geography == "East Renfrewshire", earning == "Earning less than the living wage", year == previous_date) %>%
    .$measure_value %>% round_half_up(2)

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("employees_living_wage_cw_summary_info",
  #                                  "Employees on the living wage",
  #                                  glue("This is the percentage of employees earning less than the living wage in {recent_date}. <br> <br>",
  #                                       "This data is available at Scotland and council area level. Further breakdown information of employees by sector is available under ",
  #                                       "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse((length(recent_value)[1] == 0),'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage of employees earning less than the living wage"),
  #         icon = icon_no_warning_fn("building-user"),
  #         color = "purple")

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

  # infoBox(title=h5(glue("{recent_date}"),
  #                  summaryButtonUI("gender_pay_gap_cw_summary_info",
  #                                  "Pay gap",
  #                                  glue("This is the percentage difference between men`s and women`s hourly earnings as a percentage of men`s earnings (excluding overtime) in {recent_date}. <br> <br>",
  #                                       "This data is available at Scotland level. Further breakdown information of sector, work pattern and information regarding median hourly earnings for each sex is available under ",
  #                                       "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
  #                                       "<br> <br> {strong('Click again to close.')}"))),
  #         value=ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_value}%")),
  #         subtitle = glue("Percentage difference between men`s and women`s hourly earnings"),
  #         icon = icon_no_warning_fn("building-user"),
  #         color = "purple")

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



