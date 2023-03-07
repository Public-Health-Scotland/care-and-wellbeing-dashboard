##############################################.
# POPULATION HEALTH TAB----
##############################################.

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
# Drug-related hospital stays----
##############################################.


output$drugstays = renderPlotly({

  data = drug_stays %>%
    filter(age_group == input$age_drugstays) %>%
    mutate(indicator = rate, date = financial_year)

  line_chart_function(data, "Rate of stays per 100,00")

})

output$drugstays_data = DT::renderDataTable({

  drug_stays %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "drugstays",
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
# Alcohol admissions----
##############################################.

output$alcohol_admissions_plot = renderPlotly({
  data_alc = alcohol_admissions %>% filter(sub_group_select_group_first==input$hb_alcohol_admissions) %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "Alcohol related admissions trend")})



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



