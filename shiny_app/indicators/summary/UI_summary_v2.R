
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
                                                         button_content = glue("This is the yearly total number of admissions for asthma for the financial year 2. <br> <br>",
                                                                               "This data is available at Scotland and health board level. ",
                                                                               "Further breakdown of age groups and sex is available under `Strengthen the role and impact ",
                                                                               "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                               "<br> <br> {strong('Click again to close.')}"))
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
                                            withSpinner(infoBoxOutput("all_cause_mortality_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Coronary heart disease (CHD): deaths (age 45-74)"),
                                            withSpinner(infoBoxOutput("chd_deaths_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Drug-related deaths"),
                                            withSpinner(infoBoxOutput("drug_deaths_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Drug-related hospital admissions"),
                                            withSpinner(infoBoxOutput("drug_admissions_infobox", width=NULL)),
                                     ),

                                     column(4,
                                            h4("Experience of unpaid carers"),
                                            withSpinner(infoBoxOutput("experience_of_unpaid_carers_agree_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Experience of unpaid carers"),
                                            withSpinner(infoBoxOutput("experience_of_unpaid_carers_disagree_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("First ever hospital admission for heart attack (under 75)"),
                                            withSpinner(infoBoxOutput("hospital_admission_heart_attack_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Healthy birthweight"),
                                            withSpinner(infoBoxOutput("healthy_birthweight_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Limiting long-term conditions (age 16+)"),
                                            withSpinner(infoBoxOutput("adult_long_term_condition_infobox", width=NULL)),
                                     )),
                                   fluidRow(
                                     column(4,
                                            h4("Self-assessed health of adults (age 16+)"),
                                            withSpinner(infoBoxOutput("adults_self_assessed_health_infobox", width=NULL)),
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
                                            withSpinner(infoBoxOutput("children_at_risk_of_obesity_infobox", width=NULL))
                                     ),

                                     column(4,
                                            h4("Child social and physical development"),
                                            withSpinner(infoBoxOutput("child_development_cw_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Infant mortality"),
                                            withSpinner(infoBoxOutput("infant_mortality_cw_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("camhs_waiting_times_cw_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("economic_inactivity_cw_want_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Economic inactivity"),
                                            withSpinner(infoBoxOutput("economic_inactivity_cw_not_want_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Employees on the living wage"),
                                            withSpinner(infoBoxOutput("employees_living_wage_cw_infobox", width=NULL))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Pay gap"),
                                            withSpinner(infoBoxOutput("gender_pay_gap_cw_infobox", width=NULL))
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
