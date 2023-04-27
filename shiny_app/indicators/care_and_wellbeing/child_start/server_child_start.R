

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

output$child_development_cw_plot_2 = renderPlotly({
  data = preschool %>%
    filter(geography %in% c("Scotland", input$child_development_cw_healthboard, input$child_development_cw_local_LA))

  make_child_development_cw_plot_2(data)

})


output$child_development_cw_plot = renderPlotly({

  data = geog_all_filter_table(preschool,
                               input$child_development_cw_geog_type,
                               input$child_development_cw_geog_name)


  if(input$child_development_cw_geog_type == "Health Board") {
    data_baseline = preschool %>%
      filter(geography_type=="Scotland")

    p = make_child_development_cw_plot(data, data_baseline, TRUE,
                            input$child_development_cw_geog_name,
                            "Scotland")

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
    p = make_child_development_cw_plot(data)
  }

  return(p)

})

output$child_development_cw_data = DT::renderDataTable({

  child_development_out = preschool %>%
    filter(geography_type == input$child_development_cw_geog_table) %>%
    select(financial_year, geography, number_of_reviews,
           concern_any, proportion = prop_concern_any)
  datatable_style_download(child_development_out,
                           datetype = "financial_year",
                           data_name = "preschool",
                           geogtype = "council_area")
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
            mode = "lines+markers",
            line = list(color="#655E9D"),
            marker = list(color="#655E9D"),
            text = paste0(format(inf_deaths$date, "%B %Y"), "<br>",
                          "Rate per 1,000 live births: ",
                          round_half_up(inf_deaths$rate, 1),"<br>",
                          "Number of infant deaths: ", inf_deaths$count, "<br>"),
            hoverinfo = "text") %>%
    layout(yaxis = yaxis_inf_deaths,
           xaxis = xaxis_month) %>%
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

output$child_obesity_plot <- renderPlotly({

  plot <- childhood_obesity %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    line_chart_function(., y_title = "Percentage")%>%
    layout(yaxis = yaxis_proportion)

})

childhood_obesity %>%
  select(c(date, indicator)) %>%
  mutate(indicator = round(as.integer(indicator), 1)) %>%
  rename("Percentage of children (%)" = "indicator",
         Year = "date") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "children_at_risk_of_obesity",
                     filename = "children_at_risk_of_obesity")

