##############################################.
# INFORMATION TAB ----
##############################################.


##############################################.
# CHILD POVERTY ----
##############################################.

output$info_childpoverty = renderUI({
  
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
# POSITIVE DESTINATIONS OF SCHOOL LEAVERS ----
##############################################.

output$info_positivedestinations = renderUI({
  
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

##############################################.
# PRESCHOOL DEV INFO ----
##############################################.
output$info_preschool = renderUI({

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

##############################################.
# DECISION MAKING ----
##############################################.

output$info_decisionmaking = renderUI({
  
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
# CAMHS INFO ----
##############################################.
output$info_camhs = renderUI({
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

    bsButton("info_to_camhs", "Go to CAMHS waiting times tab")
  )
})

##############################################.
# PROTECTION FROM HARM ----
##############################################.

output$info_protectionharm = renderUI({
  
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

##############################################.
# INFANT MORTALITY ----
##############################################.

output$info_infantmortality = renderUI({
  
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

##############################################.
# PHYSICAL ACTIVITY ----
##############################################.

output$info_physicalactivity = renderUI({
  
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
# PHYSICAL ACTIVITY ----
##############################################.

output$info_mentalhealth = renderUI({
  
  tagList(
    
    h4("Mental health and wellbeing"), 
    
    p("Mean score on Stirling wellbeing scale for P5-S1 children / WEMWBS for S2-S6"),
    
    tags$a(href ="https://www.gov.scot/publications/health-and-wellbeing-census-2/",
           "Source: Health and Wellbeing Census, Scottish Government"),
    
    br(), 
    
    bsButton("info_to_mentalhealth", "Go to mental health and wellbeing tab")
    
  )
  
})

############## FINANCIAL SECURITY ##########################

##############################################.
# FUEL AFFORDABILITY ----
##############################################.

output$info_fuelaffordability = renderUI({
  
  tagList(
    
    h4("Fuel affordability"), 
    
    br(), 
    
    bsButton("info_to_fuelaffordability", "Go to fuel affordability tab")
    
  )
  
})

##############################################.
# HOUSEHOLD SPENDING ----
##############################################.

output$info_householdspending = renderUI({
  
  tagList(
    
    h4("Household spending"), 
    
    br(), 
    
    bsButton("info_to_householdspending", "Go to household spending tab")
    
  )
  
})


##############################################.
# CONTRACTUALLY SECURE WORK ----
##############################################.

output$info_contractuallysecurework = renderUI({
  
  tagList(
    
    h4("Contractually secure work"), 
    
    br(), 
    
    bsButton("info_to_contractuallysecurework", "Go to contractually secure work tab")
    
  )
  
})


##############################################.
# MANAGING FINANCIALLY ----
##############################################.

output$info_managingfinancially = renderUI({
  
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

output$info_unmanageabledebt = renderUI({
  
  tagList(
    
    h4("Unmanageable debt"), 
    
    br(), 
    
    bsButton("info_to_unmanageabledebt", "Go to unmanageable debt tab")
    
  )
  
})


##############################################.
# LOCAL AUTHORITY FUNDED ADVICE ----
##############################################.

output$info_lafundedadvice = renderUI({
  
  tagList(
    
    h4("Local authority funded advice"), 
    
    br(), 
    
    bsButton("info_to_lafundedadvice", "Go to local authority funded advice tab")
    
  )
  
})


##############################################.
# TRANSPORT COSTS ----
##############################################.

output$info_transportcosts = renderUI({
  
  tagList(
    
    h4("Transport costs"), 
    
    br(), 
    
    bsButton("info_to_transportcosts", "Go to transport costs tab")
    
  )
  
})


##############################################.
# CHILDCARE UPTAKE ----
##############################################.

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

output$info_benefitsuptake = renderUI({
  
  tagList(
    
    h4("Benefit uptake and engagement with welfare advice"), 
    
    br(), 
    
    bsButton("info_to_benefituptake", "Go to benefit uptake tab")
    
  )
  
})



##############################################.
# EMPLOYEES ON LIVING WAGE ----
##############################################.

output$info_employeeslivingwage = renderUI({
  
  tagList(
    
    h4("Employees on living wage"), 
    
    br(), 
    
    bsButton("info_to_employeeslivingwage", "Go to employees on living wage tab")
    
  )
  
})


##############################################.
# GENDER PAY GAP ----
##############################################.

output$info_genderpaygap = renderUI({
  
  tagList(
    
    h4("Gender pay gap"), 
    
    br(), 
    
    bsButton("info_to_genderpaygap", "Go to gender pay gap tab")
    
  )
  
})


##############################################.
# DISABILITY EMPLOYMENT GAP ----
##############################################.

output$info_disabilityemploymentgap = renderUI({
  
  tagList(
    
    h4("Disability employment gap"), 
    
    br(), 
    
    bsButton("info_to_disabilityemploymentgap", "Go to disability employment gap tab")
    
  )
  
})

##############################################.
# ETHNICITY EMPLOYMENT GAP ----
##############################################.

output$info_ethnicityemploymentgap = renderUI({
  
  tagList(
    
    h4("Ethnicity employment gap"), 
    
    br(), 
    
    bsButton("info_to_ethnicityemploymentgap", "Go to ethnicity employment gap tab")
    
  )
  
})

##############################################.
# ZERO-HOURS CONTRACT ----
##############################################.

output$info_zerohourscontract = renderUI({
  
  tagList(
    
    h4("Zero-hours contract"), 
    
    br(), 
    
    bsButton("info_to_zerohourscontract", "Go to zero-hours contract tab")
    
  )
  
})

##############################################.
# SKILLS SHORTAGE VACANCIES ----
##############################################.

output$info_skillsshortagevacancies = renderUI({
  
  tagList(
    
    h4("Skills shortage vacancies"), 
    
    br(), 
    
    bsButton("info_to_skillsshortagevacancies", "Go to skills shortage vacancies tab")
    
  )
  
})

##############################################.
# UNDEREMPLOYMENT ----
##############################################.

output$info_underemployment = renderUI({
  
  tagList(
    
    h4("Underemployment"), 
    
    br(), 
    
    bsButton("info_to_underemployment", "Go to underemployment tab")
    
  )
  
})

##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

output$info_economicinactivity = renderUI({
  
  tagList(
    
    h4("Economic inactivity"), 
    
    br(), 
    
    bsButton("info_to_economicinactivity", "Go to economic inactivity tab")
    
  )
  
})

##############################################.
# EMPLOYABILITY ----
##############################################.

output$info_employability = renderUI({
  
  tagList(
    
    h4("Employability"), 
    
    br(), 
    
    bsButton("info_to_employability", "Go to employability tab")
    
  )
  
})

##############################################.
# GREEN JOBS ----
##############################################.

output$info_greenjobs = renderUI({
  
  tagList(
    
    h4("Green jobs"), 
    
    br(), 
    
    bsButton("info_to_greenjobs", "Go to green jobs tab")
    
  )
  
})





##############################################.
# CONDITIONAL RENDER UI FOR INFO NOTES ----
##############################################

output$info_panel = renderUI({
  
  if(input$indicator_type_info == "Wellbeing of children and young people" ) {
    
    wellPanel(
      column(2,
             p("Select topic:"),
             
             actionLink("info_childpoverty_info", "Child poverty",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_positivedestinations_info", "Positive destinations of school leavers",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_preschool_info", "Pre-school development",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_listento_info", "Being listened to and involved in decision making",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_camhs_info", "CAMHS waiting times",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_protectionharm_info", "Protection from harm",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_infantmortality_info", "Infant mortality",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_physicalactivity_info", "Physical activity",
                        width = "150px", class = "bold-style"), br(),
             
             actionLink("info_mentalhealth_info", "Mental health and wellbeing",
                        width = "150px", class = "bold-style"), br()
      ),
      
      column(10,
             h3("Wellbeing of children and young people"),
             bsCollapse(id = "info_collapse_wellbeing", open = "Panel 1",
                        bsCollapsePanel(
                          "Child poverty", 
                          uiOutput("info_childpoverty")
                        ),
                        bsCollapsePanel(
                          "Positive destinations of school leavers", 
                          uiOutput("info_positivedestinations")
                        ),
                        bsCollapsePanel(
                          "Pre-school development",
                          uiOutput("info_preschool")
                        ),
                        bsCollapsePanel(
                          "Being listened to and involved in decision making", 
                          uiOutput("info_decisionmaking")
                        ),
                        bsCollapsePanel(
                          "CAMHS waiting times",
                          uiOutput("info_camhs")
                        ),
                        bsCollapsePanel(
                          "Protection from harm", 
                          uiOutput("info_protectionharm")
                        ),
                        bsCollapsePanel(
                          "Infant mortality", 
                          uiOutput("info_infantmortality")
                        ), 
                        bsCollapsePanel(
                          "Physical activity", 
                          uiOutput("info_physicalactivity")
                          
                        ),
                        bsCollapsePanel(
                          "Mental health and wellbeing", 
                          uiOutput("info_mentalhealth")
                        )
             )
      )
    )
    
  } else if(input$indicator_type_info == "Financial security for low income households") {
    
    wellPanel(
      
      column(2, 
             p("Select topic:"), 
             
             actionLink("info_fuelaffordability_info", "Fuel affordability",
                        width = "150px", class = "bold-style"), br(), 
             
             # actionLink("info_foodaffordability_info", "Food affordability",
             #            width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_householdspending_info", "Household spending",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_managingfinancially_info", "Managing financially",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_savings_info", "Savings",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_unmanageabledebt_info", "Unmanageable debt",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_lafundedadvice_info", "Local authority funded advice",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_transportcosts_info", "Transport costs",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_childcareuptake_info", "Early learning and childcare uptake",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_benefituptake_info", "Benefit uptake and engagement with welfare advice",
                        width = "150px", class = "bold-style"), br()
             
             
      ),
      
      column(10,
             h3("Financial security for low income households"), 
             bsCollapse(id = "info_collapse_finance", open = "Panel 1",
                        bsCollapsePanel(
                          "Fuel affordability", 
                          uiOutput("info_fuelaffordability")
                          
                        ), 
                        bsCollapsePanel(
                          "Household spending", 
                          uiOutput("info_householdspending")
                          
                        ), 
                        bsCollapsePanel(
                          "Managing financially", 
                          uiOutput("info_managingfinancially")
                          
                        ), 
                        bsCollapsePanel(
                          "Savings", 
                          uiOutput("info_savings")
                          
                        ), 
                        bsCollapsePanel(
                          "Unmanageable debt", 
                          uiOutput("info_unmanageabledebt")
                          
                        ), 
                        bsCollapsePanel(
                          "Local authority funded advice", 
                          uiOutput("info_lafundedadvice")
                          
                        ), 
                        bsCollapsePanel(
                          "Transport costs", 
                          uiOutput("info_transportcosts")
                        ),
                        
                        bsCollapsePanel(
                          "Early learning and childcare uptake", 
                          uiOutput("info_childcareuptake")
                        ),
                        
                        bsCollapsePanel(
                          "Benefit uptake and engagement with welfare advice", 
                          uiOutput("info_benefitsuptake")
                        )
                        
             )
      )
      
    )
    
  } else if(input$indicator_type_info == "Good, green jobs and fair work") {
    
    wellPanel(
      
      column(2, 
             p("Select topic:"), 
             
             actionLink("info_employeeslivingwage_info", "Employees on living wage",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_genderpaygap_info", "Gender pay gap",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_disabilityemploymentgap_info", "Disability employment gap",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_ethnicityemploymentgap_info", "Ethnicity employment gap",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_zerohourscontract_info", "Zero hours contract",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_skillsshortagevacancies_info", "Skills shortage vacancies",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_underemployment_info", "Underemployment",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_economicinactivity_info", "Economic inactivity",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_employability_info", "Employability",
                        width = "150px", class = "bold-style"), br(), 
             
             actionLink("info_contractuallysecurework_info", "Contractually secure work",
                        width = "150px", class = "bold-style"), br(), 
          
             actionLink("info_greenjobs_info", "Green jobs",
                        width = "150px", class = "bold-style"), br()
      ),
      
      column(10,
             h3("Good, green jobs and fair work"), 
             bsCollapse(id = "info_collapse_jobs", open = "Panel 1",
                        bsCollapsePanel(
                          "Employees on living wage", 
                          uiOutput("info_employeeslivingwage")
                          
                        ), 
                        bsCollapsePanel(
                          "Gender pay gap", 
                          uiOutput("info_genderpaygap")
                          
                        ),
                        bsCollapsePanel(
                          "Disability employment gap", 
                          uiOutput("info_disabilityemploymentgap")
                          
                        ),
                        bsCollapsePanel(
                          "Ethnicity employment gap", 
                          uiOutput("info_ethnicityemploymentgap")
                          
                        ),
                        bsCollapsePanel(
                          "Zero-hours contracts", 
                          uiOutput("info_zerohourscontract")
                          
                        ),
                        bsCollapsePanel(
                          "Skills shortage vacancies", 
                          uiOutput("info_skillsshortagevacancies")
                        ),
                        bsCollapsePanel(
                          "Underemployment", 
                          uiOutput("info_underemployment")
                          
                        ),
                        bsCollapsePanel(
                          "Economic inactivity", 
                          uiOutput("info_economicinactivity")
                          
                        ),
                        bsCollapsePanel(
                          "Employability", 
                          uiOutput("info_employability")
                          
                        ),
                        bsCollapsePanel(
                          "Contractually secure work", 
                          uiOutput("info_contractuallysecurework")
                          
                        ), 
                        
                        bsCollapsePanel(
                          "Green jobs", 
                          uiOutput("info_greenjobs")
                          
                        )
             )
      )
      
    )
    
  }
  
  
})
