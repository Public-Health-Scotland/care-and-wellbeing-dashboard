

##############################################.
# CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
##############################################.

# Show geography names dependent on geography type input

observeEvent(input$child_development_cw_geog_type,
             {

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
                                tags$li("Since the data began for Scotland there has been a general downwards trend before levelling out.")


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

  data = preschool %>% filter(geography == input$child_development_cw_geog_name)


  if(input$child_development_cw_geog_type == "Health Board") {
    data_baseline = preschool %>%
      filter(geography_type=="Scotland")

    p = make_child_development_cw_plot(data, data_baseline, TRUE,
                                       input$child_development_cw_geog_name,
                                       baseline_name = "Scotland")

  } else if (input$child_development_cw_geog_type == "Council Area") {

    hb <- data %>%
      slice(1) %>%
      .$hb2019name

    data_baseline = preschool %>%
      filter(geography_type == "Health Board",
             `hb2019name` %in% hb)

    p = make_child_development_cw_plot(data, data_baseline, TRUE,
                                       input$child_development_cw_geog_name,
                                       hb)
  } else {

    title = "Proportion of health visitor reviews where any form of developmental concern was raised in Scotland"

    p = make_child_development_cw_plot(data, title = title)
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
})

observeEvent(input$child_development_cw_geog_name, {

  # geog_type <- ifelse(input$child_development_cw_geog_table == "Scotland",
  #                     "in Scotland",
  #                     paste0("by ", input$child_development_cw_geog_table))


  output$child_development_cw_table_title <- renderUI({
    h3(glue("Data table: Proportion of health visitor reviews where any ",
         "form of developmental concern was raised in ", input$child_development_cw_geog_name))})

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
              content = tags$ul(tags$li("This is a plot for the trend in the rate of infant deaths per 1,000 live births in Scotland.."),
                                tags$li("The x axis is the month from July 2017 to March 2022."),
                                tags$li("The y axis is the rate of deaths per 1,000 live births."),
                                tags$li("The solid line represents the trend for Scotland"),
                                tags$li("Since the data began for Scotland the trend has fluctuated, however, an upward trend is evident from January 2021 onwards.")

              )
)

yaxis_inf_deaths <- list(title = "Rate per 1,000 live births",
                         rangemode="tozero",
                         fixedrange=TRUE,
                         tickfont = list(size=14),
                         titlefont = list(size=18),
                         showline = TRUE)

output$infant_mortality_cw_plot = renderPlotly({
  inf_deaths %>%
    plot_ly(x=~date,
            y=~rate,
            type = "scatter",
            mode = "lines",
            line = list(color="#655E9D"),
            # marker = list(color="#655E9D"),
            name = "Rate",
            #text = paste0(format(inf_deaths$date, "%B %Y"), "<br>",
            #              "Rate per 1,000 live births: ",
            #              round_half_up(inf_deaths$rate, 1),"<br>",
            #              "Number of infant deaths: ", inf_deaths$count, "<br>"),
            #hoverinfo = "text",
            hovertemplate = ~glue("{round_half_up(inf_deaths$rate,1)}")) %>%
    layout(yaxis = yaxis_inf_deaths,
           xaxis = xaxis_month,
           hovermode = "x unified",
           margin = list(t = 90, b = 40),
           title = list(text = str_wrap("Monthly rate of infant deaths per 1,000 live births in Scotland", width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
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

