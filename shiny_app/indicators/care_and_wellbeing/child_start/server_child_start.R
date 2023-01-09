
##############################################.
# Infant mortality----
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
# Healthy birthweight babies----
##############################################.


output$geography_healthy_birthweight = renderUI({
  data = birthweight %>%
    filter(geography_type == input$geog_type_healthy_birthweight)
  
  selectizeInput("geography_healthy_birthweight", "2. Select a geography",
                 choices = unique(data$geography))
})

output$healthy_birthweight_stacked_chart = renderPlotly({
  birthweight %>%
    mutate(date = financial_year,
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age, levels = c("Small", "Appropriate", "Large", "Not Applicable"))) %>%
    filter(geography == input$geography_healthy_birthweight, geography_type == input$geog_type_healthy_birthweight) %>%
    stacked_bar_function(., .$birthweight_for_gestational_age)
})

output$healthy_birthweight_data = DT::renderDataTable({
  
  birthweight %>%
    mutate(proportion = indicator) %>%
    select(-c(pretty_date, indicator, value)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "birthweight",
                             geogtype = "none")
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

