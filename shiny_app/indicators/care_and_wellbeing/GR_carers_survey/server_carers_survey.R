##############################################.
# EXPERIENCE OF SOCIAL CARE RECIPIENTS ----
##############################################.

##############################################.
# EXPERIENCE OF UNPAID CARERS ----
##############################################.

output$experience_unpaid_carers_plot <- renderPlotly({

  experience_unpaid_carers %>%
    mutate(proportion = as.numeric(indicator)) %>%
    stacked_bar_function(., category_var = .$breakdown)


})

output$experience_unpaid_carers_table <- DT::renderDataTable({

  experience_unpaid_carers %>%
    select(c(date, breakdown, indicator)) %>%
    mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
    rename(Year = "date",
           Answer = "breakdown",
           Percentage = "indicator") %>%
    arrange(desc(Year)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "experience_unpaid_carers",
                             geogtype = "none")



})

