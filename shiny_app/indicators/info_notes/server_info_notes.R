
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
                   "Local authority funded advice",
                   uiOutput("info_lafundedadvice")
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
                   uiOutput("info_benefitsuptake")
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
                   uiOutput("info_healthy_life_expctancy")
                 ),
                 bsCollapsePanel(
                   "Healthy Weight adults",
                   uiOutput("info_healthy_weight")
                 ),
                 bsCollapsePanel(
                   "Limiting long-term conditions (age 16+)",
                   uiOutput("info_experience_of_unpaid_carers")
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
                   uiOutput("info_adults_self_assessed_health")
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
    # }  else if(input$indicator_type_info == "Giving every child the best start in life") {
    #
    #   wellPanel(
    #     h3("Giving every child the best start in life"),
    #     bsCollapse(id = "info_collapse_child_start", open = "Panel 1",
    #                bsCollapsePanel(
    #                  "Infant mortality",
    #                  uiOutput("info_infant_mortality_pop")
    #                ),
    #                bsCollapsePanel(
    #                  "Healthy birthweight babies",
    #                  uiOutput("info_healthy_birthweight")
    #                ),
    #                bsCollapsePanel(
    #                  "Children at risk of obesity",
    #                  uiOutput("info_children_at_risk_of_obesity")
    #                )
    #
    #     )
    #   )
    # } else if(input$indicator_type_info == "Hospital admissions") {
    #
    #   wellPanel(
    #     h3("Hospital admissions"),
    #     bsCollapse(id = "info_collapse_hospital_admissions", open = "Panel 1",
    #                bsCollapsePanel(
    #                  "First ever hospital admission for heart attack",
    #                  uiOutput("info_heart_attack")
    #                ),
    #                bsCollapsePanel(
    #                  "Drug-related hospital admissions",
    #                  uiOutput("info_drug_admissions")
    #                ),
    #                bsCollapsePanel(
    #                  "Alcohol admissions",
    #                  uiOutput("info_alcohol_admissions")
    #                ),
    #                bsCollapsePanel(
    #                  "Asthma hospital admissions",
    #                  uiOutput("info_asthma_hospital_adm")
    #                )
    #     )
    #   )
    # } else if(input$indicator_type_info == "Mortality") {
    #
    #   wellPanel(
    #     h3("Mortality"),
    #     bsCollapse(id = "info_collapse_mortality", open = "Panel 1",
    #                bsCollapsePanel(
    #                  "All-cause mortality",
    #                  uiOutput("info_all_cause_mortality")
    #                ),
    #                bsCollapsePanel(
    #                  "Coronary Heart Disease (CHD) deaths",
    #                  uiOutput("info_chd_deaths")
    #                ),
    #                bsCollapsePanel(
    #                  "Drug-related deaths",
    #                  uiOutput("info_drug_deaths")
    #                ),
    #                bsCollapsePanel(
    #                  "Alcohol-specific deaths (aged 45-74)",
    #                  uiOutput("info_alcohol_deaths")
    #                )
    #     )
    #   )
    # } else if(input$indicator_type_info == "Social carers survey") {
    #
    #   wellPanel(
    #     h3("Mortality"),
    #     bsCollapse(id = "info_collapse_social_carers_survey", open = "Panel 1",
    #                bsCollapsePanel(
    #                  "Experience of social care recipients",
    #                  uiOutput("info_experience_recipients")
    #                ),
    #                bsCollapsePanel(
    #                  "Experience of unpaid carers",
    #                  uiOutput("info_experience_of_unpaid_carers")
    #                )
    #     )
    #   )
  }
})
