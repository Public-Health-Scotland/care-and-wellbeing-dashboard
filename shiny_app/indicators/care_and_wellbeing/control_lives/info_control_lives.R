##############################################.
# CHILDREN HAVE POSITIVE RELATIONSHIPS ----
##############################################.

output$info_children_relationships = renderUI({

  tagList(

    h4("Children have positive relationships"),

    br(),

    bsButton("info_to_children_relationships", "Go to children have positive relationships tab")

  )

})

##############################################.
# CAMHS WAITING TIMES CW ----
##############################################.
output$info_camhs_waiting_times_cw = renderUI({
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

    bsButton("info_to_camhs_cw", "Go to CAMHS waiting times tab")
  )
})

##############################################.
# CHILDREN'S VOICES ----
##############################################.

output$info_childrens_voices = renderUI({

  tagList(

    h4("Children’s voices"),

    br(),

    bsButton("info_to_childrens_voices", "Go to children’s voices tab")

  )

})

##############################################.
# CONFIDENCE AND RESILLIENCE OF CHILDREN AND YOUNG PEOPLE ----
##############################################.

output$info_confidence_of_young = renderUI({

  tagList(

    h4("Confidence and resilience of children and young people"),

    br(),

    bsButton("info_to_confidence_of_young", "Go to confidence and resilience of children and young people tab")

  )

})

##############################################.
# MENTAL HEALTH CW ----
##############################################.

output$info_mental_health_cw = renderUI({

  tagList(

    h4("Mental health and wellbeing"),

    p("Mean score on Stirling wellbeing scale for P5-S1 children / WEMWBS for S2-S6"),

    tags$a(href ="https://www.gov.scot/publications/health-and-wellbeing-census-2/",
           "Source: Health and Wellbeing Census, Scottish Government"),

    br(),

    bsButton("info_to_mentalhealth_cw", "Go to mental health and wellbeing tab")

  )

})
