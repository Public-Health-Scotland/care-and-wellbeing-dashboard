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

observeEvent(input$all_cause_mortality_geog_type,
             {
               areas <- all_cause_mortality %>%
                 filter(geography_type == input$all_cause_mortality_geog_type)

               updateSelectizeInput(session,
                                    "all_cause_mortality_geog_name",
                                    "2. Select geography",
                                    choices = unique(areas$geography))
             })


output$all_cause_mortality_plot = renderPlotly({

  data = all_cause_mortality %>%
    filter(geography_type == input$all_cause_mortality_geog_type,
           geography == input$all_cause_mortality_geog_name,
           indicator_age == "15 to 44") %>%
    group_by(year) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000,
           date = year)

  if (input$all_cause_mortality_rate_number == "Rate") {
    data %<>%
      mutate(indicator = rate)

    indicator_y = "Rate of deaths per 100,000 population"
  } else if (input$all_cause_mortality_rate_number == "Number") {
    data %<>%
      mutate(indicator = deaths)

    indicator_y = "Number of deaths"
  }


  line_chart_function(data, indicator_y)


})


output$all_cause_mortality_table = DT::renderDataTable(

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

observeEvent(input$chd_deaths_geog_type,
             {

               areas <- chd_deaths %>%
                 filter(geography_type == input$chd_deaths_geog_type)

               updateSelectizeInput(session,
                                    "chd_deaths_geog_name",
                                    "2. Select geography",
                                    choices = unique(areas$geography))
             })


output$chd_deaths_plot = renderPlotly({
  data = chd_deaths %>%
    filter(geography_type == input$chd_deaths_geog_type,
           geography == input$chd_deaths_geog_name) %>%
    rename(date = year) %>%
    confidence_line_function(., "Age-sex standardised rate of deaths")
})


output$chd_deaths_table = DT::renderDataTable({

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

output$hospital_admission_heart_attack_plot <- renderPlotly({

  p <- heart_attack %>%
    line_chart_function(y_title = "Total")

})

output$hopsital_admission_heart_attack_table <- DT::renderDataTable({

  heart_attack %>%
    select(date, total_admissions, rate_per_100_000_easr, geography) %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "heartattack",
                             geogtype = "none")

})


##############################################.
# DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS ----
##############################################.

output$drug_admissions_plot = renderPlotly({

  data = drug_stays %>%
    filter(age_group == input$drug_admissions_age) %>%
    mutate(indicator = rate, date = financial_year)

  line_chart_function(data, "Rate of stays per 100,00")

})

output$drug_admissions_table = DT::renderDataTable({

  drug_stays %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "drugstays",
                             geogtype = "none")
})


##############################################.
# DRUG RELATED DEATHS----
##############################################.

observeEvent(input$drug_deaths_geog_type,
             {

               data <- drug_related_deaths %>%
                 filter(geography_type == input$drug_deaths_geog_type)

               updateSelectizeInput(session,
                                    "drug_deaths_geog_name", "2. Select a geography",
                                    choices = unique(data$geography))
             })

output$drug_deaths_plot = renderPlotly({

  if (input$drug_deaths_rate_number == "Rate") {
    drug_related_deaths %>%
      mutate(date = year) %>%
      filter(geography_type == input$drug_deaths_geog_type,
             geography == input$drug_deaths_geog_name) %>%
      confidence_line_function(., "Age standardised rate of deaths")
  } else if (input$drug_deaths_rate_number == "Number") {
    drug_related_deaths %>%
      mutate(date = year, indicator = number) %>%
      filter(geography_type == input$drug_deaths_geog_type,
             geography == input$drug_deaths_geog_name) %>%
      line_chart_function(., "Number of deaths")
  }
})

output$drug_deaths_table = DT::renderDataTable({

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

  data_alc = alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(sub_group_select_group_first == input$alcohol_admissions_geog_name,
           condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "Alcohol related admissions trend")})

##############################################.
# ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
##############################################.
output$alcohol_deaths_plot <- renderPlotly({

  plot <- alcohol_deaths %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    make_line_chart_multi_lines(., x = .$year, y = .$indicator, colour = .$breakdown, y_axis_title = "Rate") %>%
    layout(yaxis = yaxis_proportion)

})

output$alcohol_deaths_table <- DT::renderDataTable({

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
observeEvent(input$healthy_birthweight_geog_type,
             {

               birthweight_data <- birthweight %>%
                 filter(geography_type == input$healthy_birthweight_geog_type)

               updateSelectizeInput(session,
                                    "healthy_birthweight_geog_name", "2. Select a geography",
                                    choices = unique(birthweight_data$geography))
             })

output$healthy_birthweight_plot = renderPlotly({

  birthweight %>%
    mutate(date = financial_year,
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age, levels = c("Small", "Appropriate", "Large", "Not Applicable"))) %>%
    filter(geography == input$healthy_birthweight_geog_name, geography_type == input$healthy_birthweight_geog_type) %>%
    stacked_bar_function(., .$birthweight_for_gestational_age)
})

output$healthy_birthweight_table = DT::renderDataTable({

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
# observeEvent(input$asthma_admissions_breakdowns,
#
#         if(input$asthma_admissions_breakdowns == "Age and sex breakdown"){
#
#           output$asthma_admissions_years_ui <- renderUI(
#
#             pickerInput("asthma_admissions_years",
#                         "Year breakdown",
#                         choices = unique(asthma_admissions$Date))
#             )
#         }
# )


output$asthma_admissions_plot <- renderPlotly({

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    plot <- asthma_admissions %>%
      filter(Sex == "All Sexes", Ages == "All Ages", geography_type == "All") %>%
      mutate(indicator = round(as.integer(indicator), 1),
             date = Date) %>%
      line_chart_function(., y_title = "Total number of admissions") %>%
      layout(yaxis = yaxis_number)

  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    plot <- asthma_admissions %>%
      filter(Sex == "All Sexes", geography_type == "All") %>%
      filter(!(Ages %in% c("All Ages", "65+", "75+", "85+", "90+", "<18"))) %>%
      mutate(indicator = round(as.integer(indicator), 1),
             date = Date) %>%
      make_line_chart_multi_lines(x= .$Date, y = .$indicator, colour = .$Ages, y_axis_title = "Total number of admissions")

  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    plot <- asthma_admissions %>%
      filter(Ages == "All Ages", geography_type == "All") %>%
      mutate(indicator = round(as.integer(indicator), 1),
             date = Date) %>%
      make_line_chart_multi_lines(x= .$Date, y = .$indicator, colour = .$Sex, y_axis_title = "Total number of admissions")

  # } else if(input$asthma_admissions_breakdowns == "Age and sex breakdown"){
  #
  #   plot <- asthma_admissions %>%
  #     filter(Sex != "All Sexes", geography_type == "All", Date == input$asthma_year_choices) %>%
  #     filter(!(Ages %in% c("All Ages", "65+", "75+", "85+", "90+", "<18"))) %>%
  #     mutate(indicator = round(as.integer(indicator), 1),
  #            date = Date) %>%
  #     mode_bar_plot(x = .$Ages, y=.$indicator, category_var = .$Sex)
  }

})



output$asthma_admissions_table <- DT::renderDataTable({

  table <- asthma_admissions %>%
    select(c(Date, lookup, Sex, Ages, indicator, Provisional)) %>%
    rename(`Total number of stays` = "indicator") %>%
    arrange(desc(Date)) %>%
    datatable_style_download(.,
                             datetype = "financial_year",
                             data_name = "adult_living_limiting_long_term_condition",
                             geogtype = "none")


})


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
