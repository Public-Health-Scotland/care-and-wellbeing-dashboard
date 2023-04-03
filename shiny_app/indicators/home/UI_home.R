sidebarLayout(
  sidebarPanel(width = 4,
               radioGroupButtons("home_select", status = "home",
                                 choices = home_list,
                                 direction = "vertical", justified = T)),

  mainPanel(width = 8,
            # About
            conditionalPanel(
              condition= 'input.home_select == "about"',
              tagList(h3("About"), #div

                      h4("Covid-19 Recovery and Care and Wellbeing Dashboard"),

                      p("The Covid Recovery and Care and Wellbeing Dashboard is a source of intelligence to assess how Scotland is making progress towards ",
                        "the three outcomes of the Scottish Government’s Covid Recovery Strategy and the policy objectives which underpin the ",
                        "Scottish Government’s work on Care and Wellbeing. Many of the influences on health outcomes lie out with health and social care. ",
                        "So it is critical that we work across government, with our local government partners, and wider public sector to ensure health and ",
                        "wellbeing are at the core in our wider policy and delivery. ",
                        "Taking a cross-portfolio approach aligned with the COVID Recovery Strategy will enable us to maximise our reach and impact, ",
                        "and deliver improved outcomes. A range of indicators are included in this dashboard to inform and support decision-making at a range of levels across Scotland. ",
                        "The latest data for each indicator can be quickly accessed using the summary page."),

                      h4("Covid Recovery"),

                      p("The Scottish Government’s Covid Recovery Strategy aims to reduce systemic inequalities and focuses on three outcomes: "),
                      p(tags$li("enhancing the wellbeing of children and young people;"),
                        tags$li("increasing financial security for low income households; and "),
                        tags$li("creating good, green jobs and fair work.")),

                      h4("Care and Wellbeing"),

                      p("The Scottish Government’s Care and Wellbeing Portfolio is the principle strategic reform vehicle for ",
                        "the major health and care reform programmes aimed at improving population health, ",
                        "addressing health inequalities and improving health and care system sustainability. ",
                        "It is informed by the policy objectives of the Marmot Review:"),

                      p(tags$li("giving every child the best start in life;"),
                        tags$li("enabling all to maximise their capabilities and have control over their lives;"),
                        tags$li("creating fair employment and good work for all;"),
                        tags$li("ensuring a healthy standard of living for all;"),
                        tags$li("creating and developing healthy and sustainable places and communities;"),
                        tags$li("Strengthening the role and impact of ill health prevention;"),
                        tags$li("Tackling discrimination, racism and their outcomes; and"),
                        tags$li("Pursuing environmental sustainability and health equity together."))

              )# tagList
            ), # conditionalPanel

            # Using the dashboard
            conditionalPanel(
              condition= 'input.home_select == "use"',
              tagList(h3("Using the dashboard")) #tagList
                      ), # condtionalPanel

            # News and future updates
            conditionalPanel(
              condition= 'input.home_select == "future"',
              tagList(h3("News and future updates")
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
