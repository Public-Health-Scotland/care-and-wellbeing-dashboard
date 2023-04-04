
##############################################.
# CHILD POVERTY ----
##############################################.

output$info_child_poverty = renderUI({

  tagList(

    h4("Child poverty"),

    p("Relative child poverty rate after housing costs."),

    p("Relative and absolute child poverty fell between 1994/95, when data collection began, and 2011/12.",
      "Since then, relative child poverty has been gradually increasing while absolute child poverty remained largely stable.",
      "Child material deprivation has been measured since 2004 and persistent poverty since 2010, neither with an obvious long-term trend.",
      "In the most recent period, persistent child poverty appears to have dropped slightly."),

    tags$a(href ="https://data.gov.scot/poverty/2022/cpupdate.html",
           "Source: Family Resources Survey, Scottish Government"),

    br(),

    bsButton("info_to_childpoverty", "Go to child poverty tab")

  )

})

##############################################.
# POSITIVE DESTINATIONS ----
##############################################.

output$info_positive_destinations = renderUI({

  tagList(

    h4("Positive destinations of school leavers"),

    p("Percentage of all school leavers in positive destinations at 9 month follow up."),

    p("This is the highest percentage of all school leavers in positive destinations at 9 month follow up since consistent records began in 2009/10.",
      "The pandemic will have been at least partly responsible for the relatively low proportion of 2019/20 school leavers ",
      "in a positive destination compared to surrounding years and the size of the latest increase in 2020/21 should be interpreted with this in mind."),

    tags$a(href ="https://www.gov.scot/publications/summary-statistics-attainment-initial-leaver-destinations-no-4-2022-edition/",
           "Source: Summary Statistics for Follow-up Leaver Destinations, Scottish Government"),

    br(),

    bsButton("info_to_positivedestinations", "Go to positive destinations tab")

  )

})

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

##############################################.
# CHILD DEVELOPMENT CR ----
##############################################.
output$info_child_development_cr = renderUI({

  tagList(

    h4("Pre-school development"),

    p("Early child development is influenced by both biological factors (such as being born premature)",
      " and environmental factors (such as the parenting and opportunities for play and exploration children receive). ",
      "Problems with early child development are important as they are strongly associated with long-term health, educational, and wider social difficulties."),

    p("Detecting developmental problems early provides the best opportunity to support children and families to improve outcomes.",
      " There is good evidence that parenting support and enriched early learning opportunities can improve outcomes for children with,",
      " or at risk of, developmental delay. There is also increasing evidence that intensive early",
      " interventions for children with serious developmental problems can also improve outcomes."),
    p("All children in Scotland are offered the child health programme which includes a series of child health reviews,",
      " including an assessment of children’s development at 13-15 months, 27-30 months and 4-5 years. ",
      " These reviews involve asking parents about their child’s progress, carefully observing the child,",
      " and supporting parents to complete a structured questionnaire about the child’s development. ",
      "At the end of the review Health Visitors record whether they have any concerns about each area of the child’s development."),

    tags$a(href ="https://publichealthscotland.scot/publications/show-all-releases?id=20569",
           "Source: Early Child Development, Public Health Scotland"),
    br(),

    bsButton("info_to_preschool", "Go to pre-school development tab")
  )

})

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

##############################################.
# LISTEN TO DECISION MAKING ----
##############################################.

output$info_listen_to_decision_making = renderUI({

  tagList(

    h4("Being listened to and involved in decision making"),

    p("Percentage of young people who feel adults take their views into account in decisions that affect their lives."),

    p("This question is intended to gauge whether young people feel that adults take action after listening to their views. ",
      "Since the last survey conducted in 2017, respondents have become more positive in response to this question."),

    tags$a(href ="https://www.gov.scot/publications/young-peoples-participation-decision-making-scotland-attitudes-perceptions-2/#:~:text=The%20Young%20People%20in%20Scotland%20Survey%20is%20an,the%20Scottish%20Government%2C%20Children%20and%20Families%20Analytical%20Unit.",
           "Source: Young People in Scotland Survey, Scottish Government"),

    br(),

    bsButton("info_to_decisionmaking", "Go to involved in decision making tab")


  )

})

##############################################.
# CAMHS WAITING TIMES CR ----
##############################################.
output$info_camhs_waiting_times_cr = renderUI({
  tagList(

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
    br(),

    bsButton("info_to_camhs_cr", "Go to CAMHS waiting times tab")
  )
})

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

##############################################.
# PROTECTION FROM HARM ----
##############################################.

output$info_protection_from_harm = renderUI({

  tagList(

    h4("Protection from harm"),

    p("Number of children subject to Interagency Referral Discussions"),

    p("Between May 2020 and May 2022 the number of children subject to Interagency Referral Discussions increased by 48%.",
      "Although please note that these figures fluctuate from fortnight to fortnight."),

    tags$a(href ="https://public.tableau.com/app/profile/sg.eas.learninganalysis/viz/VulnerableChildrenandAdultProtection/Introduction",
           "Source: Vulnerable Children and Adult Protection COVID19 Monitoring Survey, Scottish Government"),


    br(),

    bsButton("info_to_protectionharm", "Go to protection from harm tab")

  )

})

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


##############################################.
# INFANT MORTALITY CR ----
##############################################.

output$info_infant_mortality_cr = renderUI({

  tagList(

    h4("Infant mortality"),

    p("Rate of infant deaths per 1,000 live births in Scotland"),

    p("In March 2022, the overall infant mortality rate (5.9 per 1,000 live births) exceeded the warning limit (5.1 per 1,000),",
      "but not the upper control limit 6.0 per 1,000). In April 2022, this decreased to below the warning limit. "),

    tags$a(href ="https://scotland.shinyapps.io/phs-covid-wider-impact/",
           "Source: National Records of Scotland / PHS"),

    br(),

    bsButton("info_to_infantmortality", "Go to infant mortality tab")

  )

})

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

##############################################.
# PHYSICAL ACTIVITY CHILDREN CR----
##############################################.

output$info_physical_activity_children_cr = renderUI({

  tagList(

    h4("Physical activity"),

    p("Percentage of P5-S6 children that had at least one hour of exercise the day before the survey"),

    tags$a(href ="https://www.gov.scot/publications/health-and-wellbeing-census-2/",
           "Source: Health and Wellbeing Census, Scottish Government"),

    br(),

    bsButton("info_to_physicalactivity", "Go to physical activity tab")

  )

})

##############################################.
# MENTAL HEALTH CR ----
##############################################.

output$info_mental_health_cr = renderUI({

  tagList(

    h4("Mental health and wellbeing"),

    p("Mean score on Stirling wellbeing scale for P5-S1 children / WEMWBS for S2-S6"),

    tags$a(href ="https://www.gov.scot/publications/health-and-wellbeing-census-2/",
           "Source: Health and Wellbeing Census, Scottish Government"),

    br(),

    bsButton("info_to_mentalhealth_cr", "Go to mental health and wellbeing tab")

  )

})
