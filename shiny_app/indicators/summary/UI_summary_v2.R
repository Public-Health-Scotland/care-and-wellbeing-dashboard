
tagList(
  fluidRow(width=12,
           h1("At a glance"),

           p("Select either Covid Recovery or Care and Wellbeing, and then select at which national or",
             "local geography level and area you wish to see data for."),

           p(tags$li("Each box will provide the date and value of the latest data for the corresponding indicator."),
             tags$li("If a box states TBC, then it has not yet been confimed if the indicator will be moved onto the dashboard."),
             tags$li("If a box states 'Not available' then the data is not available for the chosen national or local level and area.")),

           p("Clicking on the 'i' button will provide additional information about the indicator."),

           p("Click the title above each box to jump to the relevant tab within the dashboard.",
             "(Only the first row of Care and Wellbeing is working - please provide feedback so",
             "we can make a decision on whether or not to advance on making all titles jump links)"),
           br(),

           tagList(
             tabBox(width= NULL, type = "pills",
                    #####COVID Recovery #####
                    # tabPanel("Covid Recovery",
                    #
                    #          linebreaks(1),
                    #          fluidRow(column(6,
                    #
                    #                          selectInput("geog_type_summary_CR",
                    #                                      "Step 1: Select national or local geography level ",
                    #                                      choices = c("Scotland", "Health board", "Council area"),
                    #                                      width = "100%")),
                    #                   column(6,
                    #
                    #                          selectInput("geog_name_summary_CR",
                    #                                      "Step 2: Select national or local geography area ",
                    #                                      choices = unique(geog_lookup %>% filter(geography_type == "Scotland") %>% .$geography),
                    #                                      width = "100%")
                    #
                    #                   )
                    #
                    #          ),
                    #
                    #          box(width = 12,
                    #              status = "info",
                    #              tagList(
                    #                h2("Wellbeing of children and young people"),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("CAMHS waiting times"),
                    #                         withSpinner(infoBoxOutput("camhs_waiting_times_cr_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Child Poverty"),
                    #                         withSpinner(infoBoxOutput("child_poverty_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Infant mortality"),
                    #                         withSpinner(infoBoxOutput("infant_mortality_cr_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Positive destinations of school leavers"),
                    #                         withSpinner(infoBoxOutput("positive_destinations_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Pre-School development"),
                    #                         withSpinner(infoBoxOutput("child_development_cr_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Protection from harm"),
                    #                         withSpinner(infoBoxOutput("protection_from_harm_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Being listened to and involved in decision making"),
                    #                         withSpinner(infoBoxOutput("listen_to_decision_making_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Mental health and wellbeing"),
                    #                         withSpinner(infoBoxOutput("mental_health_cr_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Physical activity"),
                    #                         withSpinner(infoBoxOutput("physical_activity_children_cr_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(column(12, br()))
                    #              )),
                    #
                    #          box(width = 12,
                    #              status = "info",
                    #              tagList(
                    #                h2("Financial security for low income households"),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Cost of living"),
                    #                         withSpinner(infoBoxOutput("cost_of_living_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("ELC uptake"),
                    #                         withSpinner(infoBoxOutput("childcare_uptake_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Fuel affordability"),
                    #                         withSpinner(infoBoxOutput("fuel_affordability_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Managing financially"),
                    #                         withSpinner(infoBoxOutput("managing_financially_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Savings"),
                    #                         withSpinner(infoBoxOutput("savings_infobox", width=NULL)),
                    #                  ),
                    #
                    #                  column(4,
                    #                         h4("Unmanageable debt"),
                    #                         withSpinner(infoBoxOutput("unmanageable_debt_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Benefit uptake and engagement with welfare advice"),
                    #                         withSpinner(infoBoxOutput("benefits_uptake_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Food affordability"),
                    #                         withSpinner(infoBoxOutput("food_affordability_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Transport costs"),
                    #                         withSpinner(infoBoxOutput("transport_costs_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(column(12, br()))
                    #              )),
                    #
                    #          box(width = 12,
                    #              status = "info",
                    #              tagList(
                    #                h2("Good, green jobs and fair work"),
                    #                fluidRow(
                    #
                    #                  column(4,
                    #                         h4("Disability employment gap"),
                    #                         withSpinner(infoBoxOutput("disability_employment_gap_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Economic Inactivity"),
                    #                         withSpinner(infoBoxOutput("economic_inactivity_cr_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Employability"),
                    #                         withSpinner(infoBoxOutput("employability_infobox", width=NULL)),
                    #                  )),
                    #
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Employees on the living wage"),
                    #                         withSpinner(infoBoxOutput("employees_living_wage_cr_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Ethnicity employment gap"),
                    #                         withSpinner(infoBoxOutput("ethnicity_employment_gap_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Gender pay gap"),
                    #                         withSpinner(infoBoxOutput("gender_pay_gap_cr_infobox", width=NULL)),
                    #                  )),
                    #
                    #                fluidRow(
                    #                  column(4,
                    #                         h4("Skills shortage vacancies"),
                    #                         withSpinner(infoBoxOutput("skills_shortage_vacancies_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Underemployment"),
                    #                         withSpinner(infoBoxOutput("underemployment_infobox", width=NULL)),
                    #                  ),
                    #                  column(4,
                    #                         h4("Zero hours contracts"),
                    #                         withSpinner(infoBoxOutput("zero_hours_contracts_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(
                    #                  column(6,
                    #                         h4("Contractually secure work"),
                    #                         withSpinner(infoBoxOutput("contractually_secure_work_infobox", width=NULL)),
                    #                  ),
                    #                  column(6,
                    #                         h4("Green Jobs"),
                    #                         withSpinner(infoBoxOutput("green_jobs_infobox", width=NULL)),
                    #                  )),
                    #                fluidRow(column(12, br()))
                    #              ))
                    #
                    # ),
                    ##### Care and Wellbeing #####
                    tabPanel("Care and Wellbeing",
                             linebreaks(2),
                             fluidRow(column(6,

                                             selectInput("geog_type_summary_CW",
                                                         "Step 1: Select national or local geography level ",
                                                         choices = c("Scotland", "Health board", "Council area"),
                                                         width = "100%")),
                                      column(6,

                                             selectInput("geog_name_summary_CW",
                                                         "Step 2: Select national or local geography area ",
                                                         choices = unique(geog_lookup %>% filter(geography_type == "Scotland") %>% .$geography),
                                                         width = "100%"))

                             ),

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
                                                                               "<br> <br> Click again to close."))
                                     ),


                                     column(4,
                                            h3(actionLink("jump_summary_to_alcohol_deaths","Alcohol-related deaths")),
                                            summaryBoxUI("alcohol_deaths"),
                                     ),
                                     column(4,
                                            h3(actionLink("jump_summary_to_alcohol_admissions","Alcohol-related hospital admissions (under 75)")),
                                            summaryBoxUI("alcohol_admissions", title = "Yearly total",
                                                         button_title = "Alcohol-related hospital admissions",
                                                         button_content = glue("This is the European Age-sex Standardised Rate of alcohol-related hospital admissions (stays) for people aged under 75 years for the financial year {alcohol_admissions$financial_year %>% max()}. <br> <br>",
                                                                               "This data is available at Scotland and health board level. Further information is available under `Strengthen the role and impact ",
                                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
                                     )
                                   ),

                                   fluidRow(
                                     column(4,
                                            h4("All-cause mortality (age 15-44)"),
                                            summaryBoxUI("all_cause_mortality", title = "Rate of deaths per 100,000",
                                                         button_title =  "All-cause mortality (age 15 to 44)",
                                                         button_content = glue("This is the rate of deaths per 100,000 population for people aged between 15 and 44 years for the year {max(all_cause_mortality$year)}.",
                                                                               "The causes of death are coded in accordance with the International Classification of Diseases (ICD-10) and Related Health Problems. <br> <br>",
                                                                               "This data is available at Scotland, health board and council area level. Further information is available under `Strengthen the role and impact ",
                                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
                                     ),
                                     column(4,
                                            h4("Coronary heart disease (CHD): deaths (age 45-74)"),
                                            summaryBoxUI("chd_deaths", title = "Rate of deaths per 100,000",
                                                         button_title =  "Coronary Heart Disease (CHD) deaths (aged 45-74)",
                                                         button_content = glue("This is the Age-sex Standardised Rate of coronary heart disese deaths per 100,000 population for people aged between 45 and 75 years for the year range {max(chd_deaths$year_range)}.",
                                                                               "This refers to diseases of the coronary arteries that supply the heart. This includes acute myocardial infarction, angina and most cases of heart failure. <br> <br>",
                                                                               "This data is available at Scotland, health board and council area level. Further breakdown information at HSCP, locality and intermediate zone level is ",
                                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
                                     ),
                                     column(4,
                                            h4("Drug-related deaths"),
                                            summaryBoxUI("drug_deaths", title = "Rate of deaths per 100,000",
                                                         button_title =  "Drug-related deaths",
                                                         button_content = glue("This is the Age-sex Standardised Rate of drug-related deaths per 100,000 population for the year range {max(drug_related_deaths$year)}. <br> <br>",
                                                                               "This data is available at Scotland, health board and council area level. Further breakdown of number of deaths is ",
                                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))

                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Drug-related hospital admissions"),
                                            summaryBoxUI("drug_admissions", title = "Rate of stays per 100,000",
                                                         button_title =  "Drug-related hospital admissions",
                                                         button_content = glue("This is the Age-sex Standardised Rate of drug-related hospital admissions (stays) per 100,000 population for the financial year {max(drug_stays$financial_year)}. ",
                                                                               "This data is relating to general acute and psychiatric hospital stays with a diagnosis of drug misuse. <br> <br>",
                                                                               "This data is available at Scotland level. Further breakdown of age groups is ",
                                                                               "available under `Strengthen the role and impact on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Experience of unpaid carers"),
                                            summaryBoxUI("experience_of_unpaid_carers_agree", title = "Percentage who strongly agreed",
                                                         button_title =  "Experience of unpaid carers",
                                                         button_content = glue("This is the percentage of unpaid carers who strongly agreed with the statement ",
                                                                               "“I feel supported to continue caring“ for the Health and Care Experience Survey {max(experience_unpaid_carers$date)}. <br> <br>",
                                                                               "This data is available at Scotland level. Further breakdown for other levels of agreement with the statement is ",
                                                                               "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Experience of unpaid carers"),
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
                                            h4("First ever hospital admission for heart attack (under 75)"),

                                            summaryBoxUI("hospital_admission_heart_attack", title = "Yearly total",
                                                         button_title =  "First ever hospital admission for heart attack  (under 75)",
                                                         button_content =  glue("This is the total number of first ever hospital admissions for acute myocardial infarction (heart attack) ",
                                                                                "amongst those aged under 75 years in the year {max(heart_attack$date)}. <br> <br>",
                                                                                "This data is available at Scotland level. Further breakdown information is ",
                                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Healthy birthweight"),
                                            summaryBoxUI("healthy_birthweight", title = "Percentage of livebirths of an approporiate birthweight",
                                                         button_title =  "Healthy birthweight",
                                                         button_content =  glue("This is the percentage of babies with an appropriate birthweight based on gestational age in the financial year ",
                                                                                "{recent_date}. Birthweight for gestational age is an indicator used to differentiate between ",
                                                                                "babies who, for example, are light because they are preterm and those who are inappropriately light after adjustment for gestational age at birth. <br> <br>",
                                                                                "This data is available at Scotland, health board and council area level. Further information is ",
                                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Limiting long-term conditions (age 16+)"),
                                            summaryBoxUI("adult_long_term_condition", title = "Percentage of adults",
                                                         button_title =  "Limiting long-term conditions (age 16+)",
                                                         button_content =  glue("This is the percentage of adults aged 16 years and above who live with a limiting long-term condition in the year {recent_date}. <br> <br>",
                                                                                "A limiting long-term condition is defined as a physical or mental condition & health condition or illness lasting, ",
                                                                                "or expected to last 12 limiting months or more. <br> <br> A long-term condition is defined as limiting if the respondent reported ",
                                                                                "that it limited their activities in any way. <br> <br>",
                                                                                "This data is available at Scotland level. Further information is ",
                                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Self-assessed health of adults (age 16+)"),
                                            summaryBoxUI("adults_self_assessed_health", title = "Percentage of adults",
                                                         button_title =  "Self-assessed health of adults (age 16+)",
                                                         button_content =  glue("This is the percentage of adults who rated their health as `good` or `very good` in the ",
                                                                                "Scottish Health survey in {recent_date}. Participants who are aged 13 years",
                                                                                "(? - not 16?) and over are asked to rate their health in general with answer options ranging from `very good` to `very bad`. <br> <br>",
                                                                                "This data is available at Scotland level. Further information is ",
                                                                                "available under `Strengthen the role and impact of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Experience of social care recipients"),
                                            summaryBoxUI("experience_recipients")
                                     ),
                                     column(4,
                                            h4("Health risk behaviours"),
                                            summaryBoxUI("health_risk_behaviours")
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Healthy life expectancy"),
                                            summaryBoxUI("healthy_life_expectancy")
                                     ),
                                     column(4,
                                            h4("Healthy weight adults"),
                                            summaryBoxUI("healthy_weight")
                                     ),
                                     column(4,
                                            h4("Mental wellbeing of adults (16+)"),
                                            summaryBoxUI("mental_wellbeing")
                                     )),
                                   fluidRow(
                                     column(4,
                                            h4("Physical activity"),
                                            summaryBoxUI("physical_activity")
                                     ),
                                     column(4,
                                            h4("Premature mortality"),
                                            summaryBoxUI("premature_mortality")
                                     ),
                                     column(4,
                                            h4("Quality of care experience"),
                                            summaryBoxUI("quality_care")
                                     )),
                                   fluidRow(
                                     column(4,
                                            h4("Screening- uptake for breast and bowel cancer"),
                                            summaryBoxUI("screening")
                                     ),
                                     column(4,
                                            h4("Vaccinations – uptake "),
                                            summaryBoxUI("vaccinations")
                                     ),
                                     column(4,
                                            h4("Work-related ill health"),
                                            summaryBoxUI("work_related_health")
                                     )),
                                   fluidRow(column(12, br()))
                                 )),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Give every child the best start in life"),

                                   fluidRow(
                                     column(4,
                                            h4("At risk of obesity"),
                                            summaryBoxUI("children_at_risk_of_obesity", title = "Percentage of children",
                                                         button_title =  "At risk of obesity",
                                                         button_content =  glue("This is the percentage of children aged between 2 and 15 years at risk of obesity in {recent_date}. <br> <br> ",
                                                                                "This data is available at Scotland level. Further information is ",
                                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Child social and physical development"),
                                            summaryBoxUI("child_development_cw", title = "Percentage showing concern",
                                                         button_title =  "Child social and physical development",
                                                         button_content =  glue("This is the percentage of children with a concern at their 27-30 month health review recorded in {recent_date}. <br> <br> ",
                                                                                "This data is available at Scotland, health board and council area level. Further information is ",
                                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Infant mortality"),
                                            summaryBoxUI("infant_mortality_cw", title = "Rate per 1,000 livebirths",
                                                         button_title =  "Infant mortality",
                                                         button_content =  glue("This is the rate of infant deaths per 1,000 live births in {recent_date %>% format('%B %Y')}. <br> <br>",
                                                                                "This data is available at Scotland level. Further information is ",
                                                                                "available under `Give every child the best start in life` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Child material deprivation"),
                                            summaryBoxUI("child_material_deprivation")
                                     ),
                                     column(6,
                                            h4("Child wellbeing and happiness"),
                                            summaryBoxUI("child_wellbeing")
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Perinatal mortality rate"),
                                            summaryBoxUI("perinatal_mortality")
                                     ),
                                     column(6,
                                            h4("Physical activity"),
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
                                            h4("CAMHS waiting times"),
                                            summaryBoxUI("camhs_waiting_times_cw", title = "Percentage of children and young people",
                                                         button_title =  "CAMHS waiting times",
                                                         button_content =  glue("This is the percentage of children and young people who were seen within 18 weeks of referral ",
                                                                                "to CAMHS (Children and Adolescent Mental Health Services) in {recent_date %>% format('%B %Y')}. <br> <br>",
                                                                                "This data is available at Scotland and health board level. Further breakdown information for other wait times is ",
                                                                                "available under `Enable all children, young people and adults to maximise their capabilities and control over their lives` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),
                                     column(4,
                                            h4("Children have positive relationships"),
                                            summaryBoxUI("children_relationships")
                                     ),
                                     column(4,
                                            h4("Children’s voices"),
                                            summaryBoxUI("childrens_voices")
                                     )),

                                   fluidRow(

                                     column(6,
                                            h4("Confidence and resilience of children and young people"),
                                            summaryBoxUI("confidence_of_young")
                                     ),
                                     column(6,
                                            h4("Mental health / mental wellbeing"),
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
                                            h4("Economic inactivity"),
                                            summaryBoxUI("economic_inactivity_cw_want", title = "Percentage who want to work",
                                                         button_title =  "Economic inactivity",
                                                         button_content =  glue("This is the percentage of economically inactive people who want to work in {recent_date}. <br> <br>",
                                                                                "This data is available at Scotland and council area level. Further information is available under ",
                                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Economic inactivity"),
                                            summaryBoxUI("economic_inactivity_cw_not_want", title = "Percentage who don't want to work",
                                                         button_title =  "Economic inactivity",
                                                         button_content =  glue("This is the percentage of economically inactive people who don`t want to work in {recent_date}. <br> <br>",
                                                                                "This data is available at Scotland and council area level. Further information is available under ",
                                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(4,
                                            h4("Employees on the living wage"),
                                            summaryBoxUI("employees_living_wage_cw", title = "Percentage of employees earning less than the living wage",
                                                         button_title =  "Employees on the living wage",
                                                         button_content =  glue("This is the percentage of employees earning less than the living wage in {recent_date}. <br> <br>",
                                                                                "This data is available at Scotland and council area level. Further breakdown information of employees by sector is available under ",
                                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Pay gap"),
                                            summaryBoxUI("gender_pay_gap_cw", title = "Percentage difference between men`s and women`s hourly earnings",
                                                         button_title =  "Pay gap",
                                                         button_content =  glue("This is the percentage difference between men`s and women`s hourly earnings as a percentage of men`s earnings (excluding overtime) in {recent_date}. <br> <br>",
                                                                                "This data is available at Scotland level. Further breakdown information of sector, work pattern and information regarding median hourly earnings for each sex is available under ",
                                                                                "`Create fair employment and good work for all` on the `Care and Wellbeing` tab.",
                                                                                "<br> <br> {strong('Click again to close.')}"))
                                     ),

                                     column(6,
                                            h4("Work related ill health"),
                                            summaryBoxUI("work_related_ill_health")
                                     )),

                                   fluidRow(column(12, br()))
                                 )),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Ensure healthy standard of living for all"),

                                   fluidRow(
                                     column(4,
                                            h4("Food insecurity money or other resources"),
                                            summaryBoxUI("food_insecurity")
                                     ),
                                     column(4,
                                            h4("Persistent poverty"),
                                            summaryBoxUI("persistent_poverty")
                                     ),
                                     column(4,
                                            h4("Satisfaction with housing"),
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
                                            h4("Loneliness"),
                                            summaryBoxUI("loneliness")
                                     ),
                                     column(6,
                                            h4("Number of areas where health inequalities are reducing"),
                                            summaryBoxUI("areas_of_health_inequalities")
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Perceptions of local area"),
                                            summaryBoxUI("perceptions_of_local_area")
                                     ),
                                     column(6,
                                            h4("Places to interact"),
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
                                            h4("Gender balance in organisations"),
                                            summaryBoxUI("gender_balance")
                                     ),
                                     column(6,
                                            h4("Public services treat people with dignity and respect"),
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
                                            h4("Access to green and blue space"),
                                            summaryBoxUI("blue_green_space")
                                     ),
                                     column(4,
                                            h4("Journeys by active travel"),
                                            summaryBoxUI("journeys_active")
                                     ),
                                     column(4,
                                            h4("Visits to the outdoors"),
                                            summaryBoxUI("visit_outdoors")
                                     )),
                                   fluidRow(column(12, br()))
                                 ))

                    )
             )
           ))

)
