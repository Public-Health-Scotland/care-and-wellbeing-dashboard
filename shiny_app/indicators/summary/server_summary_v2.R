observeEvent(input$jump_summary_to_asthma_admissions, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "asthma_admissions")

})

observeEvent(input$jump_summary_to_alcohol_deaths, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "alcohol")
  updateTabItems(session = session,
                 inputId = "alcohol_tabBox",
                 selected = "alcohol_deaths")

})

observeEvent(input$jump_summary_to_alcohol_admissions, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "alcohol")
  updateTabItems(session = session,
                 inputId = "alcohol_tabBox",
                 selected = "alcohol_admissions")

})

observeEvent(input$jump_summary_to_all_cause_mortality, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "all_cause_mortality")
})

observeEvent(input$jump_summary_to_chd_deaths, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "chd_deaths")
})


observeEvent(input$jump_summary_to_drug_deaths, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "drugs")
  updateTabItems(session = session,
                 inputId = "drugs_tabBox",
                 selected = "drug_deaths")

})

observeEvent(input$jump_summary_to_drug_admissions, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "drugs")
  updateTabItems(session = session,
                 inputId = "drugs_tabBox",
                 selected = "drug_admissions")

})


observeEvent(input$jump_summary_to_experience_of_unpaid_carers_agree, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "experience_of_unpaid_carers")
})

observeEvent(input$jump_summary_to_experience_of_unpaid_carers_disagree, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "experience_of_unpaid_carers")
})


observeEvent(input$jump_summary_to_hospital_admission_heart_attack, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "hospital_admission_heart_attack")
})


observeEvent(input$jump_summary_to_healthy_birthweight, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "healthy_birthweight")
})


observeEvent(input$jump_summary_to_adult_long_term_condition, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "adult_long_term_condition")
})


observeEvent(input$jump_summary_to_adults_self_assessed_health, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "adult_self_assessed_health")
})


observeEvent(input$jump_summary_to_experience_recipients, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "experience_recipients")
})


observeEvent(input$jump_summary_to_health_risk_behaviours, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "health_risk_behaviours")
})


observeEvent(input$jump_summary_to_healthy_life_expectancy, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "healthy_life_expectancy")
})


observeEvent(input$jump_summary_to_healthy_weight, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "healthy_weight")
})


observeEvent(input$jump_summary_to_mental_wellbeing, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "mental_wellbeing")
})


observeEvent(input$jump_summary_to_physical_activity, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "physical_activity")
})


observeEvent(input$jump_summary_to_premature_mortality, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "premature_mortality")
})


observeEvent(input$jump_summary_to_premature_mortality, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "premature_mortality")
})

observeEvent(input$jump_summary_to_premature_mortality, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "premature_mortality")
})


observeEvent(input$jump_summary_to_quality_care, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "quality_care")
})


observeEvent(input$jump_summary_to_screening, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "screening")
})


observeEvent(input$jump_summary_to_vaccinations, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "vaccinations")
})


observeEvent(input$jump_summary_to_work_related_health, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "strengthen_prevention")
  updateNavlistPanel(session = session,
                     inputId = "strengthen_prevention_panel",
                     selected = "work_related_health")
})



observeEvent(input$jump_summary_to_children_at_risk_of_obesity, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "children_at_risk_of_obesity")
})


observeEvent(input$jump_summary_to_child_development_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "child_development_cw")
})


observeEvent(input$jump_summary_to_infant_mortality_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "infant_mortality_cw")
})


observeEvent(input$jump_summary_to_child_material_deprivation, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "child_material_deprivation")
})


observeEvent(input$jump_summary_to_child_wellbeing, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "child_wellbeing")
})


observeEvent(input$jump_summary_to_perinatal_mortality, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "perinatal_mortality")
})


observeEvent(input$jump_summary_to_physical_activity_children_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "child_start")
  updateNavlistPanel(session = session,
                     inputId = "child_start_panel",
                     selected = "physical_activity_children_cw")
})


observeEvent(input$jump_summary_to_camhs_waiting_times_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "control_lives")
  updateNavlistPanel(session = session,
                     inputId = "control_lives_panel",
                     selected = "camhs_waiting_times_cw")
})


observeEvent(input$jump_summary_to_children_relationships, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "control_lives")
  updateNavlistPanel(session = session,
                     inputId = "control_lives_panel",
                     selected = "children_relationships")
})


observeEvent(input$jump_summary_to_childrens_voices, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "control_lives")
  updateNavlistPanel(session = session,
                     inputId = "control_lives_panel",
                     selected = "childrens_voices")
})


observeEvent(input$jump_summary_to_confidence_of_young, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "control_lives")
  updateNavlistPanel(session = session,
                     inputId = "control_lives_panel",
                     selected = "confidence_of_young")
})



observeEvent(input$jump_summary_to_mental_health_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "control_lives")
  updateNavlistPanel(session = session,
                     inputId = "control_lives_panel",
                     selected = "mental_health_cw")
})



observeEvent(input$jump_summary_to_economic_inactivity_cw_want, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "fair_work")
  updateNavlistPanel(session = session,
                     inputId = "fair_work_panel",
                     selected = "economic_inactivity_cw")
})


observeEvent(input$jump_summary_to_economic_inactivity_cw_not_want, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "fair_work")
  updateNavlistPanel(session = session,
                     inputId = "fair_work_panel",
                     selected = "economic_inactivity_cw")
})


observeEvent(input$jump_summary_to_employees_living_wage_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "fair_work")
  updateNavlistPanel(session = session,
                     inputId = "fair_work_panel",
                     selected = "employees_living_wage_cw")
})


observeEvent(input$jump_summary_to_gender_pay_gap_cw, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "fair_work")
  updateNavlistPanel(session = session,
                     inputId = "fair_work_panel",
                     selected = "gender_pay_gap_cw")
})


observeEvent(input$jump_summary_to_work_related_ill_health, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "fair_work")
  updateNavlistPanel(session = session,
                     inputId = "fair_work_panel",
                     selected = "work_related_ill_health")
})


observeEvent(input$jump_summary_to_food_insecurity, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "healthy_standard")
  updateNavlistPanel(session = session,
                     inputId = "healthy_standard_panel",
                     selected = "food_insecurity")
})


observeEvent(input$jump_summary_to_persistent_poverty, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "healthy_standard")
  updateNavlistPanel(session = session,
                     inputId = "healthy_standard_panel",
                     selected = "persistent_poverty")
})


observeEvent(input$jump_summary_to_satisfaction_with_housing, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "healthy_standard")
  updateNavlistPanel(session = session,
                     inputId = "healthy_standard_panel",
                     selected = "satisfaction_with_housing")
})


observeEvent(input$jump_summary_to_loneliness, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "sustainable_communities")
  updateNavlistPanel(session = session,
                     inputId = "sustainable_communities_panel",
                     selected = "loneliness")
})


observeEvent(input$jump_summary_to_areas_of_health_inequalities, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "sustainable_communities")
  updateNavlistPanel(session = session,
                     inputId = "sustainable_communities_panel",
                     selected = "areas_of_health_inequalities")
})


observeEvent(input$jump_summary_to_perceptions_of_local_area, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "sustainable_communities")
  updateNavlistPanel(session = session,
                     inputId = "sustainable_communities_panel",
                     selected = "perceptions_of_local_area")
})


observeEvent(input$jump_summary_to_places_to_intereact, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "sustainable_communities")
  updateNavlistPanel(session = session,
                     inputId = "sustainable_communities_panel",
                     selected = "places_to_intereact")
})


observeEvent(input$jump_summary_to_gender_balance, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "discrimination_racism")
  updateNavlistPanel(session = session,
                     inputId = "discrimination_racism_panel",
                     selected = "gender_balance")
})


observeEvent(input$jump_summary_to_dignity_respect, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "discrimination_racism")
  updateNavlistPanel(session = session,
                     inputId = "discrimination_racism_panel",
                     selected = "dignity_respect")
})


observeEvent(input$jump_summary_to_blue_green_space, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "environmental_sustainability")
  updateNavlistPanel(session = session,
                     inputId = "environmental_sustainability_panel",
                     selected = "blue_green_space")
})


observeEvent(input$jump_summary_to_journeys_active, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "environmental_sustainability")
  updateNavlistPanel(session = session,
                     inputId = "environmental_sustainability_panel",
                     selected = "journeys_active")
})


observeEvent(input$jump_summary_to_visit_outdoors, {

  updateTabsetPanel(session = session,
                    inputId = "intabset",
                    selected = "environmental_sustainability")
  updateNavlistPanel(session = session,
                     inputId = "environmental_sustainability_panel",
                     selected = "visit_outdoors")
})






