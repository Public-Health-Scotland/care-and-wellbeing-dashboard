
##############################################.
# ADULT SELF ASSESSED HEALTH ----
##############################################.

output$info_adult_self_assessed_health = renderUI({

  tagList(

    h4("Self-assessed health of adults (age 16+)"),

    p("This indicator uses data from the Scottish Health Survey. Participants who",
      "are aged 13 and over are asked to rate their health in general with answer",
      "options ranging from 'very good' to 'very bad'. The data for those participants",
      "who described their general health as good or very good are presented at",
      "a national level."),

    p("More information can be found here:",
      tags$a(href= "https://www.gov.scot/collections/scottish-health-survey/",
             "https://www.gov.scot/collections/scottish-health-survey/")),

    bsButton("info_to_adult_self_assessed_health", "Go to adult self-assessed health tab")

  )

})


##############################################.
# ADULTS LIVING WITH LONG TERM CONDITIONS ----
##############################################.

output$info_adult_long_term_condition = renderUI({

  tagList(

    h4("Adults living with a long term condition"),

    p("This indicator uses data from the Scottish Health Survey. Participants",
      "who are aged 13 and over are asked to rate their health in general with",
      "answer options ranging from 'very good' to 'very bad'. The data for those",
      "participants who described their general health as good or very good are",
      "presented at a national level."),

    p("More information can be found here:",
      tags$a(href= "https://www.gov.scot/collections/scottish-health-survey/",
             "https://www.gov.scot/collections/scottish-health-survey/")),

    bsButton("info_to_adult_long_term_condition", "Go to adults living with long term condition tab")

  )

})

##############################################.
# SCREENING UPTAKE ----
##############################################.

output$info_screening = renderUI({

  tagList(

    h4("Screening- uptake for breast and bowel cancer"),

    br(),

    bsButton("info_to_screening", "Go to screening tab")

  )

})

##############################################.
# VACCINATIONS ----
##############################################.

output$info_vaccinations = renderUI({

  tagList(

    h4("Vaccinations"),

    br(),

    bsButton("info_to_vaccinations", "Go to vaccinations tab")

  )

})


##############################################.
# HEALTHY BIRTHWEIGHT ----
##############################################.

output$info_healthy_birthweight = renderUI({

  tagList(

    h4("Healthy birthweight"),

    p("This indicator uses data from the Public Health Scotland Births in Scotland",
      "publication related to pregnancy, childbirth and early care of babies in Scotland.",
      "The health of a pregnant woman and her baby are closely linked and are",
      "influenced by a number of different factors during pregnancy, childbirth",
      "and the early period after birth. These data are presented at a national",
      "level and broken down by local geographies."),

    p("More information can be found here:",
      tags$a(href = "https://publichealthscotland.scot/publications/births-in-scotland/births-in-scotland-year-ending-31-march-2022/",
             "https://publichealthscotland.scot/publications/births-in-scotland/births-in-scotland-year-ending-31-march-2022/")),

    bsButton("info_to_healthy_birthweight", "Go to healthy birthweight tab")

  )

})


##############################################.
# HOSPITAL ADMISSIONS FOR HEART ATTACK ----
##############################################.

output$info_hospital_admission_heart_attack = renderUI({

  tagList(

    h4("First ever hospital admissions for a heart attack"),

    br(),

    bsButton("info_to_hospital_admission_heart_attack", "Go to hospital admissions for heart attack tab")

  )

})

##############################################.
# DRUGS: DEATHS AND HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

output$info_drugs = renderUI({

  tagList(

    h4("Drugs: deaths and hospital admissions (under 75)"),

    p("This indicator uses data from Public Health Scotland drug related hospital statistics publication",
      "relating to general acute and psychiatric hospital stays with a diagnosis of drug misuse.",
      "These data are presented at a national level and broken down by demographic characteristics/local geographies."),

    p("More information can be found here: ",
      tags$a(href = "https://www.publichealthscotland.scot/publications/show-all-releases?id=32315",
             "https://www.publichealthscotland.scot/publications/show-all-releases?id=32315")),

    p("Statistics of drug-related deaths in 2021 and earlier years, broken down by age, sex,",
      "substances implicated in the death, underlying cause of death, and NHS Board and Council areas can be found here: ",
      tags$a(href = "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/drug-related-deaths-in-scotland",
             "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/drug-related-deaths-in-scotland")),

    br(),

    bsButton("info_to_drugs", "Go to drugs: deaths and hospital admissions (under 75) tab")

  )

})

##############################################.
# ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

output$info_alcohol = renderUI({

  tagList(

    h4("Alcohol: deaths and first hospital admissions (under 75)"),

    p("This indicator uses data from Public Health Scotland Alcohol related hospital statistics.",
      "Consumption of alcohol can result in a wide range of health problems.",
      "Some may occur after drinking over a relatively short period, such as acute intoxication",
      "(drunkenness) or poisoning (toxic effect). Others develop more gradually, such as damage to the liver and brain.",
      "Estimates of the number of inpatient and day case hospitalisations are based on counts where",
      "alcohol-related conditions are diagnosed during the hospital stay."),

    p("More information can be found here: ",
      tags$a(href = "https://publichealthscotland.scot/publications/show-all-releases?id=20558",
             "https://publichealthscotland.scot/publications/show-all-releases?id=20558")),

    p("Statistics of deaths which are counted as being due to alcohol can be found here: ",
      tags$a(href = "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/alcohol-deaths",
             "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/alcohol-deaths")),

    br(),

    bsButton("info_to_alcohol", "Go to alcohol tab")

  )

})


##############################################.
# CHD DEATHS ----
##############################################.

output$info_chd_deaths = renderUI({

  tagList(

    h4("Coronary heart disease (CHD) deaths"),

    p("This indicator uses SMR data and covers early deaths from coronary heart disease (CHD).",
      "Heart disease is a broad term for a variety of conditions that affect the structure and function of the heart.",
      "The most common type of heart disease is coronary heart disease (CHD) where the blood vessels carrying",
      "oxygen-rich blood (coronary arteries) to the heart muscle become narrowed or blocked.",
      "If insufficient blood reaches the heart muscle the result can be damage to the heart muscle which is known as a heart attack."),

    p("Public Health Scotland publishes a range of heart disease-related information. You can find all our information on the ",
      tags$a(href = "http://www.isdscotland.org/Health-Topics/Heart-Disease/", "heart disease section of the Data and Intelligence website"),
      "."),

    br(),

    bsButton("info_to_chd_deaths", "Go to chd deaths tab")

  )

})

##############################################.
# ALL-CAUSE MORTALITY ----
##############################################.

output$info_all_cause_mortality = renderUI({

  tagList(

    h4("All-cause mortality"),

    p("This indicator uses the National Records of Scotland’s (NRS's) statistics of deaths",
      tags$a(href = "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-time-series-data",
             "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-time-series-data")),

    p("Information about the basis of these statistics is available from the ",
      tags$a(href = "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/general-background-information",
             "Vital Events – General Background Information "), "and the ",
      tags$a(href = "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-background-information",
             "Deaths – Background Information "),
      "pages."),

    br(),

    bsButton("info_to_all_cause_mortality", "Go to all-cause mortality tab")

  )

})


##############################################.
#EXPERIENCE OF UNPAID CARERS ----
##############################################.

output$info_experience_of_unpaid_carers = renderUI({

  tagList(

    h4("Experience of unpaid carers"),

    p("The Health and Care Experience Survey",
      "(successor to the GP and Local NHS Services Patient Experience Survey) asks about people’s experiences of: "),

    tags$li("accessing and using their GP practice and Out of Hours services"),
    tags$li("aspects of care and support provided by local authorities and other organisations"),
    tags$li("caring responsibilities and related support"),

    p("The survey has been run every two years since 2009 and can be found here: ",
      tags$a(href = "https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014",
             "https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014")),

    br(),

    bsButton("info_to_experience_of_unpaid_carers", "Go to experience of unpaid carers tab")

  )

})

##############################################.
# EXPERIENCE OF SOCIAL CARE RECEPIENTS ----
##############################################.

output$info_experience_recipients = renderUI({

  tagList(

    h4("Experience of social care recepients"),

    p("The Health and Care Experience Survey",
      "(successor to the GP and Local NHS Services Patient Experience Survey) asks about people’s experiences of: ",

      tags$li("accessing and using their GP practice and Out of Hours services"),
      tags$li("aspects of care and support provided by local authorities and other organisations"),
      tags$li("caring responsibilities and related support")),

    p("The survey has been run every two years since 2009 and can be found here: ",
      tags$a(href = "https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014",
             "https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014")),

    br(),

    bsButton("info_to_experience_recipients", "Go to experience of social care recipients tab")

  )

})

##############################################.
# ADMISSIONS FOR ASTHMA ----
##############################################.

output$info_asthma_admissions = renderUI({

  tagList(

    h4("Admissions for asthma"),

    br(),

    bsButton("info_to_asthma_admissions", "Go to admissions for asthma tab")

  )

})


###############################################.
# HEALTH RISK BEHAVIOURS ----
##############################################.

output$info_health_risk_behaviours = renderUI({

  tagList(

    h4("Health risk behaviours"),

    br(),

    bsButton("info_to_health_risk_behaviours", "Go to health risk behaviours tab")

  )

})

###############################################.
# HEALTHY LIFE EXPECTANCY ----
##############################################.

output$info_healthy_life_expectancy = renderUI({

  tagList(

    h4("Healthy life expectancy"),

    br(),

    bsButton("info_to_healthy_life_expectancy", "Go to healthy life expectancy tab")

  )

})

###############################################.
# HEALTHY WEIGHT ADULTS ----
##############################################.

output$info_healthy_weight = renderUI({

  tagList(

    h4("Healthy weight adults"),

    br(),

    bsButton("info_to_healthy_weight", "Go to healthy weight adults tab")

  )

})

###############################################.
# MENTAL WELLBEING OF ADULTS (16+) ----
##############################################.

output$info_mental_wellbeing = renderUI({

  tagList(

    h4("Mental wellbeing of adults (16+)"),

    br(),

    bsButton("info_to_mental_wellbeing", "Go to mental wellbeing of adults (16+) tab")

  )

})

###############################################.
# PHYSICAL ACTIVITY ----
##############################################.

output$info_physical_activity = renderUI({

  tagList(

    h4("Physical activity"),

    br(),

    bsButton("info_to_physcial_activity", "Go to physical activity tab")

  )

})

###############################################.
# PREMATURE MORTALITY ----
##############################################.

output$info_premature_mortality = renderUI({

  tagList(

    h4("Premature mortality"),

    br(),

    bsButton("info_to_premature_mortality", "Go to premature mortality tab")

  )

})

###############################################.
# QUALITY OF CARE EXPERIENCE ----
##############################################.

output$info_quality_care = renderUI({

  tagList(

    h4("Quality of care experience"),

    br(),

    bsButton("info_to_quality_care", "Go to quality care tab")

  )

})

###############################################.
# WORK-RELATED ILL HEALTH ----
##############################################.

output$info_work_related_health = renderUI({

  tagList(

    h4("Work-related illhealth"),

    br(),

    bsButton("info_to_work_related_health", "Go to work-related ill health tab")

  )

})

##############################################.
