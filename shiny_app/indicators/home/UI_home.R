sidebarLayout(
  sidebarPanel(width = 4,
               radioGroupButtons("home_select", status = "home",
                                 choices = home_list,
                                 direction = "vertical", justified = T)),

  mainPanel(width = 8,
            # About
            conditionalPanel(
              condition= 'input.home_select == "about"',
              tagList(h3("Care & Wellbeing"), #div

                      #h4("Care & Wellbeing"),

                      p("The Care & Wellbeing dashboard is one source of data and intelligence to support the",
                        "ambitions to improve population health, address health inequalities and improve the",
                        "health and care system - the missions of the ",
                        tags$a(href= "https://www.gov.scot/groups/care-and-wellbeing-portfolio-board/", "Care & Wellbeing Portfolio.")),
                        p("Many of the influences on health outcomes lie out with health and social care.",
                          "Collective action across government, with local government partners and the wider",
                          "public sector, is fundamental to improving population health and reducing health inequalities."),
                        p("A range of indicators are included in this dashboard structured around the evidence-based",
                          "Marmot framework which looks at the social determinants of health, the conditions in which",
                          "people are born, grow, live, work and age which can lead to health inequalities."),
                        p("The dashboard and indicators will continue to be updated over the coming months.",
                          "This is an early release of the dashboard - it will be further developed following",
                          "user feedback. Please send any feeback to",
                          tags$a(href = "phs.Covid19Data&Analytics@phs.scot", "phs.Covid19Data&Analytics@phs.scot")),
                        p("Explore the latest data below."),
                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_child_start", "Early years"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_child_start2", "Giving every child the best start in life")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_control_lives", "Education"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_control_lives2", "Enabling all to maximise their capabilities and have control over their lives")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_fair_work", "Work"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_fair_work2", "Creating fair employment and good work for all")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_healthy_standard", "Living standards"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_healthy_standard2", "Ensuring a healthy standard of living for all")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_sustainable_communities", "Places"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_sustainable_communities2", "Creating and developing healthy and sustainable places and communities")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_strengthen_prevention", "Ill health prevention"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_strengthen_prevention2", "Strengthening the role and impact of ill health prevention")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_discrimination_racism", "Discrimination and racism"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_discrimination_racism2", "Tackling discrimination, racism and their outcomes")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_environmental_sustainability", "Sustainability and equity"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_environmental_sustainability2", "Pursuing environmental sustainability and health equity together.")))),


                      br(),
                      br(),

                        #                       h4("Covid Recovery"),
                        #
                        #                       p("The Scottish Government’s Covid Recovery Strategy aims to reduce systemic inequalities and focuses on three outcomes: "),
                        #                       p(tags$li("enhancing the wellbeing of children and young people;"),
                        #                         tags$li("increasing financial security for low income households; and "),
                        #                         tags$li("creating good, green jobs and fair work.")),



                ) # tagList
              ), # conditionalPanel

            # Using the dashboard
            conditionalPanel(
              condition= 'input.home_select == "use"',
              tagList(h3("Using the dashboard")) #tagList
                      ), # condtionalPanel

            # News and future updates
            conditionalPanel(
              condition= 'input.home_select == "future"',
              tagList(h3("News and future updates"),
                      p("This section will be updated with news and future updates in due course."),
                ) # tagList
            ), # conditionalPanel

            # Further information
            conditionalPanel(
              condition= 'input.home_select == "info"',
              tagList(h3("Further sources of information"),
                      p(tags$li("The ", tags$b("Scottish Public Health Observatory"), "collaboration is led by Public Health Scotland, ",
                                "and includes the Glasgow Centre for Population Health, the MRC/CSO Social and Public Health Sciences Unit, ",
                                "National Records of Scotland and the Scottish Learning Disabilities Observatory. ",
                                "It provides a clear picture of the health of the Scottish population and the factors that affect it. ",
                                tags$p("More information can be found here: ",
                                tags$a(href="https://www.scotpho.org.uk/", "ScotPHO"))),
                        tags$li("The ",  tags$b("Improvement Service (IS)"),  "is the 'go-to' organisation for local government improvement in Scotland. ",
                                "The IS was established in 2005 as the national improvement organisation for Local Government in Scotland. ",
                                "We were set up to deliver improvement support that would help councils to provide effective community leadership, ",
                                "strong local governance and deliver high quality, efficient local services. ",
                                tags$p("More information can be found here:",
                                tags$a(href="https://www.improvementservice.org.uk/","Improvement Service"))),
                        tags$li("The ",  tags$b("Local Government Benchmarking Framework (LGBF)"),  "is a high-level benchmarking tool designed to ",
                                "support senior management teams and elected members to ask questions about key council services.",
                                tags$p("More information can be found here:",
                                       tags$a(href="https://www.improvementservice.org.uk/benchmarking/home","Local Government Benchmarking Framework"))))


                      ) # tagList
            ), # conditionalPane

            # Accessibility
            conditionalPanel(
              condition= 'input.home_select == "accessibility"',
              tagList(h3("Accessibility"),

                              p("This website is run by ", tags$a(href="https://www.publichealthscotland.scot/",
                                                                  "Public Health Scotland", target="_blank"),
                                ", Scotland's national organisation for public health. As a new organisation formed
                                   on 01 April 2020, Public Health Scotland is currently reviewing its web estate. Public
                                   Health Scotland is committed to making its website accessible, in accordance with
                                   the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility
                                   Regulations 2018. This accessibility statement applies to the dashboard that accompanies
                                   the HSMR quarterly publication."),
                              p(tags$a(href="https://mcmw.abilitynet.org.uk/", "AbilityNet (external website)", target="_blank"),
                                " has advice on making your device easier to use if you have a disability."),

                              p(tags$b("Compliance status")),
                              p("This site has not yet been evaluated against Web Content Accessibility Guidelines
                                   version 2.1 level AA standard. We are currently working towards an evaluation."),
                              br(),
                              p(tags$b("Accessible features")),
                              p("We have taken the following steps to make this dashboard more accessible:"),
                              p(tags$li("Colours have been chosen to meet colour contrast standards")),
                              p(tags$li("Plot colours have been chosen to be colour blind friendly")),
                              p(tags$li("The dashboard can be navigated using a keyboard")),
                              p(tags$li("The content is still readable at 400% zoom")),
                              p(tags$li("Alternative descriptions of plot contents have been provided via 'Plot description' buttons")),
                              p(tags$li("Data tables have been provided alongside plots where possible")),
                              p(tags$li("Hover content has been replaced with clickable content where possible")),
                              br(),
                              p(tags$b("Reporting any accessibility problems with this website")),
                              p("If you wish to contact us about any accessibility issues you encounter on this
                                   site, please email "), #, tags$a(href="mailto:phs.covid19data&analytics@phs.scot", "phs.covid19data&analytics@phs.scot", ".")),

                              p(tags$b("Enforcement procedure")),
                              p("The Equality and Human Rights Commission (EHRC) is responsible for enforcing the
                                   Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations
                                   2018 (the ‘accessibility regulations’). If you’re not happy with how we respond to your complaint,",
                                tags$a(href="https://www.equalityadvisoryservice.com/", "contact the Equality Advisory and Support Service (EASS) (external website).",
                                       target = "_blank")),

                              p(tags$b("Preparation of this accessibility statement")),
                              p("This statement was prepared on 13 January 2023. It was last reviewed on 13 January 2023.")
              ) # tagList
            ) # conditonalPanel
                      ) # mainPanel
  ) # sidebarLayout
