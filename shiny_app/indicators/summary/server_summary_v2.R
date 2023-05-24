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
                     selected = "adults_self_assessed_health")
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

