
##############################################.
# FUEL AFFORDABILITY ----
##############################################.

output$info_fuel_affordability = renderUI({

  tagList(

    h4("Fuel affordability"),

    br(),

    bsButton("info_to_fuelaffordability", "Go to fuel affordability tab")

  )

})

##############################################.
# FOOD AFFORDABILITY ----
##############################################.

output$info_food_affordability = renderUI({

  tagList(

    h4("Food affordability"),

    br(),

    bsButton("info_to_food_affordability", "Go to fuel affordability tab")

  )

})

##############################################.
# COST OF LIVING ----
##############################################.

output$info_cost_of_living = renderUI({

  tagList(

    h4("Cost of living"),

    br(),

    bsButton("info_to_cost_of_living", "Go to cost of living tab")

  )

})



##############################################.
# MANAGING FINANCIALLY ----
##############################################.

output$info_managing_financially = renderUI({

  tagList(

    h4("Managing financially"),

    br(),

    bsButton("info_to_managingfinancially", "Go to managing financially tab")

  )

})


##############################################.
# SAVINGS ----
##############################################.

output$info_savings = renderUI({

  tagList(

    h4("Savings"),

    br(),

    bsButton("info_to_savings", "Go to savings tab")

  )

})


##############################################.
# UNMANAGEABLE DEBT ----
##############################################.

output$info_unmanageable_debt = renderUI({

  tagList(

    h4("Unmanageable debt"),

    br(),

    bsButton("info_to_unmanageabledebt", "Go to unmanageable debt tab")

  )

})


##############################################.
# TRANSPORT COSTS ----
##############################################.

output$info_transport_costs = renderUI({

  tagList(

    h4("Transport costs"),

    br(),

    bsButton("info_to_transportcosts", "Go to transport costs tab")

  )

})


##############################################.
# CHILDCARE UPTAKE ----
##############################################.
# ?? two of these
output$info_childcareuptake = renderUI({

  tagList(

    h4("Early learning and childcare uptake"),

    br(),

    bsButton("info_to_childcareuptake", "Go to early learning and childcare uptake tab")

  )

})

##############################################.
# BENEFITS UPTAKE ----
##############################################.
# merged with above one
output$info_benefits_uptake = renderUI({

  tagList(

    h4("Benefit uptake and engagement with welfare advice"),

    br(),

    bsButton("info_to_benefits_uptake", "Go to benefit uptake tab")

  )

})
