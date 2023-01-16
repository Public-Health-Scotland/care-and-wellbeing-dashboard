tagList(

  h1("Hospital admissions" ),
  br(),
  h4(strong("Select indicator: ")),

  navlistPanel(widths = c(2,10),

               ##############################################.
               # FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
               ##############################################.
               tabPanel(title = "First ever hospital admission for heart attack",
                        value = "hospital_admission_heart_attack",
                        icon = icon_no_warning_fn("lemon"),

                        h3("First ever hospital admission for heart attack")


               ),

               ##############################################.
               # DRUG RELATED HOSPITAL ADMISSIONS ----
               ##############################################.
               tabPanel(title = "Drug-related hospital admissions",
                        value = "drug_related_admissions",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Drug related hospital admissions"),


                        selectizeInput("age_drugstays", "Select an age group",
                        choices = unique(drug_stays$age_group)),

                        plot_title("Age-sex standardised rate of drug-related hospital admissions, Scotland",
                                            "drugstays"),

                        h3("Data table"),

                        DT::dataTableOutput("drugstays_data")
                        ),

               ##############################################.
               # ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
               ##############################################.

               tabPanel(title = "Alcohol admissions",
                        value = "alcohol_admissions",
                        icon = icon_no_warning_fn("wine-bottle"),

                        h3("Alcohol related hospital admissions"),


                        selectizeInput("hb_alcohol_admissions","Select Health Board",
                                                choices = unique(alcohol_admissions$sub_group_select_group_first)),

                        plotlyOutput("alcohol_admissions_plot")
               ),

               ##############################################.
               # ASTHMA HOSPITAL ADMISSIONS----
               ##############################################.
               tabPanel(title = "Asthma hospital admissions",
                        value = "asthma_hospital_admissions",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Asthma hospital admissions")


               )
  )

)








