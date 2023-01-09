##############################################.
# ADULT SELF ASSESSED HEALTH ----
##############################################.

output$adult_self_assessed_health_plot <- renderPlotly({

  plot <- adult_self_assessed_health %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage")%>%
    layout(yaxis = yaxis_proportion)

})



output$adult_self_assessed_health_table <- DT::renderDataTable({

  adult_self_assessed_health %>%
    select(c(Year, Categories, indicator)) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    rename(Percentage = "indicator") %>%
    arrange(desc(Year)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "adult_self_assessed_health",
                             geogtype = "none")



})


##############################################.
# ADULTS LIVING WITH A LONG TERM CONDITION ----
##############################################.

output$adult_long_term_condition_plot <- renderPlotly({

  plot <- adult_living_limiting_long_term_condition %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage")%>%
    layout(yaxis = yaxis_proportion)

})



output$adult_long_term_condition_table <- DT::renderDataTable({

  adult_living_limiting_long_term_condition %>%
    select(c(Year, Categories, indicator)) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    rename(Percentage = "indicator") %>%
    arrange(desc(Year)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "adult_living_limiting_long_term_condition",
                             geogtype = "none")



})

##############################################.
# SCREENING UPTAKE ----
##############################################.

##############################################.
# VACCINATIONS ----
##############################################.
