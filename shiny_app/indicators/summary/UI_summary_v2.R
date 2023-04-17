tagList(
  fluidRow(width=12,
           h1("Dashboard summary"),
           linebreaks(1),


           tagList(

             tabBox(width= NULL, type = "pills",
                    tabPanel("Covid Recovery",

                             linebreaks(1),
                             fluidRow(column(6,

                                             selectInput("summary_v2_choice1",
                                                         "Step 1: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")),
                                      column(6,

                                             selectInput("summary_v2_choice2",
                                                         "Step 2: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")
                                      )

                             )


                    ),

                    tabPanel("Care and Wellbeing",
                             linebreaks(2),
                             fluidRow(column(6,

                                             selectInput("summary_v2_choice1",
                                                         "Step 1: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")),
                                      column(6,

                                             selectInput("summary_v2_choice2",
                                                         "Step 2: ",
                                                         choices = c("1", "2"),
                                                         width = "100%"))

                             ),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Strengthen the role and impact of ill health prevention"),
                                   fluidRow(
                                     column(4,
                                            h4("Admissions for asthma"),
                                            withSpinner(infoBoxOutput("asthma_admissions_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Alcohol-related deaths"),
                                            withSpinner(infoBoxOutput("alcohol_deaths_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Alcohol-related hospital admissions"),
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
                                            h4("Experience of social care recipients"),
                                            withSpinner(infoBoxOutput("experience_recipients_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Experience of unpaid carers"),
                                            withSpinner(infoBoxOutput("experience_of_unpaid_carers_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("First ever hospital admission for heart attack (under 75)"),
                                            withSpinner(infoBoxOutput("hospital_admission_heart_attack_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Health risk behaviours"),
                                            withSpinner(infoBoxOutput("health_risk_behaviours_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Healthy birthweight"),
                                            withSpinner(infoBoxOutput("healthy_birthweight_infobox", width=NULL)),
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
                                            h4("Limiting long-term conditions (age 16+)"),
                                            withSpinner(infoBoxOutput("adult_long_term_condition_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Mental wellbeing of adults (16+)"),
                                            withSpinner(infoBoxOutput("mental_wellbeing_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Physical activity"),
                                            withSpinner(infoBoxOutput("physical_activity_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Premature mortality"),
                                            withSpinner(infoBoxOutput("premature_mortality_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Quality of care experience"),
                                            withSpinner(infoBoxOutput("quality_care_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Screening- uptake for breast and bowel cancer"),
                                            withSpinner(infoBoxOutput("screening_infobox", width=NULL)),
                                     ),
                                     column(4,
                                            h4("Self-assessed health of adults (age 16+)"),
                                            withSpinner(infoBoxOutput("adults_self_assessed_health_infobox", width=NULL)),
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Vaccinations – uptake "),
                                            withSpinner(infoBoxOutput("vaccinations_infobox", width=NULL)),
                                     ),
                                     column(6,
                                            h4("Work-related ill health"),
                                            withSpinner(infoBoxOutput("work_related_health_infobox", width=NULL)),
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

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
                                            h4("Child material deprivation"),
                                            withSpinner(infoBoxOutput("child_material_deprivation_infobox", width=NULL))
                                     ),
                                     column(4,
                                            h4("Child social and physical development"),
                                            withSpinner(infoBoxOutput("child_development_cw_infobox", width=NULL))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Child wellbeing and happiness"),
                                            withSpinner(infoBoxOutput("child_wellbeing_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Infant mortality"),
                                            withSpinner(infoBoxOutput("infant_mortality_cw_infobox", width=NULL))
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Perinatal mortality rate"),
                                            withSpinner(infoBoxOutput("perinatal_mortality_infobox", width=NULL))
                                     ),
                                     column(6,
                                            h4("Physical activity"),
                                            withSpinner(infoBoxOutput("physical_activity_children_cw_infobox", width=NULL))
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Enable all children, young people and adults to maximise their capabilities and control over their lives"),

                                   fluidRow(
                                     column(4,
                                            h4("CAHMS waiting times"),
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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Create fair employment and good work for all"),

                                   fluidRow(
                                     column(6,
                                            h4("Economic inactivity"),
                                            withSpinner(infoBoxOutput("economic_inactivity_cw_infobox", width=NULL))
                                     ),
                                     column(6,
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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             ),

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
                                     ))
                                 ),
                                 fluidRow(column(12, br()))
                             )

                    )
             )
           ))

)
