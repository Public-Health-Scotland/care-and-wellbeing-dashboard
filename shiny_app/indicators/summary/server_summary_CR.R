
##### Geog selectors #####

observeEvent(input$geog_type_summary_CR,
             {

               geog_filtered = geog_lookup %>%
                 filter(geography_type == input$geog_type_summary_CR)

               #select_choice <- ifelse(input$geog_type_summary_CR == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "geog_name_summary_CR",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(geog_filtered$geography))#,
               #selected = "")
             })

################################################.
# WELLBEING OF CHILDREN AND YOUNG PEOPLE ----
################################################.

##### Being listened to and involved in decision making #####

output$listen_to_decision_making_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("listen_to_decision_making_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### CAMHS waiting times #####

output$camhs_waiting_times_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("camhs_waiting_times_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Child Poverty #####

output$child_poverty_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("child_poverty_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Infant mortality #####

output$infant_mortality_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("infant_mortality_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Mental health and wellbeing #####

output$mental_health_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("mental_health_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Physical activity #####

output$physical_activity_children_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("physical_activity_children_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Positive destinations of school leavers #####

output$positive_destinations_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("positive_destinations_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Pre-School development #####

output$child_development_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("child_development_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})

##### Protection from harm #####

output$protection_from_harm_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("protection_from_harm_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("hands-holding-child"),
          color = "purple")
})


################################################.
# FINANCIAL SECURITY FOR LOW INCOME HOUSEHOLDS ----
################################################.

##### Benefit uptake and engagement with welfare advice #####

output$benefits_uptake_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("benefits_uptake_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Cost of living #####

output$cost_of_living_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("cost_of_living_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### ELC uptake #####

output$childcare_uptake_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("childcare_uptake_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Food affordability #####

output$food_affordability_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("food_affordability_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Fuel affordability #####

output$fuel_affordability_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("fuel_affordability_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Managing financially #####

output$managing_financially_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("managing_financially_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Savings #####

output$savings_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("savings_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Transport costs #####

output$transport_costs_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("transport_costs_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

##### Unmanageable debt #####

output$unmanageable_debt_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("unmanageable_debt_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("sterling-sign"),
          color = "purple")
})

################################################.
# GOOD, GREEN JOBS AND FAIR WORK ----
################################################.

##### Contractually secure work #####

output$contractually_secure_work_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("contractually_secure_work_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Disability employment gap #####

output$disability_employment_gap_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("disability_employment_gap_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Economic Inactivity #####

output$economic_inactivity_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("economic_inactivity_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Employability #####

output$employability_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("employability_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Employees living wage #####

output$employees_living_wage_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("employees_living_wage_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Ethnicity employment gap #####

output$ethnicity_employment_gap_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("ethnicity_employment_gap_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Gender pay gap #####

output$gender_pay_gap_cr_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("gender_pay_gap_cr_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Green Jobs #####

output$green_jobs_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("green_jobs_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Skills shortage vacancies #####

output$skills_shortage_vacancies_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("skills_shortage_vacancies_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Underemployment #####

output$underemployment_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("underemployment_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})

##### Zero hours contracts #####

output$zero_hours_contracts_infobox <- renderInfoBox({
  infoBox(title=h5("",
                   summaryButtonUI("zero_hours_contracts_summary_info",
                                   "",
                                   paste(""))),
          value="Not available",
          subtitle = glue(""),
          icon = icon_no_warning_fn("briefcase"),
          color = "purple")
})
