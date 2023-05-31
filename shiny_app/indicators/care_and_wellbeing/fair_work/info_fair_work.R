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
