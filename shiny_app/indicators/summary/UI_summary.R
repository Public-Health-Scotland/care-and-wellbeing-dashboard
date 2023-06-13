
tagList(
  fluidRow(width=12,
           h1("At a glance"),

           p("This tab summarises the most recent data for all the indicators across the Care and Wellbeing Dashboard."),

           p("Select which national or local geography level and area you wish to see data for."),

           p(tags$li("Each box will provide the date and value of the latest and previous data for the corresponding indicator",
                     "and provide either the percentage change or difference between these data if available."),
             tags$li("If a box states 'Not available' then the data is not available for the chosen national or local level and area."),
             tags$li("If a box states 'To be developed', then the data for the corresponding indicator is not yet available on the dashboard.")),

           p("Clicking on the 'i' button will provide additional information about the indicator."),

           p("Clicking the title above each box will take you to the relevant trend tab within the dashboard"),


           br(),

           tagList(
             fluidRow(column(6,

                             selectInput("geog_type_summary_CW",
                                         "Step 1: Select national or local geography level ",
                                         choices = c("Scotland", "Health board", "Council area"),
                                         selectize = FALSE,
                                         width = "100%")),
                      column(6,

                             selectInput("geog_name_summary_CW",
                                         "Step 2: Select national or local geography area ",
                                         choices = unique(geog_lookup %>% filter(geography_type == "Scotland") %>% .$geography),
                                         selectize = FALSE,
                                         width = "100%"))

             ),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Give every child the best start in life"),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_child_development_cw", "Child social and physical development")),
                            summaryBoxUI("child_development_cw", title = "Percentage showing concern",
                                         button_title =  "Child social and physical development",
                                         button_content =  glue("This is the percentage of children with a concern at their 27-30 month health review recorded in {max(preschool$financial_year)}. <br> <br> ",
                                                                "This data is available at Scotland, health board and council area level. Further information is ",
                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_children_at_risk_of_obesity", "Children at risk of obesity (age 2-15)")),
                            summaryBoxUI("children_at_risk_of_obesity", title = "Percentage of children",
                                         button_title =  "At risk of obesity",
                                         button_content =  glue("This is the percentage of children aged between 2 and 15 years at risk of obesity in {max(childhood_obesity$date)}. <br> <br> ",
                                                                "This data is available at Scotland level. Further information is ",
                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_infant_mortality_cw", "Infant mortality")),
                            summaryBoxUI("infant_mortality_cw", title = "Rate per 1,000 livebirths",
                                         button_title =  "Infant mortality",
                                         button_content =  glue("This is the rate of infant deaths per 1,000 live births in {max(inf_deaths$date) %>% format('%B %Y')}. <br> <br>",
                                                                "This data is available at Scotland level. Further information is ",
                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_child_material_deprivation", "Child material deprivation")),
                            summaryBoxUI("child_material_deprivation")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_child_wellbeing", "Child wellbeing and happiness")),
                            summaryBoxUI("child_wellbeing")
                     )),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_perinatal_mortality", "Perinatal mortality rate")),
                            summaryBoxUI("perinatal_mortality")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_physical_activity_children_cw", "Physical activity")),
                            summaryBoxUI("physical_activity_children_cw")
                     )),
                   fluidRow(column(12, br()))
                 )),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Enable all children, young people and adults to maximise their capabilities and control over their lives"),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_camhs_waiting_times_cw", "CAMHS waiting times")),
                            summaryBoxUI("camhs_waiting_times_cw", title = "Percentage of children and young people",
                                         button_title =  "CAMHS waiting times",
                                         button_content =  glue("This is the percentage of children and young people who were seen within 18 weeks of referral ",
                                                                "to CAMHS (Children and Adolescent Mental Health Services) in {max(camhs_waiting_times2$date) %>% format('%B %Y')}. <br> <br>",
                                                                "This data is available at Scotland and health board level. Further breakdown information for other wait times is ",
                                                                "available under `Enable all children, young people and adults to maximise their capabilities and control over their lives` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_children_relationships", "Children have positive relationships")),
                            summaryBoxUI("children_relationships")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_childrens_voices", "Children’s voices")),
                            summaryBoxUI("childrens_voices")
                     )),

                   fluidRow(

                     column(6,
                            h3(actionLink("jump_summary_to_confidence_of_young", "Confidence and resilience of children and young people")),
                            summaryBoxUI("confidence_of_young")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_mental_health_cw", "Mental health / mental wellbeing")),
                            summaryBoxUI("mental_health_cw")
                     )),
                   fluidRow(column(12, br()))
                 )),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Create fair employment and good work for all"),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_economic_inactivity_cw_want", "Economic inactivity")),
                            summaryBoxUI("economic_inactivity_cw_want", title = "Percentage who want to work",
                                         button_title =  "Economic inactivity",
                                         button_content =  glue("This is the percentage of economically inactive people who want to work in {max(economic_inactivity$year)}. <br> <br>",
                                                                "This data is available at Scotland and council area level. Further information is available under ",
                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_economic_inactivity_cw_not_want", "Economic inactivity")),
                            summaryBoxUI("economic_inactivity_cw_not_want", title = "Percentage who don't want to work",
                                         button_title =  "Economic inactivity",
                                         button_content =  glue("This is the percentage of economically inactive people who don`t want to work in {max(economic_inactivity$year)}. <br> <br>",
                                                                "This data is available at Scotland and council area level. Further information is available under ",
                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_employees_living_wage_cw", "Employees on the living wage")),
                            summaryBoxUI("employees_living_wage_cw", title = "Percentage of employees earning less than the living wage",
                                         button_title =  "Employees on the living wage",
                                         button_content =  glue("This is the percentage of employees earning less than the living wage in {max(employees_living_wage_by_LA$year)}. <br> <br>",
                                                                "This data is available at Scotland and council area level. Further breakdown information of employees by sector is available under ",
                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_gender_pay_gap_cw", "Pay gap")),
                            summaryBoxUI("gender_pay_gap_cw", title = "Percentage difference between men`s and women`s hourly earnings",
                                         button_title =  "Pay gap",
                                         button_content =  glue("This is the percentage difference between men`s and women`s hourly earnings as a percentage of men`s earnings (excluding overtime) in {max(gender_pay_gap_by_sector$year)}. <br> <br>",
                                                                "This data is available at Scotland level. Further breakdown information of sector, work pattern and information regarding median hourly earnings for each sex is available under ",
                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(6,
                            h3(actionLink("jump_summary_to_work_related_ill_health", "Work related ill health")),
                            summaryBoxUI("work_related_ill_health")
                     )),

                   fluidRow(column(12, br()))
                 )),



             box(width = 12,
                 status = "info",
                 icon = icon_no_warning_fn("user-shield"),
                 tagList(
                   h2("Strengthen the role and impact of ill health prevention"),
                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_asthma_admissions", "Admissions for asthma")),
                            summaryBoxUI("asthma_admissions", title = "Yearly total",
                                         button_title = "Admissions for asthma",
                                         button_content = glue("This is the yearly total number of admissions for asthma for the financial year {max(asthma_admissions$date)}. <br> <br>",
                                                               "This data is available at Scotland and health board level. ",
                                                               "Further breakdown of age groups and sex is available under `Strengthen the role and impact ",
                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),


                     column(4,
                            h3(actionLink("jump_summary_to_alcohol_deaths","Alcohol-specific deaths")),
                            summaryBoxUI("alcohol_deaths", title = "Rate of deaths per 100,000",
                                         button_title = "Alcohol-specific deaths",
                                         button_content = glue("This is the Age-sex Standardised Rate of alcohol-specific deaths for the year {alcohol_deaths$year %>% max()}. <br> <br>",
                                                               "This data is available at Scotland level. Further breakdown of age groups and sex is available under `Strengthen the role and impact ",
                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),




                     column(4,
                            h3(actionLink("jump_summary_to_alcohol_admissions","Alcohol-related hospital admissions")),
                            summaryBoxUI("alcohol_admissions", title = "Rate of admissions per 100,000",
                                         button_title = "Alcohol-related hospital admissions",
                                         button_content = glue("This is the European Age-sex Standardised Rate of alcohol-related hospital admissions (stays) for the financial year {alcohol_admissions$financial_year %>% max()}. <br> <br>",
                                                               "This data is available at Scotland and health board level. Further information is available under `Strengthen the role and impact ",
                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )
                   ),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_all_cause_mortality", "All-cause mortality (age 15-44)")),
                            summaryBoxUI("all_cause_mortality", title = "Rate of deaths per 100,000",
                                         button_title =  "All-cause mortality (age 15 to 44)",
                                         button_content = glue("This is the rate of deaths per 100,000 population for people aged between 15 and 44 years for the year {max(all_cause_mortality$year)}.",
                                                               "The causes of death are coded in accordance with the International Classification of Diseases (ICD-10) and Related Health Problems. <br> <br>",
                                                               "This data is available at Scotland, health board and council area level. Further information is available under `Strengthen the role and impact ",
                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_chd_deaths", "Coronary heart disease (CHD): deaths")),
                            summaryBoxUI("chd_deaths", title = "Rate of deaths per 100,000",
                                         button_title =  "Coronary Heart Disease (CHD) deaths",
                                         button_content = glue("This is the Age-sex Standardised Rate of coronary heart disease deaths per 100,000 population for the year range {max(chd_deaths$year_range)}.",
                                                               "This refers to diseases of the coronary arteries that supply the heart. This includes acute myocardial infarction, angina and most cases of heart failure. <br> <br>",
                                                               "This data is available at Scotland, health board and council area level. Further breakdown information at HSCP, locality and intermediate zone level is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_drug_deaths", "Drug-related deaths")),
                            summaryBoxUI("drug_deaths", title = "Rate of deaths per 100,000",
                                         button_title =  "Drug-related deaths",
                                         button_content = glue("This is the Age-sex Standardised Rate of drug-related deaths per 100,000 population for the year range {max(drug_related_deaths$year)}. <br> <br>",
                                                               "This data is available at Scotland, health board and council area level. Further breakdown of the number of deaths is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))

                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_drug_admissions","Drug-related hospital admissions")),
                            summaryBoxUI("drug_admissions", title = "Rate of stays per 100,000",
                                         button_title =  "Drug-related hospital admissions",
                                         button_content = glue("This is the Age-sex Standardised Rate of drug-related hospital admissions (stays) per 100,000 population for the financial year {max(drug_stays$financial_year)}. ",
                                                               "This data is relating to general acute and psychiatric hospital stays with a diagnosis of drug misuse. <br> <br>",
                                                               "This data is available at Scotland level. Further breakdown of age groups is ",
                                                               "available under `Strengthen the role and impact on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_experience_of_unpaid_carers_agree", "Experience of unpaid carers")),
                            summaryBoxUI("experience_of_unpaid_carers_agree", title = "Percentage who strongly agreed",
                                         button_title =  "Experience of unpaid carers",
                                         button_content = glue("This is the percentage of unpaid carers who strongly agreed with the statement ",
                                                               "“I feel supported to continue caring“ for the Health and Care Experience Survey {max(experience_unpaid_carers$date)}. <br> <br>",
                                                               "This data is available at Scotland level. Further breakdown for other levels of agreement with the statement is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_experience_of_unpaid_carers_disagree", "Experience of unpaid carers")),
                            summaryBoxUI("experience_of_unpaid_carers_disagree", title = "Percentage who strongly disagreed",
                                         button_title =  "Experience of unpaid carers",
                                         button_content = glue("This is the percentage of unpaid carers who strongly disagreed with the statement ",
                                                               "“I feel supported to continue caring“ for the Health and Care Experience Survey {max(experience_unpaid_carers$date)}. <br> <br>",
                                                               "This data is available at Scotland level. Further breakdown for other levels of agreement with the statement is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_hospital_admission_heart_attack", "First ever hospital admission for heart attack (under 75)")),
                            summaryBoxUI("hospital_admission_heart_attack", title = "Yearly total",
                                         button_title =  "First ever hospital admission for heart attack  (under 75)",
                                         button_content =  glue("This is the total number of first ever hospital admissions for acute myocardial infarction (heart attack) ",
                                                                "amongst those aged under 75 years in the year {max(heart_attack$date)}. <br> <br>",
                                                                "This data is available at Scotland level. Further breakdown information is ",
                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_healthy_birthweight", "Healthy birthweight")),
                            summaryBoxUI("healthy_birthweight", title = "Percentage of livebirths of an approporiate birthweight",
                                         button_title =  "Healthy birthweight",
                                         button_content =  glue("This is the percentage of babies with an appropriate birthweight based on gestational age in the financial year ",
                                                                "{max(birthweight$financial_year)}. Birthweight for gestational age is an indicator used to differentiate between ",
                                                                "babies who, for example, are light because they are preterm and those who are inappropriately light after adjustment for gestational age at birth. <br> <br>",
                                                                "This data is available at Scotland, health board and council area level. Further information is ",
                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_healthy_life_expectancy_male", "Healthy life expectancy")),
                            summaryBoxUI("healthy_life_expectancy_male", title = "Healthy life expectancy (years) for males",
                                         button_title = "Healthy life expectancy",
                                         button_content = glue("This is the healthy life expectancy of males at birth in the year range {max(healthy_life_expectancy$time_period)}.",
                                                               "Healthy life expectancy (HLE) is an estimate of the number of years lived in ‘very good’ or ‘good’ general health,",
                                                               "based on how individuals perceive their state of health at the time of completing the annual population survey (APS).",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and council area level. Further breakdown of healthy life expectancy at age 65 is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_healthy_life_expectancy_female", "Healthy life expectancy")),
                            summaryBoxUI("healthy_life_expectancy_female", title = "Healthy life expectancy (years) for females",
                                         button_title = "Healthy life expectancy",
                                         button_content = glue("This is the healthy life expectancy of females at birth in the year range {max(healthy_life_expectancy$time_period)}.",
                                                               "Healthy life expectancy (HLE) is an estimate of the number of years lived in ‘very good’ or ‘good’ general health,",
                                                               "based on how individuals perceive their state of health at the time of completing the annual population survey (APS).",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and council area level. Further breakdown of healthy life expectancy at age 65 is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_life_expectancy_male", "Life expectancy")),
                            summaryBoxUI("life_expectancy_male", title = "Life expectancy (years) for males",
                                         button_title = "Life expectancy",
                                         button_content = glue("This is the life expectancy of males at birth in the year range {max(healthy_life_expectancy$time_period)}.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and council area level.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_life_expectancy_female", "Life expectancy")),
                            summaryBoxUI("life_expectancy_female", title = "Life expectancy (years) for females",
                                         button_title = "Life expectancy",
                                         button_content = glue("This is the life expectancy of females at birth in the year range {max(life_expectancy$time_period)}.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and council area level.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_adult_long_term_condition", "Limiting long-term conditions (age 16+)")),
                            summaryBoxUI("adult_long_term_condition", title = "Percentage of adults",
                                         button_title =  "Limiting long-term conditions (age 16+)",
                                         button_content =  glue("This is the percentage of adults aged 16 years and above who live with a limiting long-term condition in the year {max(adult_living_limiting_long_term_condition$Year)}. <br> <br>",
                                                                "A limiting long-term condition is defined as a physical or mental condition & health condition or illness lasting, ",
                                                                "or expected to last 12 limiting months or more. <br> <br> A long-term condition is defined as limiting if the respondent reported ",
                                                                "that it limited their activities in any way. <br> <br>",
                                                                "This data is available at Scotland level. Further information is ",
                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_mental_wellbeing", "Mental wellbeing of adults (16+)")),
                            summaryBoxUI("mental_wellbeing", title = "Mean WEMWBS score",
                                         button_title = "Mental wellbeing of adults (16+)",
                                         button_content = glue("This is the mean Warwick-Edinburgh Mental Wellbeing Scales (WEMWBS) score for people aged 16+ in Scotland.",
                                                               "The 14-item scale WEMWBS has 5 response categories, summed to provide a single score.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland level. Further breakdown of mental wellbeing of adults by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_premature_mortality", "Premature mortality")),
                            summaryBoxUI("premature_mortality", title = "Rate of deaths per 100,000",
                                         button_title =  "Premature mortality",
                                         button_content = glue("This is the European Age-Standardised all-cause premature mortality rate per 100,000 population for the year {max(premature_mortality_all_cause_hb$date)}. ",
                                                               "Premature mortality is defined as deaths occurring before the age of 75.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD quintile is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_screening_breast", "Screening - uptake for breast and bowel cancer")),
                            summaryBoxUI("screening_breast", title = "Percentage uptake of breast screenings",
                                         button_title = "Breast screening uptake",
                                         button_content = glue("The is the three year rolling average percentage uptake of breast screening for the year range {max(screening_breast_board %>% .$year_range)}.",
                                                               "The Scottish Breast Screening Programme (SBSP) invites women aged between 50 and 70 years old for screening every three years.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_screening_bowel_female", "Screening - uptake for breast and bowel cancer")),
                            summaryBoxUI("screening_bowel_f", title = "Percentage uptake of bowel screenings by females",
                                         button_title = "Bowel screening uptake by females",
                                         button_content = glue("The is the percentage uptake of bowel screenings by females between 1st May 2020 and 30th April 2022.",
                                                               "Bowel screening statistics relates to men and women registered with a Community Health Index number at a",
                                                               "GP and aged between 50-74 years old, who are invited to complete a bowel screening test every two years.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_screening_bowel_male", "Screening - uptake for breast and bowel cancer")),
                            summaryBoxUI("screening_bowel_m", title = "Percentage uptake of bowel screenings by males",
                                         button_title = "Bowel screening uptake by males",
                                         button_content = glue("The is the percentage uptake of bowel screenings by males between 1st May 2020 and 30th April 2022.",
                                                               "Bowel screening statistics relates to men and women registered with a Community Health Index number at a",
                                                               "GP and aged between 50-74 years old, who are invited to complete a bowel screening test every two years.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_adults_self_assessed_health", "Self-assessed health of adults")),
                            summaryBoxUI("adults_self_assessed_health", title = "Percentage of adults",
                                         button_title =  "Self-assessed health of adults",
                                         button_content =  glue("This is the percentage of adults who rated their health as `good` or `very good` in the ",
                                                                "Scottish Health Survey in {max(adult_self_assessed_health$Year)}. Participants who are aged 13 years ",
                                                                "and over are asked to rate their health in general with answer options ranging from `very good` to `very bad`. <br> <br>",
                                                                "This data is available at Scotland level. Further information is ",
                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                "<br> <br> {strong('Click again to close.')}"))
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_vaccinations_covid", "Vaccinations – uptake ")),
                            summaryBoxUI("vaccinations_covid", title = "Percentage uptake of COVID-19 vaccinations in SIMD decile 1 (Most deprived)",
                                         button_title = "COVID-19 vaccinations uptake",
                                         button_content = glue("The is the percentage uptake of COVID-19 vaccinations in SIMD decile 1 (Most deprived) as at {vaccinations_covid %>% slice(which.max(.$date)) %>% .$date}.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_vaccinations_flu", "Vaccinations – uptake ")),
                            summaryBoxUI("vaccinations_flu", title = "Percentage uptake of influenza vaccinations in SIMD decile 1 (Most deprived)",
                                         button_title = "Influenza vaccinations uptake",
                                         button_content = glue("The is the percentage uptake of influenza vaccinations in SIMD decile 1 (Most deprived) as at {vaccinations_flu %>% slice(which.max(.$date)) %>% .$date}.",
                                                               "<br> <br>",
                                                               "This data is available at Scotland and health board level. Further breakdown by SIMD is ",
                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                               "<br> <br> {strong('Click again to close.')}"))
                     )),
                   fluidRow(

                     column(4,
                            h3(actionLink("jump_summary_to_experience_recipients", "Experience of social care recipients")),
                            summaryBoxUI("experience_recipients")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_health_risk_behaviours", "Health risk behaviours")),
                            summaryBoxUI("health_risk_behaviours")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_healthy_weight", "Healthy weight adults")),
                            summaryBoxUI("healthy_weight")
                     )),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_physical_activity", "Physical activity")),
                            summaryBoxUI("physical_activity")
                     ),

                     column(4,
                            h3(actionLink("jump_summary_to_quality_care", "Quality of care experience")),
                            summaryBoxUI("quality_care")
                     )#,

                     # column(4,
                     #        h3(actionLink("jump_summary_to_work_related_health", "Work-related ill health")),
                     #        summaryBoxUI("work_related_health")
                     # )
                     ),
                   fluidRow(column(12, br()))
                 )),



             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Ensure a healthy standard of living for all"),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_food_insecurity", "Food insecurity money or other resources")),
                            summaryBoxUI("food_insecurity")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_persistent_poverty", "Persistent poverty")),
                            summaryBoxUI("persistent_poverty")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_satisfaction_with_housing", "Satisfaction with housing")),
                            summaryBoxUI("satisfaction_with_housing")
                     )),
                   fluidRow(column(12, br()))
                 )),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Create and develop healthy and sustainable places and communities"),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_loneliness", "Loneliness")),
                            summaryBoxUI("loneliness")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_areas_of_health_inequalities", "Number of areas where health inequalities are reducing")),
                            summaryBoxUI("areas_of_health_inequalities")
                     )),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_perceptions_of_local_area", "Perceptions of local area")),
                            summaryBoxUI("perceptions_of_local_area")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_places_to_intereact", "Places to interact")),
                            summaryBoxUI("places_to_intereact")
                     )),
                   fluidRow(column(12, br()))
                 )),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Tackling discrimination, racism and their outcomes"),

                   fluidRow(
                     column(6,
                            h3(actionLink("jump_summary_to_gender_balance", "Gender balance in organisations")),
                            summaryBoxUI("gender_balance")
                     ),
                     column(6,
                            h3(actionLink("jump_summary_to_dignity_respect", "Public services treat people with dignity and respect")),
                            summaryBoxUI("dignity_respect")
                     )),
                   fluidRow(column(12, br()))
                 )),

             box(width = 12,
                 status = "info",
                 tagList(
                   h2("Pursuing environmental sustainability and health equity together"),

                   fluidRow(
                     column(4,
                            h3(actionLink("jump_summary_to_blue_green_space", "Access to green and blue space")),
                            summaryBoxUI("blue_green_space")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_journeys_active", "Journeys by active travel")),
                            summaryBoxUI("journeys_active")
                     ),
                     column(4,
                            h3(actionLink("jump_summary_to_visit_outdoors", "Visits to the outdoors")),
                            summaryBoxUI("visit_outdoors")
                     )),
                   fluidRow(column(12, br()))
                 )),

             fluidRow(column(12, linebreaks(2)))

           )
  )
)
