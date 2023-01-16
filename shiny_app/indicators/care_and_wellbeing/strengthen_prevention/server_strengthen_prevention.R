##############################################.
# HEALTHY LIFE EXPECTANCY----
##############################################.


##############################################.
# MENTAL WELLBEING OF ADULTS (16+)----
##############################################.


##############################################.
# HEALTHY WEIGHT ADULTS----
##############################################.


##############################################.
# HEALTH RISK BEHAVIOURS----
##############################################.


##############################################.
# PHYSICAL ACTIVITY----
##############################################.


##############################################.
# QUALITY OF CARE EXPERIENCE----
##############################################.


##############################################.
# JOURNEYS BY ACTIVE TRAVEL----
##############################################.


##############################################.
# WORK-RELATED ILL HEALTH----
##############################################.


##############################################.
# PREMATURE MORTALITY----
##############################################.



##############################################.
# ALL-CAUSE MORTALITY (15-44)----
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
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
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
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
##############################################.


##############################################.
# DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS ----
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
# DRUG RELATED DEATHS----
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
# ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.
output$alcohol_admissions_plot = renderPlotly({
  data_alc = alcohol_admissions %>% filter(sub_group_select_group_first==input$hb_alcohol_admissions) %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "Alcohol related admissions trend")})

##############################################.
# ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
##############################################.
output$alcohol_deaths_plot <- renderPlotly({

  plot <- alcohol_deaths %>%
    filter(sex == input$choose_sex_alcohol_deaths) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    make_line_chart_multi_lines(., x = .$year, y = .$indicator, colour = .$breakdown, y_axis_title = "Rate") %>%
    layout(yaxis = yaxis_proportion)

})

output$alcohol_deaths_data_table <- DT::renderDataTable({

  alcohol_deaths %>%
    select(c(year, breakdown, indicator, sex)) %>%
    mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
    rename(Year = "year",
           Sex = "sex",
           `Age Group` = "breakdown",
           Rate = "indicator") %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "alcohol_deaths",
                             geogtype = "none")
})

##############################################.
# HEALTHY BIRTHWEIGHT----
##############################################.
output$geography_healthy_birthweight = renderUI({
  birthweight_data = birthweight %>%
    filter(geography_type == input$geog_type_healthy_birthweight)

  selectizeInput("geography_healthy_birthweight", "2. Select a geography",
                 choices = unique(birthweight_data$geography))
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
#  SELF-ASSESSED HEALTH OF ADULTS (16+)----
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
#  LIMITING LONG-TERM CONDITIONS (16+)----
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
# ADMISSIONS FOR ASTHMA----
##############################################.


##############################################.
# SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
##############################################.


##############################################.
# VACCINATIONS UPTAKE----
##############################################.


##############################################.
# EXPERIENCE OF SOCIAL CARE RECIPIENTS----
##############################################.


##############################################.
# EXPERIENCE OF UNPAID CARERS----
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
