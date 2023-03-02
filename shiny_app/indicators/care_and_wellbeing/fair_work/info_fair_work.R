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
