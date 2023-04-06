##############################################.
# ECONOMIC INACTIVITY CW ----
##############################################.

output$info_economic_inactivity_cw = renderUI({

  tagList(

    h4("Economic inactivity"),

    br(),

    bsButton("info_to_economic_inactivity_cw", "Go to economic inactivity tab")

  )

})

observeEvent(input$economic_inactivity_cw_modal_info,
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
# EMPLOYEES ON LIVING WAGE CW ----
##############################################.

output$info_employees_living_wage_cw = renderUI({

  tagList(

    h4("Employees on living wage"),

    br(),

    bsButton("info_to_employees_living_wage_cw", "Go to employees on living wage tab")

  )

})

observeEvent(input$employees_living_wage_cw_modal_info,
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

observeEvent(input$employees_living_wage_cw_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The proportion of employees earning less than the Living Wage has decreased from 18.8% in 2012 to 14.4% in 2021; and decreased 0.7 percentage points from 2020 to 2021. The proportion of employees earning less than the Living Wage is now lower than at any previous point in the series, which began in 2012. This indicates that performance is maintaining."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# GENDER PAY GAP CW ----
##############################################.

output$info_gender_pay_gap_cw = renderUI({

  tagList(

    h4("Gender pay gap"),

    br(),

    bsButton("info_to_gender_pay_gap_cw", "Go to gender pay gap tab")

  )

})

observeEvent(input$gender_pay_gap_cw_modal_info,
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



observeEvent(input$gender_pay_gap_cw_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 #p("The gender pay gap has decreased from 8.4% in 2012. In 2021, the gender pay gap for Scotland was 3.0%, an increase of 0.6 percentage points on the previous year. This indicates that performance is maintaining."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# WORK-RELATED ILL HEALTH ----
##############################################.

output$info_work_related_ill_health = renderUI({

  tagList(

    h4("Work related ill health"),

    br(),

    bsButton("info_to_work_related_ill_health", "Go to Work related ill health tab")

  )

})
