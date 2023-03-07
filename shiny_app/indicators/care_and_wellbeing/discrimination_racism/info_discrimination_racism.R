##############################################.
# PUBLIC SERVICES TREAT PEOPLE WITH DIGNITY AND RESPECT ----
##############################################.

output$info_dignity_respect = renderUI({

  tagList(

    h4("Public services treat people with dignity and respect"),

    br(),

    bsButton("info_to_dignity_respect", "Go to public services treat people with dignity and respect tab")

  )

})

##############################################.
# GENDER BALANCE IN ORGANISATION ----
##############################################.

output$info_gender_balance = renderUI({

  tagList(

    h4("Gender balance in organisations"),

    br(),

    bsButton("info_to_gender_balance", "Go to gender balance in organisations tab")

  )

})
