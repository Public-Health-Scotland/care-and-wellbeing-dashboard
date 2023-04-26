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
