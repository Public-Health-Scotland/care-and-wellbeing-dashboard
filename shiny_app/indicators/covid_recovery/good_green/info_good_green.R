##############################################.
# CONTRACTUALLY SECURE WORK ----
##############################################.

output$info_contractually_secure_work = renderUI({

  tagList(

    h4("Contractually secure work"),

    br(),

    bsButton("info_to_contractually_secure_work", "Go to contractually secure work tab")

  )

})



##############################################.
# EMPLOYEES ON LIVING WAGE CR ----
##############################################.

output$info_employees_living_wage_cr = renderUI({

  tagList(

    h4("Employees on living wage"),

    br(),

    bsButton("info_to_employees_living_wage_cr", "Go to employees on living wage tab")

  )

})

observeEvent(input$employees_living_wage_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Proportion of employees (18+) earning less than the real Living Wage "),
                 h4("Source"),
                 p("Annual Survey of Hours and Earnings, ONS"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Estimates for employees aged 18+ on the PAYE system on adult rates whose pay for the survey pay-period was not affected by absence. Estimates for 2020 and 2021 include employees who have been furloughed under the Coronavirus Job Retention Scheme (CJRS)."
                     ),
                     tags$li(
                       "2021 data are provisional."
                     ),
                     tags$li(
                       "Levels calculated using low pay calibration weights in line with ONS guidance."
                     ),
                     tags$li(
                       "Hourly earnings excludes any overtime payments."
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$employees_living_wage_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The proportion of employees earning less than the Living Wage has decreased from 18.8% in 2012 to 14.4% in 2021; and decreased 0.7 percentage points from 2020 to 2021. The proportion of employees earning less than the Living Wage is now lower than at any previous point in the series, which began in 2012. This indicates that performance is maintaining."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


##############################################.
# GENDER PAY GAP CR ----
##############################################.

output$info_gender_pay_gap_cr = renderUI({

  tagList(

    h4("Gender pay gap"),

    br(),

    bsButton("info_to_gender_pay_gap_cr", "Go to gender pay gap tab")

  )

})

observeEvent(input$gender_pay_gap_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Difference between male and female full-time hourly earnings, as % of male full time hourly earnings."),
                 h4("Source"),
                 p("Annual Survey of Hours and Earnings, ONS"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Estimates for employees aged 16+ on the PAYE system on adult rates whose pay for the survey pay-period was not affected by absence. Estimates for 2020 and ",
                       "have been furloughed under the Coronavirus Job Retention Scheme (CJRS)."
                     ),
                     tags$li(
                       "2021 data are provisional."
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$gender_pay_gap_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The gender pay gap has decreased from 8.4% in 2012. In 2021, the gender pay gap for Scotland was 3.0%, an increase of 0.6 percentage points on the previous year. This indicates that performance is maintaining."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# DISABILITY EMPLOYMENT GAP ----
##############################################.

output$info_disability_employment_gap = renderUI({

  tagList(

    h4("Disability employment gap"),

    br(),

    bsButton("info_to_disability_employment_gap", "Go to disability employment gap tab")

  )

})

observeEvent(input$disability_employment_gap_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Difference between employment rates of disabled and non-disabled adults aged 16-64."),
                 h4("Source"),
                 p("Annual Population Survey, Jan-Dec datasets, ONS"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Rates are rounded to one decimal place."
                     ),
                     tags$li(
                       "Rates, Gaps and changes over time are based on unrounded numbers."
                     ),
                     tags$li(
                       "Estimates are for those aged 16 to 64."
                     ),
                     tags$li(
                       "Rates use total population for specified group as denominator."
                     ),
                     tags$li(
                       "Gap calculated as Not Equality Act Disabled minus Equality Act Disabled populations."
                     ),
                     tags$li(
                       "Data is subject to sampling variation."
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$disability_employment_gap_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The disabled employment rate gap has decreased from 37.9 percentage points in 2014. From 2020 to 2021, it decreased from 33.4 percentage points to 31.0 percentage points. This indicates that performance is improving."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# ETHNICITY EMPLOYMENT GAP ----
##############################################.

output$info_ethnicity_employment_gap = renderUI({

  tagList(

    h4("Ethnicity employment gap"),

    br(),

    bsButton("info_to_ethnicity_employment_gap", "Go to ethnicity employment gap tab")

  )

})

observeEvent(input$ethnicity_employment_gap_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Difference between employment rates of white adults aged 16-64 and adults from minority ethnic groups"),
                 h4("Source"),
                 p("Annual Population Survey, Apr-Mar datasets, ONS"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Due to changes in the ethnicity questions on the Annual Population Survey during 2011 these estimates should not be used as a timeseries.",
                       "They can, however, be used to estimate the relative levels of economic activity of the different ethnic groupings. ",
                       "A more detailed note is available on the ONS website at: ",
                       tags$a(href ="https://publichealthscotland.scot/publications/show-all-releases?id=20497",
                              "Office for National Statistics")
                     ),
                     tags$li(
                       "Rates are rounded to one decimal place."
                     ),
                     tags$li(
                       "Rates and Gap are based on unrounded numbers."
                     ),
                     tags$li(
                       "Rates are for those aged 16 to 64."
                     ),
                     tags$li(
                       "Rates use the total population as denominator."
                     ),
                     tags$li(
                       "Gap calculated as White minus Minority Ethnic populations."
                     ),
                     tags$li(
                       "Data is subject to sampling variation and is not seasonally adjusted."
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$ethnicity_employment_gap_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 p("From 2011/2012, the ethnicity employment gap had been largely increasing, reaching peak of 18% in 2018/19. ", br(),
                   "The year before the pandemic the gap started to fall and continued to fall in the during/post pandemic period.", br(),
                   "There are not enough data points to determine if this reduction in the employment gap represents an enduring trend.", br(),
                   "The changes in ethnicity employment are not obviously related to the pandemic."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# ZERO-HOURS CONTRACT ----
##############################################.

output$info_zero_hours_contract = renderUI({

  tagList(

    h4("Zero-hours contract"),

    br(),

    bsButton("info_to_zero_hours_contract", "Go to zero-hours contract tab")

  )

})

observeEvent(input$zero_hours_contracts_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("percentage of people in employment on a zero-hours contract"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$zero_hours_contracts_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The percentage of people in employment on a zero-hours contract has increased slightly  over the year to 2022 by 0.6 percentage points, and marginally since Jan-Mar 2020 (2.6%). In the latest period (Jan-Mar 2022) 78,000 people were employed on Zero hours contracts."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# SKILLS SHORTAGE VACANCIES ----
##############################################.

output$info_skills_shortage_vacancies = renderUI({

  tagList(

    h4("Skills shortage vacancies"),

    br(),

    bsButton("info_to_skills_shortage_vacancies", "Go to skills shortage vacancies tab")

  )

})

observeEvent(input$skills_shortage_vacancies_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Skills Shortage Vacancies"),

                 p("This indicator measures the proportion of establishments in Scotland with skills shortage vacancies (SSV) ",
                   "using the Employer Skills Survey (ESS)."),

                 p("The proportion of employers in Scotland with at least one skills shortage vacancy ",
                   "(i.e. vacancies which are reported to be hard to fill because applicants lack relevant skills, qualifications or experiences) ",
                   "in 2020 was 3%, a decrease of 3 percentage points from 2017. ",
                   "This indicates that performance is improving. "),

                 tags$a(href ="https://nationalperformance.gov.scot/skill-shortage-vacancies",
                        "Source: Scottish Employer Skills Survey 2020"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))

             ))
##############################################.
# UNDEREMPLOYMENT ----
##############################################.

output$info_underemployment = renderUI({

  tagList(

    h4("Underemployment"),

    br(),

    bsButton("info_to_underemployment", "Go to underemployment tab")

  )

})

observeEvent(input$underemployment_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Proportion of adults >16 who are in employment and would like to work longer hours, have an additional job or find a different job with more hours"),
                 p("Underemployment estimates cover those looking for:"),
                 tags$ul(
                   tags$li(
                     "Additional hours in their existing role (at the same rate of pay)."
                   ),
                   tags$li(
                     "An additional job (to supplement their existing job)."
                   ),
                   tags$li(
                     "A different job with more hours."
                   )
                 ),

                 h4("Source"),
                 p("Annual Population Survey, Jan-Dec datasets, ONS"),

                 h4("Note"),
                 tags$ul(
                   tags$li(
                     "Estimates are for those aged 16 and over."
                   ),
                   tags$li(
                     "Proportions use employed population as denominator excluding those who did not know and/or refused to answer."
                   ),
                   tags$li(
                     "Data is subject to sampling variation."
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$underemployment_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("In April 2020-March 2021, the underemployment rate (hours based underemployment as a percentage of all people aged 16 and over in employment) was estimated at 8.5%, 1.6 percentage points higher than in April 2019-March 2020. This represents a statistically significant increase over the year. "),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# ECONOMIC INACTIVITY CR ----
##############################################.

output$info_economic_inactivity_cr = renderUI({

  tagList(

    h4("Economic inactivity"),

    br(),

    bsButton("info_to_economic_inactivity_cr", "Go to economic inactivity tab")

  )

})

observeEvent(input$economic_inactivity_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Economic Inactivity"),

                 p("This indicator measures the proportion percentage of economically inactive adults 16-64 who want to work ",
                   "using the Annual Population Survey (Scotland's Labour Market - People, Places and Regions)."),

                 p("The proportion of those who were economically inactive and would like to work increased by 0.9 percentage points, ",
                   "from 20.7 per cent in April 2019-March 2020 (the lowest point in the series to date) to 21.6 per cent in April 2020-March 2021."),

                 tags$a(href ="https://www.gov.scot/collections/labour-market-statistics/",
                        "Source: Annual Population Survey 2020"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))

             ))

##############################################.
# EMPLOYABILITY ----
##############################################.

output$info_employability = renderUI({

  tagList(

    h4("Employability"),

    br(),

    bsButton("info_to_employability", "Go to employability tab")

  )

})

observeEvent(input$employability_FSS_start_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Number of starts on Fair Start Scotland."
                     )
                   )
                 ),
                 h4("Source"),
                 p("Scotland's Devolved Employment Services: statistical summary"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Job outcomes (3 months, 6 months, or 1 year sustained employment) can only be reached when the participant has been in the service for at least that time. ",br(),
                       "This means that when reporting by start month, the most recent months will show no sustained job outcomes.", br(),
                       "The outcome rates for the most recent months are likely to increase over time."
                     ),
                     tags$li(
                       "For each start cohort, the numbers and proportion of job starts, and job outcomes will continue to increase until participants' time in FSS comes to an end.",
                       br(),
                       "Near final figures for job starts and early leavers are available up to the end of March 2021 (January - March 2021 quarter)",
                       br(),
                       "Near final figures for 3 month job outcomes are available up to the end of December 2020 (October - December 2020 quarter)",
                       br(),
                       "Near final figures for 6 month job outcomes are available up to the end of September 2020 (July - September 2020 quarter)",
                       br(),
                       "Near final figures for 12 month job outcomes are available up to the end of March 2020 (January - March 2020 quarter)"
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$employability_FSS_start_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 p("Comparing the pre-pandemic period (April 2018 –Jan 2020) with the during/post pandemic period (April 2020-Jan 2022) the proportion of job starts and the proportion that had sustained employment for three months was very similar.",
                   br(),
                   "The proportion of those who sustained employment for 6 months or more was much less in the during/post pandemic period compared to the pre-pandemic period. No improvements in these longer term employment outcomes are evident.",
                   br(),
                   "Please note that the data for the recent months are likely to be incomplete, as job outcomes (3 months, 6 months, or 1 year sustained employment) can only be reached when the participant has been in the service for at least that time."
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))




observeEvent(input$employability_FSS_referral_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "Number of referrals on Fair Start Scotland."

                     ),
                     tags$li(
                       "Number of starts (based on referal date) on Fair Start Scotland."
                     )
                   )
                 ),
                 h4("Source"),
                 p("Scotland's Devolved Employment Services: statistical summary"),
                 h4("Notes"),
                 tags$div(
                   tags$ul(
                     tags$li(
                       "This graph shows referrals during the quarter of their referral date, in order to show the proportion of referrals who go on to start.",
                       "It does not show the number of starts per quarter - which would need to be based on start date."

                     ),
                     tags$li(
                       "The most recent quarter includes people who have not had time to join FSS, and so the start rate is likely to increase."
                     )
                   )
                 ),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$employability_FSS_referral_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p(),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# GREEN JOBS ----
##############################################.

output$info_green_jobs = renderUI({

  tagList(

    h4("Green jobs"),

    br(),

    bsButton("info_to_green_jobs", "Go to green jobs tab")

  )

})
