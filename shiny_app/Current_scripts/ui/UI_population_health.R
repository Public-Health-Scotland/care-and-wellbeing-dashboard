navbarMenu(title = "Population health",
           icon = icon_no_warning_fn("staff-snake"),

           ##############################################.
           # ALL-CAUSE MORTALITY (15-44)----
           ##############################################.

           tabPanel(title = "All-cause mortality",
                    value = "all-cause_mortality",
                    icon = icon_no_warning_fn("file-waveform"),

                    h3("All-cause mortality (ages 15-44)"),

                    fluidRow(
                      column(4,
                             selectizeInput("geog_type_mortality",
                                            "1. Select geography type",
                                            choices = c("Scotland",
                                                        "Health Board",
                                                        "Council Area"))),
                      column(4,
                             uiOutput("mortality_input_ui")),
                      column(4,
                             radioButtons("rate_number_mortality",
                                          "3. View rate per 100,000 population or number of deaths",
                                          choices = c("Rate",
                                                      "Number")))

                      ),

                    fluidRow(
                      h3("All-cause mortality, ages 15-44"),
                      plotlyOutput("mortality_line_chart"),
                      h3("Data table"),
                      DT::dataTableOutput("mortality_data")
                    )

                    ),

           ##############################################.
           # CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
           ##############################################.

           tabPanel(title = "Coronary heart disease deaths",
                    value = "chd_deaths",
                    icon = icon_no_warning_fn("heart"),


                    h3("Coronary heart disease (CHD) deaths (aged <75)"),

                    fluidRow(
                      column(4,
                             selectizeInput("geog_type_chd",
                                            "1. Select geography type",
                                            choices = c("Scotland",
                                                        "Health Board",
                                                        "HSCP",
                                                        "Council Area",
                                                        "Locality",
                                                        "Intermediate Zone"))
                             ),
                    column(4,
                           uiOutput("chd_input_ui"))
                    ),

                    plot_title("Coronary heart disease deaths (aged <75), age-sex standardised rates per 100,000",
                               "chd_CI_chart",
                               subtitle = "The shaded line indicates confidence intervals"),

                    h3("Data table"),
                    DT::dataTableOutput("chd_data")



                    ), # End tab panel CHD
           ##############################################.
           # FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACKED (<75)----
           ##############################################.

           ##############################################.
           # DRUG SECTION ----
           ##############################################.

           tabPanel(title = "Drug-related hospital admissions and deaths",
                    value = "drugs",
                    icon = icon_no_warning_fn("hospital"),

                    tabBox(title = "",
                           id = "tabbox_drugs",
                           width = "100%",

                           ##############################################.
                           # DRUG RELATED HOSPITAL ADMISSIONS ----
                           ##############################################.
                           tabPanel(
                             title = "Drug-related hospital admissions",
                             selectizeInput("age_drugstays", "Select an age group",
                                            choices = unique(drug_stays$age_group)),

                             plot_title("Age-sex standardised rate of drug-related hospital admissions, Scotland",
                                        "drugstays"),

                             h3("Data table"),

                             DT::dataTableOutput("drugstays_data")
                           ),

                           ##############################################.
                           # DRUG RELATED DEATHS----
                           ##############################################.

                           tabPanel(
                             title = "Drug-related deaths",
                             value = "drug_deaths",

                             br(),
                             br(),
                             br(),

                             fluidRow(
                               column(4,
                                      selectizeInput("geog_type_drug_deaths", "1. Select a geography type",
                                                     choices = c("Scotland", "Health Board", "Council Area"))),

                               column(4,

                                      uiOutput("geography_drug_deaths")),

                               column(4,
                                      radioButtons("rate_number_drug_deaths",
                                                   "3. View rate per 100,000 population or number of deaths",
                                                   choices = c("Rate",
                                                               "Number")))
                             ),

                             plot_title("Drug misuse deaths by 5 year periods",
                                        "drug_deaths_chart",
                                        subtitle = "Please note, rates based on fewer than 10 deaths are not shown"),

                             h3("Data table"),
                             DT::dataTableOutput("drug_deaths_data")



                           )

                           )

                    ),



           ##############################################.
           # ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
           ##############################################.

           tabPanel(title = "Alcohol admissions",
                    value = "alcohol_admissions",
                    icon = icon_no_warning_fn("wine-bottle"),

                    h3("Alcohol related hospital admissions"),

                    fluidRow(
                      column(4,
                             selectizeInput("hb_alcohol_admissions","Select Health Board",
                                            choices = unique(alcohol_admissions$sub_group_select_group_first))),

                      column(8,plotlyOutput("alcohol_admissions_plot")))
                    ),

           ##############################################.
           # ALCOHOL SPECIFIC DEATHS (45-74)----
           ##############################################.

           ##############################################.
           # ASTHMA HOSPITAL ADMISSIONS----
           ##############################################.




           ##############################################.
           # INFANT MORTALITY (ALL DEATHS IN THE FIRST YEAR OF LIFE)----
           ##############################################.

           ##############################################.
           # HEALTHY BIRTHWEIGHT BABIES----
           ##############################################.

           tabPanel(title = "Healthy birthweight babies",
                    value = "healthy_birthweight",
                    icon = icon_no_warning_fn("baby"),

                    h3("Healthy birthweight babies"),

                    fluidRow(
                      column(4,
                             selectizeInput("geog_type_healthy_birthweight", "1. Select a geography type",
                                            choices = c("Scotland", "Health Board", "Council Area"))),

                      column(4,

                             uiOutput("geography_healthy_birthweight"))),

                    plot_title("Birthweight of babies based on gestational age by financial year",
                               "healthy_birthweight_stacked_chart"),

                    DT::dataTableOutput("healthy_birthweight_data")),
           ##############################################.
           # CHILDREN (2-15) AT RISK OF OBESITY----
           ##############################################.

           tabPanel(title = "Children at risk of obesity", 
                    value = "children_at_risk_of_obesity",
                    icon = icon_no_warning_fn("child-reaching"), 
                    
                    h3("Children at risk of obesity"), 
                    
                    br(),
                    br(), 
                    
                    fluidRow(
                      
                      h4("Percentage of children (2-15) at risk of obesity in Scotland over time"), 
                      
                      plotlyOutput("childhood_obesity_plot")), 
                    
                    DT::dataTableOutput("childhood_obesity_table")
                    
                    
                    ), 
           
           ##############################################.
           # ADULTS (16+) SELF-ASSESSED HEALTH----
           ##############################################.
           
           tabPanel(title = "Adult self-assessed health", 
                    value = "adult_self_assessed_health",
                    icon = icon_no_warning_fn("notes-medical"), 
                    
                    h3("Adult self-assessed health "), 
                    
                    br(),
                    br(), 
                    
                    fluidRow(
                      
                      h4("Percentage of adults who describe their general health as good or very good in Scotland over time"), 
                      
                      plotlyOutput("adult_self_assessed_health_plot")), 
                    
                    DT::dataTableOutput("adult_self_assessed_health_table")
                    
                    
           ), 

           ##############################################.
           # ADULTS (16+) LIVING WITH LIMITING LONG-TERM CONDITIONS----
           ##############################################.

           tabPanel(title = "Adults living with long term condition", 
                    value = "adult_living_limiting_long_term_condition",
                    icon = icon_no_warning_fn("people"), 
                    
                    h3("Adults living with a limiting long term condition "), 
                    
                    br(),
                    br(), 
                    
                    fluidRow(
                      
                      h4("Percentage of adults with a limiting long-term condition"), 
                      
                      plotlyOutput("adult_long_term_condition_plot")), 
                    
                    DT::dataTableOutput("adult_long_term_condition_table")
                    
                    
           ), 
           
           ##############################################.
           # SCREENING UPTAKE----
           ##############################################.

           ##############################################.
           # VACCINATIONS----
           ##############################################.

           ##############################################.
           # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
           ##############################################.


           ##############################################.
           # EXPERIENCE OF UNPAID CARERS----
           ##############################################.


           tabPanel(title = "Experience of unpaid workers ", 
                    value = "experience_unpaid_workers",
                    icon = icon_no_warning_fn("hand-holding-hand"), 
                    
                    h3("Experience of unpaid workers"), 
                    
                    br(),
                    br(), 
                    
                    fluidRow(
                      
                      h4("Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"), 
                      
                      plotlyOutput("experience_unpaid_carers_plot")), 
                    
                    DT::dataTableOutput("experience_unpaid_carers_table")
                    
                    
           )



)# End of navbarMenu