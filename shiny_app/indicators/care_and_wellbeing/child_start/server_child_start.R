

##############################################.
# CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
##############################################.

# Show geography names dependent on geography type input
# 


observeEvent(input$child_development_cw_breakdowns, {

  if(input$child_development_cw_breakdowns == "Ethnicity breakdown") {

       updateSelectizeInput(session,
                          "child_development_cw_geog_type", label = "Step 1. Select national or local geography level",
                          choices = unique(preschool_ethnicity$geography_type))
    
} else if (input$child_development_cw_breakdowns == "Yearly total") {
  
  updateSelectizeInput(session,
                       "child_development_cw_geog_type", label = "Step 1. Select national or local geography level",
                       choices = c("Scotland", "Health Board", "Council Area"))

} else { 
  
  }

})



observeEvent(input$child_development_cw_geog_type, {
  
  areas_summary <- preschool %>%
    filter(geography_type == input$child_development_cw_geog_type)
  
  updateSelectizeInput(session,
                       "child_development_cw_geog_name", label = "Step 2. Select national or local geography area",
                       choices = unique(areas_summary$geography))
})



altTextServer("child_development_cw_alt",
              title = "Child social and physical development plot",
              content = tags$ul(tags$li("This is a plot for the trend in the proportion of health visitor reviews where any form of developmental concern was raised."),
                                tags$li("The x axis is the financial year from 2013/14 to 2021/22."),
                                tags$li("The y axis is the proportion of reviews where concern has been raised."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland."),
                                tags$li("If Scotland is selected then there the plot will show one purple line representing the data for Scotland.",
                                        "If a health board is selected then the purple line on the plot will represent the health board chosen and the magenta line ",
                                        "will represent Scotland as a baseline. If a council area is selected then the purple line on the plot will represent",
                                        "the council area chosen and the magenta line will represent the health board the council area is located in as a baseline."),
                                tags$li("There is an additional drop down above the chart which allows you to select a sex, SIMD quintile or",
                                        "ethnicity breakdown. The default is the yearly total, or no breakdown, and the description above applies."),
                                tags$li("If a sex breakdown is selected, the plot will show one purple line for females and one green line for males."),
                                tags$li("If a SIMD breakdown is selected, the plot will show a trace for each of the five SIMD quintiles,",
                                        "from most deprived to least deprived."),
                                tags$li("If an ethnicity breakdown is selected, the plot will show a trace for each of the following ethnicities:",
                                        "black, asian, mixed, white, white scottish, white british, pole, and not known")
                                # tags$li("Since the data began for Scotland there has been a general downwards trend before levelling out.")


              )
)
#
# output$child_development_cw_plot_2 = renderPlotly({
#   data = preschool %>%
#     filter(geography %in% c("Scotland", input$child_development_cw_healthboard, input$child_development_cw_local_LA))
#
#   make_child_development_cw_plot_2(data)
#
# })


output$child_development_cw_plot = renderPlotly({


  ### Yearly total 
  if(input$child_development_cw_breakdowns == "Yearly total") {
  
      data <- preschool %>% filter(geography == input$child_development_cw_geog_name)
      title <- glue("Proportion of health visitor reviews where any form of developmental concern was raised in {input$child_development_cw_geog_name}")
      
      # By health board 
      if(input$child_development_cw_geog_type == "Health Board") {
        data_baseline = preschool %>%
          filter(geography_type=="Scotland")
        
        p = make_child_development_cw_plot(data, data_baseline, baseline = TRUE,
                                           geog_name = input$child_development_cw_geog_name,
                                           baseline_name = "Scotland", title = title)
        
        # By council area
      } else if (input$child_development_cw_geog_type == "Council Area") {
        
        hb <- data %>%
          slice(1) %>%
          .$hb2019name
        
        data_baseline = preschool %>%
          filter(geography_type == "Health Board",
                 `hb2019name` %in% hb)
        
        p = make_child_development_cw_plot(data, data_baseline, baseline = TRUE,
                                           geog_name = input$child_development_cw_geog_name,
                                           baseline_name = hb, title = title)
        # Scotland level
      } else {
        
        p = make_child_development_cw_plot(data, title = title)
        
      }
  
  ### Sex breakdown
  } else if(input$child_development_cw_breakdowns == "Sex breakdown") {

      data <- preschool_sex %>% filter(geography == input$child_development_cw_geog_name)
      title <- glue("Proportion of health visitor reviews where any form of developmental concern was raised in {input$child_development_cw_geog_name} by sex")
      p = make_child_development_cw_plot_sex(data, title = title)
        
        
  ### SIMD breakdown
  } else if(input$child_development_cw_breakdowns == "SIMD breakdown") {
    
      data <- preschool_simd %>% filter(geography == input$child_development_cw_geog_name)
      title <- glue("Proportion of health visitor reviews where any form of developmental concern was raised in {input$child_development_cw_geog_name} by SIMD")
      p = make_child_development_cw_plot_simd(data, title = title)
      

  ### Ethnicity breakdown
  } else if(input$child_development_cw_breakdowns == "Ethnicity breakdown") {
    
      data <- preschool_ethnicity
      title <- glue("Proportion of health visitor reviews where any form of developmental concern was raised in {input$child_development_cw_geog_name} by ethnicity")
      p = make_child_development_cw_plot_ethnicity(data, title = title)
      
      
  }
  
  return(p)
  
})




# output$child_development_cw_data = DT::renderDataTable({
#
#   child_development_out = preschool %>%
#     filter(geography_type == input$child_development_cw_geog_table) %>%
#     select(financial_year, geography, number_of_reviews,
#            concern_any, proportion = prop_concern_any)
#   datatable_style_download(child_development_out,
#                            datetype = "financial_year",
#                            data_name = "preschool",
#                            geogtype = "council_area")
# })




observeEvent(input$child_development_cw_geog_name, {
  observeEvent(input$child_development_cw_breakdowns, {
    
    if(input$child_development_cw_breakdowns == "Yearly total") {
      
      title <- glue("Data table: Proportion of health visitor reviews where any form of
                       developmental concern was raised in {input$child_development_cw_geog_name}")
      
      data_unfiltered <- preschool %>%
        select(financial_year, geography_type, geography, number_of_reviews,
               concern_any, proportion = prop_concern_any) %>%
        rename("Total number of reviews" = "number_of_reviews",
               "Number of reviews with any concern" = "concern_any",
               "Proportion of total reviews with any concern" = "proportion")
      
      data_filtered <- data_unfiltered %>%
        filter(geography == input$child_development_cw_geog_name) %>%
        mutate(financial_year = factor(financial_year),
               geography = factor(geography))
      
      dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                         id = "child_development_cw", filename = "child_development",
                         add_separator_cols = c(4,5),
                         add_percentage_cols = c(6))
      
      
    } else if(input$child_development_cw_breakdowns == "SIMD breakdown"){
      
      title <- glue("Data table: Proportion of health visitor reviews where any form of
                     developmental concern was raised in {input$child_development_cw_geog_name} by SIMD")
      
      data_unfiltered <- preschool_simd %>%
        select(financial_year, simd_quintile, geography_type, geography, number_of_reviews,
               concern_any, proportion = prop_concern_any) %>%
        rename("SIMD" = "simd_quintile",
               "Total number of reviews" = "number_of_reviews",
               "Number of reviews with any concern" = "concern_any",
               "Proportion of total reviews with any concern" = "proportion")
      
      data_filtered <- data_unfiltered %>%
        filter(geography == input$child_development_cw_geog_name) %>%
        mutate(financial_year = factor(financial_year),
               geography = factor(geography))
      
      dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                         id = "child_development_cw", filename = "child_development_simd",
                         add_separator_cols = c(5,6),
                         add_percentage_cols = c(7))
      
      
    } else if(input$child_development_cw_breakdowns == "Sex breakdown"){
      
      title <- glue("Data table: Proportion of health visitor reviews where any form of
                     developmental concern was raised in {input$child_development_cw_geog_name} by sex")
      
      data_unfiltered <- preschool_sex %>%
        select(financial_year, sex, geography_type, geography, number_of_reviews,
               concern_any, proportion = prop_concern_any) %>%
        rename("Total number of reviews" = "number_of_reviews",
               "Number of reviews with any concern" = "concern_any",
               "Proportion of total reviews with any concern" = "proportion")
      
      data_filtered <- data_unfiltered %>%
        filter(geography == input$child_development_cw_geog_name) %>%
        mutate(financial_year = factor(financial_year),
               geography = factor(geography))
      
      dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                         id = "child_development_cw", filename = "child_development_sex",
                         add_separator_cols = c(5,6),
                         add_percentage_cols = c(7))
      
      
    } else if(input$child_development_cw_breakdowns == "Ethnicity breakdown"){
      
      title <- glue("Data table: Proportion of health visitor reviews where any form of
                     developmental concern was raised in Scotland by ethnicity")
      
      data_unfiltered <- preschool_ethnicity %>%
        select(financial_year, ethnicity, geography_type, geography, number_of_reviews,
               concern_any, proportion = prop_concern_any) %>%
        rename("Total number of reviews" = "number_of_reviews",
               "Number of reviews with any concern" = "concern_any",
               "Proportion of total reviews with any concern" = "proportion")
      
      data_filtered <- data_unfiltered %>%
        mutate(financial_year = factor(financial_year),
               geography = factor(geography))
      
      dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                         id = "child_development_cw", filename = "child_development_ethnicity",
                         add_separator_cols = c(5,6),
                         add_percentage_cols = c(7))
      
      
    }
    
    output$child_development_cw_table_title <- renderUI(h3(title))
    
  })
  
})




##############################################.
# CHILD WELLBEING AND HAPPINESS----
##############################################.


##############################################.
# PERINATAL MORTALITY RATE----
##############################################.


##############################################.
# CHILD MATERIAL DEPRIVATION----
##############################################.


##############################################.
# PHYSICAL ACTIVITY OF CHILDREN----
##############################################.


##############################################.
# INFANT MORTALITY----
##############################################.

altTextServer("infant_mortality_cw_alt",
              title = "Child social and physical development plot",
              content = tags$ul(tags$li("This is a plot for the trend in the rate of infant deaths per 1,000 live births in Scotland."),
                                tags$li("The x axis is the month from July 2017 to May 2023."),
                                tags$li("The y axis is the rate of deaths per 1,000 live births."),
                                tags$li("The solid line represents the trend for Scotland")#,
                                # tags$li("Since the data began for Scotland the trend has fluctuated, however, an upward trend is evident from January 2021 onwards.")

              )
)


output$infant_mortality_cw_plot = renderPlotly({


  title <-"Infant mortality in Scotland"

  data =inf_deaths
  if (input$inf_morality_rate_number== "Rate") {
    data %<>%
      mutate(indicator = rate)
    indicator_y = "Rate of infant deaths <br>per 1,000 live births"
  }
  else if (input$inf_morality_rate_number== "Number") {
    data %<>%
      mutate(indicator = count)

    indicator_y = "Number of infant deaths"
  }

  line_chart_function(data, indicator_y,
                      title = title,
                      label = ifelse(input$inf_morality_rate_number== "Rate", "Rate of death", "Number of deaths")) %>%
    layout(yaxis=list(tickformat=","),
           xaxis = list(tickangle = -30))
})


inf_deaths %>%
  arrange(desc(date)) %>%
  select(date, count, denominator, rate) %>%
  mutate(date = format(date, "%B %Y")) %>%
  rename("Month" = "date",
         "Number of infant deaths" = "count",
         "Number of live births" = "denominator",
         "Rate of infant deaths per 1,000 live births" = "rate") %>%
  dataDownloadServer(id = "infant_mortality_cw", filename = "infant_mortality",
                     add_separator_cols = c(2,3),
                     add_separator_cols_2dp = c(4))





##############################################.
# CHILDHOOD RISK OF OBESITY ----
##############################################.

altTextServer("child_obesity_alt",
              title = "Child social and physical development plot",
              content = tags$ul(tags$li("This is a plot for the trend in the percentage of children aged 2 to 15 at risk of obesity in Scotland."),
                                tags$li("The x axis is the survey year from 1998 to 2021."),
                                tags$li("The y axis is the percentage of children aged 2 to 15 at risk of obesity."),
                                tags$li("The solid purple line is the percentage of children at risk of obesity."),
                                tags$li("The proportion of children at risk of obesity has remained relatively constant between 1998 and 2021. However, 2021 recorded the highest proportion of children at risk of obesity at 18%, a 5% increase on 2017 figures (13%).")

              )
)

output$child_obesity_plot <- renderPlotly({

  title <- "Children (ages 2-15 years) at risk of obesity in Scotland over time"

  plot <- childhood_obesity %>%
    filter(!(date %in%  c("2003", "1998"))) %>%
    mutate(indicator = round_half_up(as.numeric(indicator), 2)) %>%
    line_chart_function(., y_title = "Percentage (%)", title = title, label = "Percentage")%>%
    # layout(yaxis = yaxis_proportion_30, xaxis = xaxis_survey_year)
    layout(yaxis = list(rangemode="tozero",
                        title = "Percentage (%)",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        # range=c(10,20),
                        showline = FALSE,
                        ticksuffix = "%"
    ))


})

childhood_obesity %>%
  select(c(date, indicator)) %>%
  filter(!(date %in%  c("2003", "1998"))) %>%
  mutate(indicator = round_half_up(as.numeric(indicator), 2)) %>%
  rename("Percentage of children (%)" = "indicator",
         Year = "date") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "children_at_risk_of_obesity",
                     filename = "children_at_risk_of_obesity",
                     add_percentage_cols = c(2))

