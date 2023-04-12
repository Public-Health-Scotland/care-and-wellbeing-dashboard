##############################################.
# NAVIGATION BUTTONS----
##############################################.
# This buttons link to all the different tabs on the dashboard
# It gets sourced into the server script


##############################################.
# GENERAL BUTTONS----
##############################################.

# Summary page
observeEvent(input$jump_summary,
             {updateTabsetPanel(session, "intabset",
                                selected = "summary")})

# Info page
observeEvent(input$jump_info_notes,
             {updateTabsetPanel(session, "intabset",
                                selected = "info_notes")})

# INFO AND HOME BUTTONS NEED SET UP FROM EACH INDIVIDUAL TAB
# (I know, how annoying)
# Just copy the generic format below and add a tab label to the end of input
##############################################.
# GO TO INFO BUTTONS----
##############################################.
# Generic to copy (unused)
observeEvent(input$jump_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info")})



# # Jump info from summary
# observeEvent(input$summary_to_info,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "info_notes")})

# Child poverty
observeEvent(input$childpoverty_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
             updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Child poverty")})

# Positive destinations of school leavers
observeEvent(input$positivedestinations_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Positive destinations of school leavers")})

# Preschool development
observeEvent(input$preschooldevelopment_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Pre-school development")})

# Being listened to and involved in decision making
observeEvent(input$listento_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Being listened to and involved in decision making")})

# CAMHS
observeEvent(input$camhs_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "CAMHS waiting times")})

# Protection from harm
observeEvent(input$protectionharm_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Protection from harm")})


# Infant mortality
observeEvent(input$infantmortality_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Infant mortality")})

# Physical activity
observeEvent(input$physicalactivity_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Physical activity")})


# Mental health and wellbeing
observeEvent(input$mentalhealthwellbeing_to_info,
             {updateRadioButtons(session, inputId = "indicator_type_info",
                                 selected = "Wellbeing of children and young people")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_wellbeing",
                              open = "Mental health and wellbeing")})

# Fuel affordability
observeEvent(input$fuelaffordability_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, id = "info_collapse_finance",
                              open = "Fuel affordability")})

# HOUSEHOLD SPENDING
observeEvent(input$household_spending_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Household spending")})

# Managing financially
observeEvent(input$managingfinancially_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Managing financially")})

# Savings
observeEvent(input$savings_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Savings")})

# Unmanageable debt
observeEvent(input$unmanageabledebt_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Unmanageable debt")})

# Local authority funded advice
observeEvent(input$lafundedadvice_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Local authority funded advice")})


# Transport costs
observeEvent(input$transportcosts_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Transport costs")})

# Childcare uptake
observeEvent(input$childcareuptake_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Early learning and childcare uptake")})

observeEvent(input$benefituptake_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Financial security for low income households")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_finance",
                              open = "Benefit uptake and engagement with welfare advice")})

# Employees on living wage


observeEvent(input$employeeslivingwage_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  inputId = "indicator_type_info",
                                  selected = "Good, green jobs and fair work")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Employees on living wage")})



# Gender pay gap
observeEvent(input$genderpaygap_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Gender pay gap")})


# Disability employment gap
observeEvent(input$disabilityemploymentgap_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Disability employment gap")})


# Ethnicity employment gap
observeEvent(input$ethnicityemploymentgap_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Ethnicity employment gap")})


# Zero-hours contracts
observeEvent(input$zerohourscontract_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Zero-hours contracts")})


# SKILLS SHORTAGE VACANCIES
observeEvent(input$skills_shortage_vacancies_to_info,
             {updateRadioButtons(session,
                                  inputId = "indicator_type_info",
                                  selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Skills shortage vacancies")})

# Underemployment
observeEvent(input$underemployment_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Underemployment")})


# ECONOMIC INACTIVITY
observeEvent(input$economic_inactivity_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Economic inactivity")})

# Employability
observeEvent(input$employability_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Employability")})

# Contractually secure work
observeEvent(input$contractuallysecurework_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Contractually secure work")})

# Green Jobs
observeEvent(input$greenjobs_to_info,
             {updateRadioButtons(session,
                                 inputId = "indicator_type_info",
                                 selected = "Good, green jobs and fair work")
               updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateCollapse(session, "info_collapse_jobs",
                              open = "Green jobs")})


##############################################.
# INFO TAB LINKS ----
##############################################.
#
# observeEvent(input$info_childpoverty_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Child poverty"
#   )}))
#
# observeEvent(input$info_positivedestinations_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Positive destinations of school leavers"
#   )}))
#
# observeEvent(input$info_preschool_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Pre-school development"
#   )}))
#
# observeEvent(input$info_listento_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Being listened to and involved in decision making"
#   )}))
#
# observeEvent(input$info_camhs_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "CAMHS waiting times"
#   )}))
#
# observeEvent(input$info_protectionharm_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Protection from harm"
#   )}))
#
# observeEvent(input$info_infantmortality_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Infant mortality"
#   )}))
#
# observeEvent(input$info_physicalactivity_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Physical activity"
#   )}))
#
# observeEvent(input$info_mentalhealth_info, ({
#   updateCollapse(session, "info_collapse_wellbeing", open = "Mental health and wellbeing"
#   )}))
#
# observeEvent(input$info_fuelaffordability_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Fuel affordability"
#   )}))
#
# observeEvent(input$info_householdspending_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Household spending"
#   )}))
#
#
# observeEvent(input$info_managingfinancially_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Managing financially"
#   )}))
#
# observeEvent(input$info_savings_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Savings"
#   )}))
#
# observeEvent(input$info_unmanageabledebt_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Unmanageable debt"
#   )}))
#
# observeEvent(input$info_lafundedadvice_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Local authority funded advice"
#   )}))
#
# observeEvent(input$info_transportcosts_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Transport costs"
#   )}))
#
# observeEvent(input$info_childcareuptake_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Early learning and childcare uptake"
#   )}))
#
# observeEvent(input$info_benefituptake_info, ({
#   updateCollapse(session, "info_collapse_finance", open = "Benefit uptake and engagement with welfare advice"
#   )}))
#
# observeEvent(input$info_employeeslivingwage_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Employees on living wage"
#   )}))
#
# observeEvent(input$info_genderpaygap_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Gender pay gap"
#   )}))
#
# observeEvent(input$info_disabilityemploymentgap_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Disability employment gap"
#   )}))
#
# observeEvent(input$info_ethnicityemploymentgap_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Ethnicity employment gap"
#   )}))
#
# observeEvent(input$info_zerohourscontract_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Zero-hours contracts"
#   )}))
#
# observeEvent(input$info_skillsshortagevacancies_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Skills shortage vacancies"
#   )}))
#
# observeEvent(input$info_underemployment_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Underemployment"
#   )}))
#
# observeEvent(input$info_economicinactivity_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Economic inactivity"
#   )}))
#
# observeEvent(input$info_employability_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Employability"
#   )}))
#
# observeEvent(input$info_contractuallysecurework_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Contractually secure work"
#   )}))
#
# observeEvent(input$info_greenjobs_info, ({
#   updateCollapse(session, "info_collapse_jobs", open = "Green jobs"
#   )}))


##############################################.
# INFO TO INDICATOR BUTTONS ----
##############################################.


# Child poverty
observeEvent(input$info_to_childpoverty,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_poverty")})

# Positive destinations of school leavers
observeEvent(input$info_to_positivedestinations,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "positive_destinations")})
# Preschool development
observeEvent(input$info_to_preschool,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "pre_school_development")})

# Being listened to and involved in decision making
observeEvent(input$info_to_decisionmaking,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "listen_to_decision_making")})

# CAMHS
observeEvent(input$info_to_camhs,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "camhs_waiting_times")})

# Protection from harm
observeEvent(input$info_to_protectionharm,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "protection_from_harm")})

# Infant mortality
observeEvent(input$info_to_infantmortality,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "infant_mortality")})

# Physical activity
observeEvent(input$info_to_physicalactivity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "physical_activity")})

# Mental health and wellbeing
observeEvent(input$info_to_mentalhealth,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "mental_health_wellbeing")})

# Fuel affordability
observeEvent(input$info_to_fuelaffordability,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "fuel_affordability")})

# Household spending
observeEvent(input$info_to_householdspending,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "household_spending")})

# Contractually secure work
observeEvent(input$info_to_contractuallysecurework,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "contractually_secure_work")})

# Managing financially
observeEvent(input$info_to_managingfinancially,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "managing_financially")})

# Savings
observeEvent(input$info_to_savings,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "savings")})

# Unmanageable debt
observeEvent(input$info_to_unmanageabledebt,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "unmanageable_debt")})


# Local authority funded advice
observeEvent(input$info_to_lafundedadvice,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "la_funded_advice")})

# Transport costs
observeEvent(input$info_to_transportcosts,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "transport_costs")})

# Childcare uptake
observeEvent(input$info_to_childcareuptake,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "childcare_uptake")})

# Benefit uptake
observeEvent(input$info_to_benefituptake,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "benefit_uptake")})


# Employees on living wage
observeEvent(input$info_to_employeeslivingwage,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "employees_living_wage")})

# Gender pay gap
observeEvent(input$info_to_genderpaygap,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "gender_pay_gap")})

# Disability employment gap
observeEvent(input$info_to_disabilityemploymentgap,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "disability_employment_gap")})

# Ethnicity employment gap
observeEvent(input$info_to_ethnicityemploymentgap,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "ethnicity_employment_gap")})

# Zero-hours contract
observeEvent(input$info_to_zerohourscontract,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "zero_hours_contracts")})

# Skills shortage vacancies
observeEvent(input$info_to_skillsshortagevacancies,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "skills_shortage_vacancies")})

# Underemployment
observeEvent(input$info_to_underemployment,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "underemployment")})

# Economic inactivity
observeEvent(input$info_to_economicinactivity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "economic_inactivity")})

# Employability
observeEvent(input$info_to_employability,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "employability")})

# Green jobs
observeEvent(input$info_to_greenjobs,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "green_jobs")})

# Adult self assessed
observeEvent(input$info_to_adultselfassessed,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "adult_self_assessed_health")})
# Adults long term condition
observeEvent(input$info_to_adultslongterm,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "adult_living_limiting_long_term_condition")})
# Screening uptake
observeEvent(input$info_to_screeninguptake,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "screening_uptake")})
# Vaccinations
observeEvent(input$info_to_vaccinations,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "vaccinations")})

# Infant mortality
observeEvent(input$info_to_infantmortality,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "infant_mortality")})

# Healthy birthweight babies
observeEvent(input$info_to_birthweight,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "birthweight")})

# Children at risk of obesity
observeEvent(input$info_to_childobesity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_obesity")})

# First ever hospital admission for heart attack
observeEvent(input$info_to_heartattackadmission,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_obesity")})

# Drug-related hospital admissions
observeEvent(input$info_to_childobesity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_obesity")})

# Alcohol admissions
observeEvent(input$info_to_childobesity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_obesity")})

# Asthma hospital admissions
observeEvent(input$info_to_childobesity,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "child_obesity")})



##############################################.
# Go TO HOME BUTTONS----
##############################################.
# # Generic to copy (unused)
# observeEvent(input$jump_home,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Summary
# observeEvent(input$jump_home_summary,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
# # Child poverty
# observeEvent(input$jump_home_child_poverty,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # CAMHS
# observeEvent(input$jump_home_camhs_waiting_times,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Infant mortality
# observeEvent(input$jump_home_infant_mortality,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Preschool development
# observeEvent(input$jump_home_preschool,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Fuel poverty
# observeEvent(input$jump_home_fuel_affordability,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Savings
# observeEvent(input$jump_home_savings,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
# # Household expenditure
# observeEvent(input$jump_home_household_expenditure,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Childcare uptake
# observeEvent(input$jump_home_childcare_uptake,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Unmanageable debt
# observeEvent(input$jump_home_unmanageable_debt,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Employees on the living wage
# observeEvent(input$jump_home_employees_living_wage,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Gender pay gap
# observeEvent(input$jump_home_gender_pay_gap,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Disability employment gap
# observeEvent(input$jump_home_disability_employment_gap,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Ethnicity employment gap
# observeEvent(input$jump_home_ethnicity_employment_gap,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Employability
# observeEvent(input$jump_home_employability,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Skills Shortage Vacancies
# observeEvent(input$jump_home_skills_shortage_vacancies,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Economic Inactivity
# observeEvent(input$jump_home_economic_inactivity,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # Underemployment
# observeEvent(input$jump_home_underemployment,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Being listened to and involved in decision making
# observeEvent(input$jump_home_listen_to_decision_making,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # PROTECTION FROM HARM
# observeEvent(input$jump_home_protection_from_harm,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # Mental health and wellbeing
# observeEvent(input$jump_home_mental_health_wellbeing,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Physical Activity
# observeEvent(input$jump_home_physical_activity,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # Positive desinations of school leavers
# observeEvent(input$jump_home_positive_destinations,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # CHILDCARE UPTAKE
# observeEvent(input$jump_home_childcare_uptake,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # MANAGING FINANCIALLY
# observeEvent(input$jump_home_managing_financially,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # LOCAL AUTHORITY FUNDED ADVICE
# observeEvent(input$jump_home_la_funded_advice,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # TRANSPORT COSTS
# observeEvent(input$jump_home_transport_costs,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # CONTRACTUALLY SECURE WORK
# observeEvent(input$jump_home_contractually_secure_work,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # ZERO-HOURS CONTRACTS
# observeEvent(input$jump_home_zero_hours_contracts,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
# # GREEN JOBS
# observeEvent(input$jump_home_green_jobs,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})
#
#
# # Benefit uptake and engagement with welfare advice
# observeEvent(input$jump_home_benefit_uptake,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "home")})


##############################################.
# WELLBEING OF CHILDREN AND YOUNG PEOPLE----
##############################################.


# observeEvent(input$jump_physical_activity,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "physical_activity")})
#
# observeEvent(input$jump_mental_health_wellbeing,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "mental_health_wellbeing")})
#
# observeEvent(input$jump_child_poverty,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "child_poverty")})
#
# observeEvent(input$jump_positive_destinations,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "positive_destinations")})
#
# observeEvent(input$jump_pre_school_development,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "pre_school_development")})
#
# observeEvent(input$jump_listen_to_decision_making,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "listen_to_decision_making")})
#
# observeEvent(input$jump_camhs_waiting_times,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "camhs_waiting_times")})
#
# observeEvent(input$jump_protection_from_harm,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "protection_from_harm")})
#
# observeEvent(input$jump_infant_mortality,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "infant_mortality")})
#
# ##############################################.
# # FINANCIAL SECURITY----
# ##############################################.
#
# observeEvent(input$jump_fuel_affordability,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "fuel_affordability")})
#
# observeEvent(input$jump_savings,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "savings")})
#
# observeEvent(input$jump_unmanageable_debt,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "unmanageable_debt")})
#
# observeEvent(input$jump_household_spending,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "household_spending")})
#
# observeEvent(input$jump_childcare_uptake,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "childcare_uptake")})
#
# observeEvent(input$jump_managing_financially,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "managing_financially")})
#
# observeEvent(input$jump_transport_costs,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "transport_costs")})
#
# observeEvent(input$jump_benefit_uptake,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "benefit_uptake")})
#
# observeEvent(input$jump_zero_hours_contracts,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "zero_hours_contracts")})
#
# observeEvent(input$jump_contractually_secure_work,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "contractually_secure_work")})
#
# observeEvent(input$jump_green_jobs,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "green_jobs")})
#
# ##############################################.
# # GREEN JOBS----
# ##############################################.
# observeEvent(input$jump_employees_living_wage,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "employees_living_wage")})
# observeEvent(input$jump_gender_pay_gap,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "gender_pay_gap")})
# observeEvent(input$jump_employment_gap,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "employment_gap")})
# observeEvent(input$jump_employability,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "employability")})
#
# observeEvent(input$jump_skills_shortage_vacancies,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "skills_shortage_vacancies")})
#
# observeEvent(input$jump_economic_inactivity,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "economic_inactivity")})
#
# observeEvent(input$jump_underemployment,
#              {updateTabsetPanel(session, "intabset",
#                                 selected = "underemployment")})
#
#


##############################################.
# JE DASHBOARD
##############################################.
observeEvent(input$jump_home_wellbeing,
             {updateTabsetPanel(session, "intabset",
                                selected = "home")})

observeEvent(input$jump_home_financial_security,
             {updateTabsetPanel(session, "intabset",
                                selected = "home")})

observeEvent(input$jump_home_good_green,
             {updateTabsetPanel(session, "intabset",
                                selected = "home")})



########## TO INFO ###############################

observeEvent(input$adult_risk_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Adult risk of health")})

observeEvent(input$child_start_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Giving every child the best start in life")})

