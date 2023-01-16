

##############################################.
# CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
##############################################.

# Show geography names dependent on geography type input

output$geog_child_development_ui = renderUI({

  areas_summary = geog_lookup %>%
    filter(geography_type == input$geog_type_child_development)

  selectizeInput("geog_name_child_development", label = "2. Select geography",
                 choices = unique(areas_summary$geography),
                 selected = "")
})

output$child_development_chart_line2 = renderPlotly({
  data = preschool %>%
    filter(geography %in% c("Scotland", input$HB_input, input$LA_input))

  child_development_plot_line2(data)

})


output$child_development_chart_line = renderPlotly({

  data = geog_all_filter_table(preschool,
                               input$geog_type_child_development,
                               input$geog_name_child_development)


  if(input$geog_type_child_development == "Health Board") {
    data_baseline = preschool %>%
      filter(geography_type=="Scotland")

    p = child_development_plot_line(data, data_baseline, TRUE,
                            input$geog_name_child_development,
                            "Scotland")

  } else if (input$geog_type_child_development == "Council Area") {
    hb = data %>%
      slice(1) %>%
      .$hb2019name

    data_baseline = preschool %>%
      filter(hb2019name == hb &
               geography_type == "Health Board")

    p = child_development_plot_line(data, data_baseline, TRUE,
                            input$geog_name_child_development,
                            hb)
  } else {
    p = child_development_plot_line(data)
  }

  return(p)

})

output$child_development_data = DT::renderDataTable({

  child_development_out = preschool %>%
    filter(geography_type == input$child_development_radiobuttons) %>%
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

output$infant_mortality_graph_2 = renderPlotly({
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

output$infant_data_2 = DT::renderDataTable({

  inf_deaths_out = inf_deaths %>%
    select(date, geography_name, "number_of_infant_deaths" = count,
           number_of_live_births = denominator, "rate per 1,000 live births" = rate) %>%
    datatable_style_download(.,
                             data_name = "infant",
                             geogtype = "scotland")
})





##############################################.
# CHILDHOOD RISK OF OBESITY ----
##############################################.

output$childhood_obesity_plot <- renderPlotly({

  plot <- childhood_obesity %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    line_chart_function(., y_title = "Percentage")%>%
    layout(yaxis = yaxis_proportion)

})

output$childhood_obesity_table <- DT::renderDataTable({

  childhood_obesity %>%
    select(c(date, indicator)) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    rename(Percentage = "indicator",
           Year = "date") %>%
    arrange(desc(Year)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "children_at_risk_of_obesity",
                             geogtype = "none")



})

