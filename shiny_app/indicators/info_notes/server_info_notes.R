
observeEvent(input$pillar_type_info,
             {

               if(input$pillar_type_info == "Covid recovery"){
                 updateRadioButtons(session, inputId = "indicator_type_info",
                                    label = "2. Select indicator",
                                    choices = c(unique(section_lookup %>% filter(pillar == "Covid recovery") %>% .$section)))

               } else if (input$pillar_type_info == "Care and wellbeing"){
                 updateRadioButtons(session, inputId = "indicator_type_info",
                                    label = "2. Select indicator",
                                    choices = c(unique(section_lookup %>% filter(pillar == "Care and wellbeing") %>% .$section)))

               }
             }
)





output$info_panel = renderUI({

  ################ COVID RECOVERY ####################.

  if(input$indicator_type_info == "Wellbeing of children and young people" ) {

    wellPanel(
      h3("Wellbeing of children and young people"),
      bsCollapse(id = "info_collapse_wellbeing", open = "Panel 1",
                 bsCollapsePanel(
                   "Child poverty",
                   uiOutput("info_child_poverty")
                 ),
                 bsCollapsePanel(
                   "Positive destinations of school leavers",
                   uiOutput("info_positive_destinations")
                 ),
                 bsCollapsePanel(
                   "Pre-school development",
                   uiOutput("info_child_development_cr")
                 ),
                 bsCollapsePanel(
                   "Being listened to and involved in decision making",
                   uiOutput("info_listen_to_decision_making")
                 ),
                 bsCollapsePanel(
                   "CAMHS waiting times",
                   uiOutput("info_camhs_waiting_times_cr")
                 ),
                 bsCollapsePanel(
                   "Protection from harm",
                   uiOutput("info_protection_from_harm")
                 ),
                 bsCollapsePanel(
                   "Infant mortality",
                   uiOutput("info_infant_mortality_cr")
                 ),
                 bsCollapsePanel(
                   "Physical activity",
                   uiOutput("info_physical_activity_children_cr")

                 ),
                 bsCollapsePanel(
                   "Mental health and wellbeing",
                   uiOutput("info_mental_health_cr")
                 )
      )
    )
  } else if(input$indicator_type_info == "Financial security for low income households") {

    wellPanel(
      h3("Financial security for low income households"),
      bsCollapse(id = "info_collapse_finance", open = "Panel 1",
                 bsCollapsePanel(
                   "Fuel affordability",
                   uiOutput("info_fuelaffordability")
                 ),
                 bsCollapsePanel(
                   "Household spending",
                   uiOutput("info_householdspending")
                 ),
                 bsCollapsePanel(
                   "Managing financially",
                   uiOutput("info_managingfinancially")
                 ),
                 bsCollapsePanel(
                   "Savings",
                   uiOutput("info_savings")
                 ),
                 bsCollapsePanel(
                   "Unmanageable debt",
                   uiOutput("info_unmanageabledebt")
                 ),

                 bsCollapsePanel(
                   "Transport costs",
                   uiOutput("info_transportcosts")
                 ),
                 bsCollapsePanel(
                   "Early learning and childcare uptake",
                   uiOutput("info_childcareuptake")
                 ),
                 bsCollapsePanel(
                   "Benefit uptake and engagement with welfare advice",
                   uiOutput("info_benefits_uptake")
                 )
      )
    )
  } else if(input$indicator_type_info == "Good, green jobs and fair work") {

    wellPanel(
      h3("Good, green jobs and fair work"),
      bsCollapse(id = "info_collapse_jobs", open = "Panel 1",
                 bsCollapsePanel(
                   "Employees on living wage",
                   uiOutput("info_employeeslivingwage")
                 ),
                 bsCollapsePanel(
                   "Gender pay gap",
                   uiOutput("info_genderpaygap")
                 ),
                 bsCollapsePanel(
                   "Disability employment gap",
                   uiOutput("info_disabilityemploymentgap")
                 ),
                 bsCollapsePanel(
                   "Ethnicity employment gap",
                   uiOutput("info_ethnicityemploymentgap")
                 ),
                 bsCollapsePanel(
                   "Zero-hours contracts",
                   uiOutput("info_zerohourscontract")
                 ),
                 bsCollapsePanel(
                   "Skills shortage vacancies",
                   uiOutput("info_skillsshortagevacancies")
                 ),
                 bsCollapsePanel(
                   "Underemployment",
                   uiOutput("info_underemployment")
                 ),
                 bsCollapsePanel(
                   "Economic inactivity",
                   uiOutput("info_economicinactivity")
                 ),
                 bsCollapsePanel(
                   "Employability",
                   uiOutput("info_employability")
                 ),
                 bsCollapsePanel(
                   "Contractually secure work",
                   uiOutput("info_contractuallysecurework")
                 ),
                 bsCollapsePanel(
                   "Green jobs",
                   uiOutput("info_greenjobs")
                 )
      )
    )

    ############### CARE AND WELLBEING ###############.

  } else if(input$indicator_type_info == "Strengthen the role and impact of ill health prevention") {

    wellPanel(
      h3("Strengthen the role and impact of ill health prevention"),
      bsCollapse(id = "info_collapse_strengthen_prevention", open = "Panel 1",
                 bsCollapsePanel(
                   "Admissions for asthma",
                   uiOutput("info_asthma_admissions")
                 ),
                 bsCollapsePanel(
                   "Alcohol: deaths and first hospital admissions (under 75)",
                   uiOutput("info_alcohol")
                 ),
                 bsCollapsePanel(
                   "All-cause mortality (age 15-44)",
                   uiOutput("info_all_cause_mortality")
                 ),
                 bsCollapsePanel(
                   "Coronary Heart Disease (CHD): deaths (age 45-74)",
                   uiOutput("info_chd_deaths")
                 ),
                 bsCollapsePanel(
                   "Drugs: deaths and hospital admissions (under 75)",
                   uiOutput("info_drugs")
                 ),
                 bsCollapsePanel(
                   "Experience of social care recipients",
                   uiOutput("info_experience_recipients")
                 ),
                 bsCollapsePanel(
                   "Experience of unpaid carers",
                   uiOutput("info_experience_of_unpaid_carers")
                 ),
                 bsCollapsePanel(
                   "First ever hospital admission for heart attack (under 75)",
                   uiOutput("info_hospital_admission_heart_attack")
                 ),
                 bsCollapsePanel(
                   "Health Risk Behaviours",
                   uiOutput("info_health_risk_behaviours")
                 ),
                 bsCollapsePanel(
                   "Healthy birthweight",
                   uiOutput("info_healthy_birthweight")
                 ),
                 bsCollapsePanel(
                   "Healthy Life Expectancy",
                   uiOutput("info_healthy_life_expectancy")
                 ),
                 bsCollapsePanel(
                   "Healthy Weight adults",
                   uiOutput("info_healthy_weight")
                 ),
                 bsCollapsePanel(
                   "Limiting long-term conditions (age 16+)",
                   uiOutput("info_adult_long_term_condition")
                 ),
                 bsCollapsePanel(
                   "Mental Wellbeing of adults (16+)",
                   uiOutput("info_mental_wellbeing")
                 ),
                 bsCollapsePanel(
                   "Physical Activity",
                   uiOutput("info_physical_activity")
                 ),
                 bsCollapsePanel(
                   "Premature mortality",
                   uiOutput("info_premature_mortality")
                 ),
                 bsCollapsePanel(
                   "Quality of care experience",
                   uiOutput("info_quality_care")
                 ),
                 bsCollapsePanel(
                   "Screening- uptake for breast and bowel cancer",
                   uiOutput("info_screening")
                 ),
                 bsCollapsePanel(
                   "Self-assessed health of adults (age 16+)",
                   uiOutput("info_adult_self_assessed_health")
                 ),
                 bsCollapsePanel(
                   "Vaccinations",
                   uiOutput("info_vaccinations")
                 ),
                 bsCollapsePanel(
                   "Work-related ill health",
                   uiOutput("info_work_related_health")
                 )
      )
    )
  }  else if(input$indicator_type_info == "Give every child the best start in life") {

    wellPanel(
      h3("Give every child the best start in life"),
      bsCollapse(id = "info_collapse_child_start", open = "Panel 1",

                 bsCollapsePanel(
                   "Infant Mortality",
                   uiOutput("info_infant_mortality_cw")
                 ),
                 bsCollapsePanel(
                   "At risk of obesity",
                   uiOutput("info_children_at_risk_of_obesity")
                 ),
                 bsCollapsePanel(
                   "Child social and physical development",
                   uiOutput("info_child_development_cw")
                 ),
                 bsCollapsePanel(
                   "Child material deprivation",
                   uiOutput("info_child_material_deprivation")
                 ),
                 bsCollapsePanel(
                   "Child wellbeing and happiness",
                   uiOutput("info_child_wellbeing")
                 ),
                 bsCollapsePanel(
                   "Perinatal mortality rate",
                   uiOutput("info_perinatal_mortality")
                 ),
                 bsCollapsePanel(
                   "Physcial activity",
                   uiOutput("info_physical_activity_children_cw")
                 )
      )
    )

  } else if(input$indicator_type_info == "Enable all children, young people and adults to maximise their capabilities and control over their lives") {

    wellPanel(
      h3("Enable all children, young people and adults to maximise their capabilities and control over their lives"),
      bsCollapse(id = "info_collapse_control_lives", open = "Panel 1",

                 bsCollapsePanel(
                   "Children's voices",
                   uiOutput("info_childrens_voices")
                 ),
                 bsCollapsePanel(
                   "Children have positive relationships",
                   uiOutput("info_children_relationships")
                 ),
                 bsCollapsePanel(
                   "Confidence and resilience of children and young people",
                   uiOutput("info_confidence_of_young")
                 ),
                 bsCollapsePanel(
                   "Mental health/mental wellbeing",
                   uiOutput("info_mental_health_cw")
                 ),
                 bsCollapsePanel(
                   "CAHMS waiting times",
                   uiOutput("info_camhs_waiting_times_cw")
                 )
      )
    )

  } else if(input$indicator_type_info == "Create fair employment and good work for all") {

    wellPanel(
      h3("Create fair employment and good work for all"),
      bsCollapse(id = "info_collapse_fair_work", open = "Panel 1",

                 bsCollapsePanel(
                   "Employees on the living wage",
                   uiOutput("info_employees_living_wage_cw")
                 ),
                 bsCollapsePanel(
                   "Pay gap",
                   uiOutput("info_gender_pay_gap_cw")
                 ),
                 bsCollapsePanel(
                   "Work related ill health",
                   uiOutput("info_work_related_ill_health")
                 ),
                 bsCollapsePanel(
                   "Economic inactivity",
                   uiOutput("info_economic_inactivity_cw")
                 )
      )
    )

  } else if(input$indicator_type_info == "Ensure healthy standard of living for all") {

    wellPanel(
      h3("Ensure healthy standard of living for all"),
      bsCollapse(id = "info_collapse_healthy_standard", open = "Panel 1",

                 bsCollapsePanel(
                   "Food insecurity",
                   uiOutput("info_food_insecurity")
                 ),
                 bsCollapsePanel(
                   "Satisfaction with housing",
                   uiOutput("info_satisfaction_with_housing")
                 ),
                 bsCollapsePanel(
                   "Persistent poverty",
                   uiOutput("info_persistent_poverty")
                 )
      )
    )

  } else if(input$indicator_type_info == "Create and develop healthy and sustainable places and communities") {

    wellPanel(
      h3("Create and develop healthy and sustainable places and communities"),
      bsCollapse(id = "info_collapse_sustainable_communities", open = "Panel 1",

                 bsCollapsePanel(
                   "Number of areas where health inequalities are reducing",
                   uiOutput("info_areas_of_health_inequalities")
                 ),
                 bsCollapsePanel(
                   "Perceptions of local area",
                   uiOutput("info_perceptions_of_local_area")
                 ),
                 bsCollapsePanel(
                   "Places to interact",
                   uiOutput("info_places_to_interact")
                 ),
                 bsCollapsePanel(
                   "Loneliness",
                   uiOutput("info_loneliness")
                 )
      )
    )

  } else if(input$indicator_type_info == "Tackling discrimination, racism and their outcomes") {

    wellPanel(
      h3("Tackling discrimination, racism and their outcomes"),
      bsCollapse(id = "info_collapse_discrimination_racism", open = "Panel 1",

                 bsCollapsePanel(
                   "Public services treat people with dignity and respect",
                   uiOutput("info_dignity_respect")
                 ),
                 bsCollapsePanel(
                   "Gender balance in organisations",
                   uiOutput("info_gender_balance")
                 )
      )
    )

  } else if(input$indicator_type_info == "Pursuing environmental sustainability and health equity together") {

    wellPanel(
      h3("Pursuing environmental sustainability and health equity together"),
      bsCollapse(id = "info_collapse_environmental_sustainability", open = "Panel 1",

                 bsCollapsePanel(
                   "Access to green and blue space",
                   uiOutput("info_blue_green_space")
                 ),
                 bsCollapsePanel(
                   "Visits to the outdoors",
                   uiOutput("info_visit_outdoors")
                 ),
                 bsCollapsePanel(
                   "Journeys by active travel",
                   uiOutput("info_journeys_active")
                 )
      )
    )

  }


})
