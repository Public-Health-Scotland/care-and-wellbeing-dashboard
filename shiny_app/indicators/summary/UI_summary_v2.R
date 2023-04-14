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

                             ),

                             box(width = 12,
                                 status = "info",
                                 tagList(
                                   h2("Strengthen the role and impact of ill health prevention"),
                                   fluidRow(
                                     column(4,
                                            h4("Admissions for asthma"),
                                            infoBoxOutput("asthma_admissions_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Alcohol-related deaths"),
                                            infoBoxOutput("alcohol_deaths_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Alcohol-related hospital admissions"),
                                            infoBoxOutput("alcohol_admissions_infobox", width=NULL),
                                     )
                                   ),

                                   fluidRow(
                                     column(4,
                                            h4("All-cause mortality (age 15-44)"),
                                            infoBoxOutput("all_cause_mortality_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Coronary heart disease (CHD): deaths (age 45-74)"),
                                            infoBoxOutput("chd_deaths_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Drug-related deaths"),
                                            infoBoxOutput("drug_deaths_infobox", width=NULL),
                                     )),

                                   fluidRow(
                                     column(4,
                                            h4("Drug-related hospital admissions"),
                                            infoBoxOutput("drug_admissions_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Experience of social care recipients"),
                                            infoBoxOutput("experience_recipients_infobox", width=NULL),
                                     ),
                                     column(4,
                                            h4("Experience of unpaid carers"),
                                            infoBoxOutput("experience_of_unpaid_carers_infobox", width=NULL),
                                     )),

                                   fluidRow(
                                     column(3,
                                            h4("First ever hospital admission for heart attack (under 75)"),
                                            infoBoxOutput("hospital_admission_heart_attack_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Health risk behaviours"),
                                            infoBoxOutput("health_risk_behaviours_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Healthy birthweight"),
                                            infoBoxOutput("healthy_birthweight_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Healthy life expectancy"),
                                            infoBoxOutput("healthy_life_expectancy_infobox", width=NULL),
                                     )),

                                   fluidRow(
                                     column(3,
                                            h4("Healthy weight adults"),
                                            infoBoxOutput("healthy_weight_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Limiting long-term conditions (age 16+)"),
                                            infoBoxOutput("adult_long_term_condition_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Mental wellbeing of adults (16+)"),
                                            infoBoxOutput("mental_wellbeing_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Physical activity"),
                                            infoBoxOutput("physical_activity_infobox", width=NULL),
                                     )),

                                   fluidRow(
                                     column(3,
                                            h4("Premature mortality"),
                                            infoBoxOutput("premature_mortality_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Quality of care experience"),
                                            infoBoxOutput("quality_care_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Screening- uptake for breast and bowel cancer"),
                                            infoBoxOutput("screening_infobox", width=NULL),
                                     ),
                                     column(3,
                                            h4("Self-assessed health of adults (age 16+)"),
                                            infoBoxOutput("adults_self_assessed_health_infobox", width=NULL),
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Vaccinations – uptake "),
                                            infoBoxOutput("vaccinations_infobox", width=NULL),
                                     ),
                                     column(6,
                                            h4("Work-related ill health"),
                                            infoBoxOutput("work_related_health_infobox", width=NULL),
                                     ))
                                 )),

                             box(width = 6,
                                 status = "info",
                                 tagList(
                                   h2("Give every child the best start in life"),

                                   fluidRow(
                                     column(6,
                                            h4("At risk of obesity"),
                                            infoBoxOutput("children_at_risk_of_obesity_infobox", width=NULL)
                                     ),
                                     column(6,
                                            h4("Child material deprivation"),
                                            infoBoxOutput("child_material_deprivation_infobox", width=NULL)
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Child social and physical development"),
                                            infoBoxOutput("child_development_cw_infobox", width=NULL)
                                     ),
                                     column(6,
                                            h4("Child wellbeing and happiness"),
                                            infoBoxOutput("child_wellbeing_infobox", width=NULL)
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Infant mortality"),
                                            infoBoxOutput("infant_mortality_cw_infobox", width=NULL)
                                     ),
                                     column(6,
                                            h4("Perinatal mortality rate"),
                                            infoBoxOutput("perinatal_mortality_infobox", width=NULL)
                                     )),

                                   fluidRow(
                                     column(12,
                                            h4("Physical activity"),
                                            infoBoxOutput("physical_activity_children_cw_infobox", width=NULL)
                                     ))
                                 )),

                             box(width = 6,
                                 status = "info",
                                 tagList(
                                   h2("Enable all children, young people and adults to maximise their capabilities and control over their lives"),

                                   fluidRow(
                                     column(6,
                                            h4("CAHMS waiting times"),
                                            infoBoxOutput("camhs_waiting_times_cw_infobox", width=NULL)
                                     ),
                                     column(6,
                                            h4("Children have positive relationships"),
                                            infoBoxOutput("children_relationships_infobox", width=NULL)
                                     )),

                                   fluidRow(
                                     column(6,
                                            h4("Children’s voices"),
                                            infoBoxOutput("childrens_voices_infobox", width=NULL)
                                     ),
                                     column(6,
                                            h4("Confidence and resilience of children and young people"),
                                            infoBoxOutput("confidence_of_young_infobox", width=NULL)
                                     )),

                                   fluidRow(
                                     column(12,
                                            h4("Mental health / mental wellbeing"),
                                            infoBoxOutput("mental_health_cw_infobox", width=NULL)
                                     ))
                                 ))
                    ),

                    tabPanel("Care and Wellbeing",
                             linebreaks(2),
                             fluidRow(column(6,

                                             pickerInput("summary_v2_choice1",
                                                         "Step 1: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")),
                                      column(6,

                                             pickerInput("summary_v2_choice2",
                                                         "Step 2: ",
                                                         choices = c("1", "2"),
                                                         width = "100%"))

                             ))
             )
           ))

)
