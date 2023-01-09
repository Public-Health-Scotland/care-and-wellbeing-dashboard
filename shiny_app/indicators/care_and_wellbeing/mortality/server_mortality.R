##############################################.
# All-cause mortality----
##############################################.

output$mortality_input_ui = renderUI({

  areas = all_cause_mortality %>%
    filter(geography_type == input$geog_type_mortality)

  selectizeInput("geog_name_mortality",
                 "2. Select geography",
                 choices = unique(areas$geography))

})


output$mortality_line_chart = renderPlotly({

  data = all_cause_mortality %>%
    filter(geography_type == input$geog_type_mortality,
           geography == input$geog_name_mortality,
           indicator_age == "15 to 44") %>%
    group_by(year) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000,
           date = year)

  if (input$rate_number_mortality == "Rate") {
    data %<>%
      mutate(indicator = rate)

    indicator_y = "Rate of deaths per 100,000 population"
  } else if (input$rate_number_mortality == "Number") {
    data %<>%
      mutate(indicator = deaths)

    indicator_y = "Number of deaths"
  }


  line_chart_function(data, indicator_y)


})


output$mortality_data = DT::renderDataTable(

  all_cause_mortality  %>%
    select(-pop) %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "all_cause_mortality",
                             geogtype = "none")


)

##############################################.
# CHD Deaths----
##############################################.

output$chd_input_ui = renderUI({


  areas = chd_deaths %>%
    filter(geography_type == input$geog_type_chd)

  selectizeInput("geog_name_chd",
                 "2. Select geography",
                 choices = unique(areas$geography))

})


output$chd_CI_chart = renderPlotly({
  data = chd_deaths %>%
    filter(geography_type == input$geog_type_chd,
           geography == input$geog_name_chd) %>%
    rename(date = year) %>%
    confidence_line_function(., "Age-sex standardised rate of deaths")
})


output$chd_data = DT::renderDataTable({

  chd_deaths %>%
    select(area_name, year, period, measure, lower_confidence_interval,
           upper_confidence_interval, definition) %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "chd_deaths",
                             geogtype = "none")
})

##############################################.
# Drug-related deaths----
##############################################.

output$geography_drug_deaths = renderUI({

  data = drug_related_deaths %>%
    filter(geography_type == input$geog_type_drug_deaths)

  selectizeInput("geography_drug_deaths", "2. Select a geography",
                 choices = unique(data$geography))
})

output$drug_deaths_chart = renderPlotly({

  if (input$rate_number_drug_deaths == "Rate") {
    drug_related_deaths %>%
      mutate(date = year) %>%
      filter(geography_type == input$geog_type_drug_deaths,
             geography == input$geography_drug_deaths) %>%
      confidence_line_function(., "Age standardised rate of deaths")
  } else if (input$rate_number_drug_deaths == "Number") {
    drug_related_deaths %>%
      mutate(date = year, indicator = number) %>%
      filter(geography_type == input$geog_type_drug_deaths,
             geography == input$geography_drug_deaths) %>%
      line_chart_function(., "Number of deaths")
  }
})

output$drug_deaths_data = DT::renderDataTable({

  drug_related_deaths %>%
    select(-c(pretty_date, indicator, value)) %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "drug_related_deaths",
                             geogtype = "none")
})

