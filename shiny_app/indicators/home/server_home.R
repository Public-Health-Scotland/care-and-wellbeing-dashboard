
##### Render home UI #####

output$home_about <- renderUI({

  tagList(h3(tags$b("Care & Wellbeing Dashboard")),

          box(width = 12,
              status = "warning",
              fluidRow(column(1, style = 'margin-right: -15px',
                              p(icon("inbox", style = "color: #4B006E"))),
                       (column(11, style = 'margin-left: -15px',
                               "The Scottish Government and",
                               tags$a(href = "https://www.scotpho.org.uk/", "ScotPHO"),
                               "will be working together on the future development of the Care and Wellbeing dashboard.",
                               "The Care and Wellbeing dashboard will be integrated into the",
                               tags$a(href = "https://scotland.shinyapps.io/ScotPHO_profiles_tool/", "ScotPHO online profiles tool"),
                               "and further developed following user feedback. Please send any feedback to",
                               tags$a(href = "mailto:phs.scotpho@phs.scot?subject=Care%20and%20Wellbeing%20Feedback", "phs.scotpho@phs.scot."))))),
          br(),
          br(),

          p("The Care & Wellbeing dashboard is one source of data and intelligence to support the",
            "ambitions of the ",
            tags$a(href= "https://www.gov.scot/groups/care-and-wellbeing-portfolio-board/", "Care & Wellbeing Portfolio"),
            "to improve population health, address health inequalities and improve the health and care system."),
          p("Many of the influences on health outcomes lie outwith health and social care.",
            "Collective action across government, with health boards, local government partners and the wider",
            "public sector, is fundamental to improving population health and reducing health inequalities."),
          p("A range of indicators are included in this dashboard structured around the evidence-based",
            "Marmot framework which looks at the social determinants of health, the conditions in which",
            "people are born, grow, live, work and age which can lead to health inequalities.",
            "More information on the Marmot framework can be found in the 'further information' tab."),
          p("Explore the latest data below."),
          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_child_start", "Early years"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_child_start2", "Give every child the best start in life")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_control_lives", "Education"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_control_lives2", "Enable all children, young people and adults to maximise their capabilities and control their lives")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_fair_work", "Work"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_fair_work2", "Create fair employment and good work for all")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_healthy_standard", "Living standards"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_healthy_standard2", "Ensure a healthy standard of living for all (to be developed)")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_sustainable_communities", "Places"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_sustainable_communities2", "Create and develop healthy and sustainable places and communities (to be developed)")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_strengthen_prevention", "Impact of ill health prevention"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_strengthen_prevention2", "Strengthen the role and impact of ill health prevention")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_discrimination_racism", "Discrimination and racism"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_discrimination_racism2", "Tackling discrimination, racism and their outcomes (to be developed)")))),

          br(),


          fluidRow(
            column(4, tags$div(class = "special_button",
                               actionButton("jump_to_environmental_sustainability", "Sustainability and equity"))),
            column(8, tags$div(class= "invisible_button",
                               actionButton("jump_to_environmental_sustainability2", "Pursuing environmental sustainability and health equity together (to be developed)")))),


          br(),
          br()

  ) # tagList
})

##### Home navigation buttons #####

# Navigation buttons on home page

observeEvent(input$jump_to_child_start, {
  updateTabsetPanel(session, "intabset", selected = "child_start")})

observeEvent(input$jump_to_control_lives, {
  updateTabsetPanel(session, "intabset", selected = "control_lives")})

observeEvent(input$jump_to_fair_work, {
  updateTabsetPanel(session, "intabset", selected = "fair_work")})

observeEvent(input$jump_to_healthy_standard, {
  updateTabsetPanel(session, "intabset", selected = "healthy_standard")})

observeEvent(input$jump_to_sustainable_communities, {
  updateTabsetPanel(session, "intabset", selected = "sustainable_communities")})

observeEvent(input$jump_to_strengthen_prevention, {
  updateTabsetPanel(session, "intabset", selected = "strengthen_prevention")})

observeEvent(input$jump_to_discrimination_racism, {
  updateTabsetPanel(session, "intabset", selected = "discrimination_racism")})

observeEvent(input$jump_to_environmental_sustainability, {
  updateTabsetPanel(session, "intabset", selected = "environmental_sustainability")})


# Second lot of action links for full objective descriptions on home page

observeEvent(input$jump_to_child_start2, {
  updateTabsetPanel(session, "intabset", selected = "child_start")})

observeEvent(input$jump_to_control_lives2, {
  updateTabsetPanel(session, "intabset", selected = "control_lives")})

observeEvent(input$jump_to_fair_work2, {
  updateTabsetPanel(session, "intabset", selected = "fair_work")})

observeEvent(input$jump_to_healthy_standard2, {
  updateTabsetPanel(session, "intabset", selected = "healthy_standard")})

observeEvent(input$jump_to_sustainable_communities2, {
  updateTabsetPanel(session, "intabset", selected = "sustainable_communities")})

observeEvent(input$jump_to_strengthen_prevention2, {
  updateTabsetPanel(session, "intabset", selected = "strengthen_prevention")})

observeEvent(input$jump_to_discrimination_racism2, {
  updateTabsetPanel(session, "intabset", selected = "discrimination_racism")})

observeEvent(input$jump_to_environmental_sustainability2, {
  updateTabsetPanel(session, "intabset", selected = "environmental_sustainability")})



##### Render using the dashbord ui #####

output$home_dashboard <- renderUI({

  tagList(h3(tags$b("Using the dashboard")),
          p(tags$li("Click on tabs in the purple navigation bar at the top to view each section"),
            tags$img(src = "intro_images/nav_bar.png", height = 53,
                     alt ="Image of the a part of the navigation bar for reference")),
          p(tags$li("Click on 'At a glance' to view the most recently available statistics"),
            tags$img(src = "intro_images/at_a_glance_tab.png", height = 52,
                     alt ="Image of the 'At a glance' tab in the navigation bar")),
          p(tags$li("Click on 'Care and Wellbeing' to view the indicators in each objective in more detail"),
            tags$img(src = "intro_images/care_and_wellbeing_tab.png", height = 116,
                     alt ="Image of the 'Care and Wellbeing' tab in the navigation bar")),
          br(),

          p(tags$b("Within each indicator")),
          p(tags$li("Click on the toggles to change the visible sub-indicator"),
            tags$img(src = "intro_images/tab_toggles.png", height = 50,
                     alt ="Image of the tab toggle options used in the tabs. This image shows an example of the toggles
                                              in the 'Life expectancy' indicator")),
          p(tags$li("Click the 'background information and source' button for further information on the indicator and the data source"),
            tags$img(src = "intro_images/info_button.png", height = 45,
                     alt ="Image of the background information and source button")),
          p(tags$li("Select an appropriate breakdown if available using the drop down menus. This will change the data displayed in both the chart and the table."),
            tags$img(src = "intro_images/select_breakdown.png", height = 76,
                     alt ="Image of the dropdown menu used to select a data breakdown")),
          p(tags$li("Click the definition button for an explanation of a word or term used."),
            tags$img(src = "intro_images/definition_button.png", height = 42,
                     alt ="Image of the SIMD definition button")),
          br(),
          br(),

          p(tags$b("Interacting with the charts")),
          p(tags$li("Click the 'Plot description' button for a summary of the plot content"),
            tags$img(src = "intro_images/plot_description.png", height = 46,
                     alt ="Image of the plot description button")),
          p(tags$li("Click the 'Using the plot' button for a recap of the information in this section"),
            tags$img(src = "intro_images/using_the_plot.png", height = 40,
                     alt ="Image of the 'using the plot' button on the charts which when clicked,
                                              provides a recap of the 'interacting with the charts' section")),
          p(tags$li("Click the 'Map description' button for a summary of the map chart content"),
            tags$img(src = "intro_images/map_description.png", height = 40,
                     alt ="Image of the map description button")),
          p(tags$li("Click the 'Using the map' button for information on how to use the map chart"),
            tags$img(src = "intro_images/using_the_map.png", height = 40,
                     alt ="Image of the 'using the map' button on the charts")),
          p(tags$li("Click the 'What is a confidence interval?' button for an explanation of confidence intervals"),
            tags$img(src = "intro_images/ci_button.png", height = 43,
                     alt ="Image of the confidence interval button")),
          p(tags$li("Move the cursor over the data points in the charts to see the data values")),
          p(tags$li("Click the magnifying glass in the top right of the charts to enable zoom capabilities.
                                        Then zoom into the plot by holding down the cursor and dragging to select the region"),
            tags$img(src = "intro_images/zoom_graph.png", height = 40,
                     alt ="Image of the zoom button on the graphs")),
          p(tags$li("Click the pan button (four way arrows) in the top right of the charts to enable panning capabilites.
                                        Then move the chart around by holding down the cursor and dragging"),
            tags$img(src = "intro_images/pan_graph.png", height = 40,
                     alt ="Image of the pan button")),
          p(tags$li("Alter the x axis range by dragging the vertical white bars on the left and right of the bottom panel")),
          p(tags$li("Click the home button in the top right to reset the axes"),
            tags$img(src = "intro_images/home_graph.png", height = 40,
                     alt ="Image of the home button on the graphs used to reset the axes")),
          p(tags$li("Single click on legend variables to remove the corresponding trace")),
          p(tags$li("Double click on legend variables to isolate the corresponding trace")),
          p(tags$li("Double click on the legend to restore all traces")),
          p(tags$li("Click the camera icon in the top right to download the plot as a png file"),
            tags$img(src = "intro_images/camera.png", height = 40,
                     alt ="Image of the camera button on the graphs used to download the plot as a png file")),

          br(),

          p(tags$b("Interacting with the data tables")),
          p(tags$li("Click on the toggles to change the data displayed in the tables"),
            tags$img(src = "intro_images/data_toggles.png", height = 58,
                     alt ="Image of the data table toggle options. This image shows an example of the toggles in the 'Screening uptake' indicator")),
          p(tags$li("Data can be downloaded from the data table within each indicator. Click either the 'Download as CSV' or 'Download as Excel' button above
                                       the table depending on what format you require"),
            tags$img(src = "intro_images/download_data2.png", height = 49,
                     alt ="Image of the download data buttons")),

          br(),
          br(),
  ) # tagList
})


##### Render ui for news and future updates #####

output$home_news_updates <- renderUI({

  tagList(h3(tags$b("News and future updates")),
          p("The Scottish Government and", tags$a(href = "https://www.scotpho.org.uk/", "ScotPHO"),
            "will be working together on the future development of the Care and Wellbeing dashboard.",
            "The Care and Wellbeing dashboard will be integrated into the",
             tags$a(href = "https://scotland.shinyapps.io/ScotPHO_profiles_tool/", "ScotPHO online profiles tool"),
             "and further developed following user feedback."),

          p("Please send any feedback to", tags$a(href = "mailto:phs.scotpho@phs.scot?subject=Care%20and%20Wellbeing%20Feedback", "phs.scotpho@phs.scot.")),

          h3(tags$b("Recent updates on the 31st July 2023")),
          h4("Data updates"),
          p("The below summarises the indicators updated to include the most recent available data."),
          tags$ul(tags$b("Give Every Child the Best Start In Life"),
                  tags$ul(tags$li("Child social and physical development: 2021/22"),
                          tags$li("Infant mortality: May 2023"))
          ),
          tags$ul(tags$b("Enable All Children, Young People and Adults to Maximise Their Capabilities and Control Over Their Lives"),
                  tags$ul(tags$li("CAMHS waiting times: March 2023"))
          ),
          tags$ul(tags$b("Create Fair Employment and Good Work For All"),
                  tags$ul(tags$li("Economic Inactivity: 2022"),
                          tags$li("Employees on the living wage: 2022"),
                          tags$li("Gender pay gap: 2022"))
          ),
          tags$ul(tags$b("Strengthen the Role and Impact of Ill Health Prevention"),
                  tags$ul(tags$li("Alcohol-related hospital admissions: 2021/22"),
                          tags$li("Drug-related hospital admissions: 2021/22"),
                          tags$li("First ever hospital admission for heart attack: 2020/21"),
                          tags$li("Healthy birthweight: 2021/22"),
                          tags$li("Vaccinations (COVID & Influenza): June 2023 (Spring Vaccination Programme"))
          ),
          h4("Further breakdowns added"),
          p("The below summarises the indicators with additional breakdowns, including equality breakdowns, that are now available."),
          tags$ul(tags$b("Give Every Child the Best Start In Life"),
                  tags$ul(tags$li("Infant mortality"))
          ),
          tags$ul(tags$b("Strengthen the Role and Impact of Ill Health Prevention"),
                  tags$ul(tags$li("Admissions for asthma"),
                          tags$li("Alcohol-sepcific deaths"),
                          tags$li("Alcohol-related hospital admissions"),
                          tags$li("Drug-related hospital admissions"),
                          tags$li("First ever hospital admission for heart attack"),
                          tags$li("Healthy birthweight: SIMD breakdown for Scotland, Health board and council area level"),
                          tags$li("Life Expectancy: SIMD breakdown at Scotland level"),
                          tags$li("Limiting long-term conditions: SIMD and sex breakdown at Scotland level"),
                          tags$li("Premature mortlaity: Number now available and new chart for comparing geographies now included"),
                          tags$li("Self-assessed health of adults: SIMD and sex breakdown at Scotland level"))
          ),





  ) # tagList

})


##### Render ui for further information #####

output$home_further_info <- renderUI({

  tagList(h3(tags$b("Care & Wellbeing Portfolio")),
          p("The", tags$a(href= "https://www.gov.scot/groups/care-and-wellbeing-portfolio-board/", "Care & Wellbeing Portfolio (CWP)"),
            "is the principal strategic reform vehicle in the Scottish Government.  It brings oversight and coherence to the",
            "major health and care reform programmes designed to improve population health, address health inequalities",
            "and improve health and care system sustainability."),

          p("The underpinning framework of the Portfolio is the evidence-based Marmot model of factors – \"policy objectives\"",
            "that create health and reduce inequalities.  This globally recognised framework was first set out in",
            tags$a(href= "https://www.instituteofhealthequity.org/resources-reports/fair-society-healthy-lives-the-marmot-review", "Fair Society, Healthy Lives"),
            "in 2010, updated in a", tags$a(href = "https://www.health.org.uk/publications/reports/the-marmot-review-10-years-on", "10 year on report."),
            "These include good early years; good education; good work; good income; healthy places; tackling discrimination",
            "and racism; and good ill health prevention."),
          br(),


          h4("Other resources"),

          p("The Care & Wellbeing dashboard is one source of data and intelligence.",
            "A number of other sources of helpful information is also available:"),


          p(tags$li("The ", tags$b("Scottish Public Health Observatory (ScotPHO)"), "collaboration is led by Public Health Scotland, ",
                    "and includes the Glasgow Centre for Population Health, the MRC/CSO Social and Public Health Sciences Unit, ",
                    "National Records of Scotland and the Scottish Learning Disabilities Observatory. ",
                    "The ScotPHO profiles present a range of indicators to give an overview of health",
                    "and its wider determinants at a local level. More information can be found at: ",
                    tags$a(href="https://www.scotpho.org.uk/comparative-health/profiles/online-profiles-tool/", "Online Profiles Tool - ScotPHO"))),
          p(tags$li("The ",  tags$b("Improvement Service (IS)"),  "is the 'go-to' organisation for local government improvement in Scotland. ",
                    "It provides performance management and benchmarking products and services to help councils assess and improve",
                    "their own performance, and support decision-making in councils and community planning partnerships.",
                    "More information can be found at: ",
                    tags$a(href="https://www.improvementservice.org.uk/products-and-services/performance-management-and-benchmarking","Performance Management and Benchmarking | Improvement Service"))),
          p(tags$li("The ", tags$b("National Performance Framework (NPF)"), "provides a measure of national wellbeing and keeps track",
                    "of how Scotland is performing. It aims to reduce inequalities and gives equal importance to economic,",
                    "environmental and social progress. More information can be found at:",
                    tags$a(href= "https://nationalperformance.gov.scot/measuring-progress", "Measuring progress | National Performance Framework")))


  ) # tagList

})


##### Render ui for accessibility #####

# output$home_accessibility <- renderUI({
#
#
#   tagList(h3("Accessibility"),
#
#                   p("This website is run by ", tags$a(href="https://www.publichealthscotland.scot/",
#                                                       "Public Health Scotland", target="_blank"),
#                     ", Scotland's national organisation for public health. As a new organisation formed
#                        on 01 April 2020, Public Health Scotland is currently reviewing its web estate. Public
#                        Health Scotland is committed to making its website accessible, in accordance with
#                        the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility
#                        Regulations 2018. This accessibility statement applies to the dashboard that accompanies
#                        the HSMR quarterly publication."),
#                   p(tags$a(href="https://mcmw.abilitynet.org.uk/", "AbilityNet (external website)", target="_blank"),
#                     " has advice on making your device easier to use if you have a disability."),
#
#                   p(tags$b("Compliance status")),
#                   p("This site has not yet been evaluated against Web Content Accessibility Guidelines
#                        version 2.1 level AA standard. We are currently working towards an evaluation."),
#                   br(),
#                   p(tags$b("Accessible features")),
#                   p("We have taken the following steps to make this dashboard more accessible:"),
#                   p(tags$li("Colours have been chosen to meet colour contrast standards")),
#                   p(tags$li("Plot colours have been chosen to be colour blind friendly")),
#                   p(tags$li("The dashboard can be navigated using a keyboard")),
#                   p(tags$li("The content is still readable at 400% zoom")),
#                   p(tags$li("Alternative descriptions of plot contents have been provided via 'Plot description' buttons")),
#                   p(tags$li("Data tables have been provided alongside plots where possible")),
#                   p(tags$li("Hover content has been replaced with clickable content where possible")),
#                   br(),
#                   p(tags$b("Reporting any accessibility problems with this website")),
#                   p("If you wish to contact us about any accessibility issues you encounter on this
#                        site, please email "), #, tags$a(href="mailto:phs.covid19data&analytics@phs.scot", "phs.covid19data&analytics@phs.scot", ".")),
#
#                   p(tags$b("Enforcement procedure")),
#                   p("The Equality and Human Rights Commission (EHRC) is responsible for enforcing the
#                        Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations
#                        2018 (the ‘accessibility regulations’). If you’re not happy with how we respond to your complaint,",
#                     tags$a(href="https://www.equalityadvisoryservice.com/", "contact the Equality Advisory and Support Service (EASS) (external website).",
#                            target = "_blank")),
#
#                   p(tags$b("Preparation of this accessibility statement")),
#                   p("This statement was prepared on 13 January 2023. It was last reviewed on 13 January 2023.")
#   ) # tagList
# })
