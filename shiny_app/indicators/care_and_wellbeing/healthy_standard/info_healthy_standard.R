##############################################.
# FOOD INSECURITY MONEY OR OTHER RESOURCES ----
##############################################.

output$info_food_insecurity = renderUI({

  tagList(

    h4("Food insecurity money or other resources"),

    br(),

    bsButton("info_to_food_insecurity", "Go to food insecurity money or other resource tab")

  )

})


##############################################.
# PERSISTENT POVERTY ----
##############################################.

output$info_persistent_poverty = renderUI({

  tagList(

    h4("Persistent poverty"),

    br(),

    bsButton("info_to_persistent_poverty", "Go to persistent poverty tab")

  )

})


##############################################.
# SATISFACTION WITH HOUSING ----
##############################################.

output$info_satisfaction_with_housing = renderUI({

  tagList(

    h4("Satisfaction with housing"),

    br(),

    bsButton("info_to_satisfaction_with_housing", "Go to satisfaction with housing tab")

  )

})
