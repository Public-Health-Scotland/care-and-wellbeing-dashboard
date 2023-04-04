
##############################################.
# INFANT MORTALITY CW ----
##############################################.

output$info_infant_mortality_cw = renderUI({

  tagList(

    h4("Infant mortality"),

    br(),

    bsButton("info_to_infant_mortality_cw", "Go to infant mortality tab")

  )

})

observeEvent(input$infant_mortality_cw_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Indicator"),
                 p("Rate of infant deaths per 1,000 live births in Scotland."),
                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))


observeEvent(input$infant_mortality_cw_modal_comment,
             showModal(
               modalDialog(
                 title = "Summary of indicator during covid and pre-covid period",
                 p(tags$b("Prepandemic period (July 2017-jan 2020):"),"Infant mortality fluctuated during this period but generally remained steady (i.e., there wasn’t a clear increasing or decreasing trend).",
                   br(),
                   tags$b("During/post pandemic period (March 2020-March 2021):"),"Again, infant mortality fluctuated during this period, however, an upward trend was evident from January 2021 onwards."),

                 easyClose = TRUE, fade=FALSE, footer = modalButton("Close (Esc)"))
             ))

##############################################.
# CHILDREN AT RISK OF OBESITY ----
##############################################.

output$info_children_at_risk_of_obesity = renderUI({

  tagList(

    h4("Children at risk of obesity"),

    br(),

    bsButton("info_to_children_at_risk_of_obesity", "Go to children at risk of obesity tab")

  )

})

##############################################.
# CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
##############################################.

output$info_child_development_cw = renderUI({

  tagList(

    h4("Child social and physical development"),

    br(),

    bsButton("info_to_child_development_cw", "Go to child scoial and physical development tab")

  )

})

observeEvent(input$child_development_cw_modal_info,
             showModal(
               modalDialog(
                 title = "Background information and source",
                 h4("Child social and physical development"),

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

##############################################.
# CHILD MATERIAL DEPRIVATION----
##############################################.

output$info_child_material_deprivation = renderUI({

  tagList(

    h4("Child material deprivation"),

    br(),

    bsButton("info_to_children_material deprivation", "Go to child material deprivation tab")

  )

})

##############################################.
# CHILD WELLBEING AND HAPPINESS ----
##############################################.

output$info_child_wellbeing = renderUI({

  tagList(

    h4("Child wellbeing and happiness"),

    br(),

    bsButton("info_to_child_wellbeing", "Go to child wellbeing and happiness tab")

  )

})

##############################################.
# PERINATAL MORTALITY RATE ----
##############################################.

output$info_perinatal_mortality = renderUI({

  tagList(

    h4("Perinatal mortality rate"),

    br(),

    bsButton("info_to_perinatal_mortality", "Go to perinatal mortality rate tab")

  )

})

##############################################.
# PHYSICAL ACTIVITY ----
##############################################.

output$info_physical_activity_children_cw = renderUI({

  tagList(

    h4("Physical activity"),

    br(),

    bsButton("info_to_physical_activity_children_cw", "Go to physcial activity tab")

  )

})
