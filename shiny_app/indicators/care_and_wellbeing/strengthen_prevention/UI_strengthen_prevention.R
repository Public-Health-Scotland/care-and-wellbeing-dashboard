tagList(
  h1("Adult risk of health" ),
  br(),
  bsButton("adult_risk_to_info", "Go to 'Adult risk of health' information page", class = "to_info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),
               ##############################################.
               # ADULTS (16+) SELF-ASSESSED HEALTH----
               ##############################################.
               tabPanel(title = "Adult (16+) self-assessed health",
                        value = "adult_self_assessed_health",
                        icon = icon_no_warning_fn("notes-medical"),
                        h3("Adult self-assessed health "),
                        h4("Percentage of adults who describe their general health as good or very good in Scotland over time"),
                        plotlyOutput("adult_self_assessed_health_plot"),
                        DT::dataTableOutput("adult_self_assessed_health_table")
               ),
               ##############################################.
               # ADULTS (16+) LIVING WITH LIMITING LONG-TERM CONDITIONS----
               ##############################################.
               tabPanel(title = "Adults living with long term condition",
                        value = "adult_living_limiting_long_term_condition",
                        icon = icon_no_warning_fn("lemon"),
                        h3("Adults living with a limiting long term condition "),
                        h4("Percentage of adults with a limiting long-term condition"),
                        plotlyOutput("adult_long_term_condition_plot"),
                        DT::dataTableOutput("adult_long_term_condition_table")
               ),
               ##############################################.
               # SCREENING UPTAKE----
               ##############################################.
               tabPanel(title = "Screening uptake",
                        value = "screening_uptake",
                        icon = icon_no_warning_fn("lemon"),
                        h3("Screening uptake")
               ),
               ##############################################.
               # VACCINATIONS----
               ##############################################.
               tabPanel(title = "Vaccinations",
                        value = "vaccinations",
                        icon = icon_no_warning_fn("lemon"),
                        h3("Vaccinations")
               )
  ) # navlistpanel
) # tagList
