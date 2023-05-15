
tagList(
  fluidRow(width=12,
           h1("Dashboard summary"),

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
                                     # column(4,
                                     #        h4(actionLink("jump_summary_to_asthma_admissions", "Admissions for asthma")),
                                     #        withSpinner(infoBoxOutput("asthma_admissions_infobox", width=NULL)),
                                     # ),
                                     column(4,
                                            h3(actionLink("jump_summary_to_asthma_admissions", "Admissions for asthma")),
                                            box(
                                              title = h4(glue("Yearly total"),
                                                         summaryButtonUI("asthma_admissions_summary_info",
                                                                         "Admissions for asthma",
                                                                         glue("This is the yearly total number of admissions for asthma for the financial year {recent_date}. <br> <br>",
                                                                              "This data is available at Scotland and health board level. ",
                                                                              "Further breakdown of age groups and sex is available under `Strengthen the role and impact ",
                                                                              "of ill health prevention` on the `Care and Wellbeing` tab.",
                                                                              "<br> <br> {strong('Click again to close.')}"))),
                                              width = "100%",
                                              background = "purple",
                                              uiOutput("asthma_admissions_test")
                                            )
                                     ),

                                     column(4,
                                            h4(actionLink("jump_summary_to_alcohol_deaths","Alcohol-related deaths")),
                                            withSpinner(infoBoxOutput("alcohol_deaths_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4(actionLink("jump_summary_to_alcohol_admissions","Alcohol-related hospital admissions (under 75)")),
                                            withSpinner(infoBoxOutput("alcohol_admissions_infobox", width=NULL)),
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
                                            withSpinner(infoBoxOutput("experience_recipients_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Health risk behaviours"),
                                            withSpinner(infoBoxOutput("health_risk_behaviours_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Healthy life expectancy"),
                                            withSpinner(infoBoxOutput("healthy_life_expectancy_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Healthy weight adults"),
                                            withSpinner(infoBoxOutput("healthy_weight_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Mental wellbeing of adults (16+)"),
                                            withSpinner(infoBoxOutput("mental_wellbeing_infobox", width=NULL)),
                                     )),
                                   fluidRow(
                                     column(4,
                                            h4("Physical activity"),
                                            withSpinner(infoBoxOutput("physical_activity_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Premature mortality"),
                                            withSpinner(infoBoxOutput("premature_mortality_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Quality of care experience"),
                                            withSpinner(infoBoxOutput("quality_care_infobox", width=NULL)),
                                     )),
                                   fluidRow(
                                     column(4,
                                            h4("Screening- uptake for breast and bowel cancer"),
                                            withSpinner(infoBoxOutput("screening_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Vaccinations – uptake "),
                                            withSpinner(infoBoxOutput("vaccinations_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Work-related ill health"),
                                            withSpinner(infoBoxOutput("work_related_health_infobox", width=NULL)),
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
                                            withSpinner(infoBoxOutput("child_material_deprivation_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Child wellbeing and happiness"),
                                            withSpinner(infoBoxOutput("child_wellbeing_infobox", width=NULL))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Perinatal mortality rate"),
                                            withSpinner(infoBoxOutput("perinatal_mortality_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Physical activity"),
                                            withSpinner(infoBoxOutput("physical_activity_children_cw_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("children_relationships_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Children’s voices"),
                                            withSpinner(infoBoxOutput("childrens_voices_infobox", width=NULL))
                                     )),

                                   fluidRow(

                                     column(6,
                                            h4("Confidence and resilience of children and young people"),
                                            withSpinner(infoBoxOutput("confidence_of_young_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Mental health / mental wellbeing"),
                                            withSpinner(infoBoxOutput("mental_health_cw_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("work_related_ill_health_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("food_insecurity_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Persistent poverty"),
                                            withSpinner(infoBoxOutput("persistent_poverty_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Satisfaction with housing"),
                                            withSpinner(infoBoxOutput("satisfaction_with_housing_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("loneliness_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Number of areas where health inequalities are reducing"),
                                            withSpinner(infoBoxOutput("areas_of_health_inequalities_infobox", width=NULL))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Perceptions of local area"),
                                            withSpinner(infoBoxOutput("perceptions_of_local_area_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Places to interact"),
                                            withSpinner(infoBoxOutput("places_to_intereact_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("gender_balance_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Public services treat people with dignity and respect"),
                                            withSpinner(infoBoxOutput("dignity_respect_infobox", width=NULL))
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
                                            withSpinner(infoBoxOutput("blue_green_space_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Journeys by active travel"),
                                            withSpinner(infoBoxOutput("journeys_active_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Visits to the outdoors"),
                                            withSpinner(infoBoxOutput("visit_outdoors_infobox", width=NULL))
                                     )),
                                   fluidRow(column(12, br()))
                                 ))

                    )
             )
           ))

)
