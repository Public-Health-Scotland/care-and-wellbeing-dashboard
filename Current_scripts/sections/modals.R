##############################################.
# SUMMARY/INFO/SOURCE MODALS ----
##############################################.
observeEvent(input$new_next,
             showModal(modalDialog( # creats a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Future updates"),
               tags$ul(
                 tags$li("7 July 2023 - Allergies data update."),
                 tags$li("16 June 2025 - Asthma data update.")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)")))) # creates the esc button for closing the popup box


observeEvent(input$preschool_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Pre-school development"),

                 p("Early child development is influenced by both biological factors (such as being born premature)",
                   " and environmental factors (such as the parenting and opportunities for play and exploration children receive). ",
                   "Problems with early child development are important as they are strongly associated with long-term health, educational, and wider social difficulties."),

                 p("Detecting developmental problems early provides the best opportunity to support children and families to improve outcomes.",
                   " There is good evidence that parenting support and enriched early learning opportunities can improve outcomes for children with,",
                   " or at risk of, developmental delay. There is also increasing evidence that intensive early",
                   " interventions for children with serious developmental problems can also improve outcomes."),
                 p("All children in Scotland are offered the child health programme which includes a series of child health reviews,",
                   " including an assessment of children’s development at 13-15 months, 27-30 months and 4-5 years.",
                   " These reviews involve asking parents about their child’s progress, carefully observing the child,",
                   " and supporting parents to complete a structured questionnaire about the child’s development. ",
                   "At the end of the review Health Visitors record whether they have any concerns about each area of the child’s development."),

                 tags$a(href ="https://publichealthscotland.scot/publications/show-all-releases?id=20569",
                        "Source: Early Child Development, Public Health Scotland"),
                 size = "m",
                 easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))

             ))


observeEvent(input$camhs_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("CAMHS waiting times"),

                 p("Child and Adolescent Mental Health Services (CAMHS) data are collected from all NHS Health Boards ",
                   "across Scotland in a variety of ways. The Scottish Government standard states that 90% of ",
                   "children and young people should start treatment within 18 weeks of referral to CAMHS."),

                 p("For all children/young people referred into the service during the Covid-19 pandemic CAMHS ",
                   "are providing initial telephone triage to elicit more information. Dependent on levels of ",
                   "risk identified some will be offered a time/date to undertake a complete assessment where ",
                   "others, where levels of risk/concern identified a face-to-face assessment will be offered."),

                 tags$a(href ="https://publichealthscotland.scot/publications/show-all-releases?id=20497",
                        "Source: CAMHS Waiting Times, Public Health Scotland"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))

             ))


observeEvent(input$infant_mortality_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Rate of infant deaths per 1,000 live births in Scotland."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$infant_mortality_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 p(tags$b("Prepandemic period (July 2017-jan 2020):"),"Infant mortality fluctuated during this period but generally remained steady (i.e., there wasn’t a clear increasing or decreasing trend).",
                   br(),
                   tags$b("During/post pandemic period (March 2020-March 2021):"),"Again, infant mortality fluctuated during this period, however, an upward trend was evident from January 2021 onwards."),

                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$positive_destinations_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Percentage of all school leavers in positive destinations at 9 month follow up "),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$positive_destinations_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 p("From 2009/10 to 2020/21 there has been a general increase in the proportion of school leavers with positive destinations. Data in the during/post pandemic period (2020/21) continued this trend.",
                   br(),
                   tags$b("Note:"),"During 2019/20 there was a slight decrease in the proportion of school leavers with positive destination, but this was in the pre-pandemic period. "),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$protection_from_harm_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

observeEvent(input$protection_from_harm_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The proportion of households reporting that they manage well financially increases with income, with 76% of households with an annual income exceeding £30,000 reported that they managed well financially."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))




observeEvent(input$managing_financially_madal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Percentage of households with net annual household income of up to £30,000 report managing well financially."),
                 h4("Source"),
                 p("Scottish Household Survey Finance data tables, Scotland, 2020"),
                 h4("Note"),
                 p("'Refused' and 'Do not know' responses are excluded."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$managing_financially_madal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The proportion of households reporting that they manage well financially increases with income, with 76% of households with an annual income exceeding £30,000 reported that they managed well financially."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$Savings_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("percentage of households with net annual household income of up to £30,000 that have no savings."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$Savings_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The proportion of households with net annual household income of up to £30,000 that reported having no savings increased from between from 2017, but is similar to levels in 2013 and 2015."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$unmanageable_debt_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("percentage of households where the households is falling behind with bills or credit commitments and either making excessive debt repayments"),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$unmanageable_debt_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The estimated proportion of households in unmanageable debt was slightly higher compared to the previous period, and had shown no notable change in the preceding period. This indicates that performance is maintaining. "),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


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


observeEvent(input$household_spending_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Food affordability and the cost of living: Proportion of total household expenditure spent"),
                 p("Food affordability is measured by the change in proportion of total expenditure spent",
                   " on food and non-alcoholic drinks over time."),
                 p("Cost of living is defined as the sum of the proportion of total household expenditure spent",
                   " on food, non-alcoholic drinks, housing (net), fuel, power, and household goods and services."),
                 p("Following Government guidance in relation to the coronavirus (COVID-19) pandemic, a pause in data collection ",
                   "led to interviews being conducted for 13 fewer days in March 2020 than planned. ",
                   "Final March interviews took place on Monday March 16th. All households that were not interviewed as a ",
                   "result were treated as non-responders and data were weighted to account for reduced data collection in March 2020 compared to previous years."),
                 tags$a(href ="https://www.ons.gov.uk/peoplepopulationandcommunity/personalandhouseholdfinances/incomeandwealth/methodologies/livingcostsandfoodsurvey",
                        "Source: Living Costs and Food Survey, Office for National Statistics"),
                 size = "m",
                 easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))

             ))

observeEvent(input$childcare_uptake_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("ELC uptake: Proportion of children receiving funded ELC who are accessing 1140 hours of funded ELC"),
                 p("The duty on local authorities to secure 1140 hours funded ELC for all eligible children has been in effect since 1st August 2021."),
                 p("The number of three-to-five-year-olds reported to be receiving funded ELC in January 2022 was 104,661.", "
                   Of these, 88% were reported to be accessing 1140 funded hours. This is consistent with levels of uptake in August 2021."),
                 p("The number of two-year-olds reported to be receiving funded ELC in January 2022 was 6,913 children. ",
                   "Of these, 78% were reported to be accessing 1140 funded hours, an increase of 6 percentage points compared to August 2021."),
                 tags$a(href ="https://www.improvementservice.org.uk/products-and-services/consultancy-and-support/early-learning-and-childcare-expansion/elc-delivery-progress-reports",
                        "Source: Improvement Service ELC Delivery Progress Reports"),
                 size = "m",
                 easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))
               
             ))


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
