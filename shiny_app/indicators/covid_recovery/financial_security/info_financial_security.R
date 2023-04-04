
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
