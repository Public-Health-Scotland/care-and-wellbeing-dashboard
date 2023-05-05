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
                                    "Step 2. Select national or local geography area",
                                    choices = unique(areas$geography))
             })


output$all_cause_mortality_plot = renderPlotly({

  title <- glue("All-cause mortality, ages 15-44, in ",
                            input$all_cause_mortality_geog_name)

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


  line_chart_function(data, indicator_y,
                      title = title,
                      label = ifelse(input$all_cause_mortality_rate_number == "Rate", "Rate of deaths", "Number of deaths"))


})


observeEvent(input$all_cause_mortality_geog_name,{

  data_unfiltered <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44") %>%
    group_by(year, geography_type, geography) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    ungroup() %>%
    mutate(rate = deaths/pop*100000) %>%
    select(year, geography_type, geography, deaths, rate) %>%
    arrange(year) %>%
    mutate(year = factor(year)) %>%
    rename("Number of deaths" = "deaths",
           "Rate of deaths per 100,000 population" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$all_cause_mortality_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "all_cause_mortality", filename = "all_cause_mortality",
                     add_separator_cols = c(4),
                     add_separator_cols_2dp = c(5))

})

observeEvent(input$all_cause_mortality_geog_name,{

  output$all_cause_mortality_title <- renderText({glue("Data table: Total number of all-cause deaths, ages 15-44, in ",
                                                       input$all_cause_mortality_geog_name)})
})



##############################################.
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
##############################################.

observeEvent(input$chd_deaths_geog_type,
             {

               areas <- chd_deaths %>%
                 filter(geography_type == input$chd_deaths_geog_type)

               updateSelectizeInput(session,
                                    "chd_deaths_geog_name",
                                    "Step 2. Select natioanl or local geography area",
                                    choices = unique(areas$geography))
             })


output$chd_deaths_plot = renderPlotly({
  title <- glue("Trend in age-sex standardised rates per 100,000 of CHD deaths (age 45-74) in ",
                            input$chd_deaths_geog_name)
  data = chd_deaths %>%
    filter(geography_type == input$chd_deaths_geog_type,
           geography == input$chd_deaths_geog_name) %>%
    rename(date = year_range) %>%
    confidence_line_function(., "Age-sex standardised rate of deaths", title = title) %>%
    layout(xaxis = list(tickangle = 30))
})


observeEvent(input$chd_deaths_geog_type,{
  observeEvent(input$chd_deaths_geog_name,{

  data_unfiltered <- chd_deaths %>%
    select(year_range, area_type, area_name, measure,
           lower_confidence_interval, upper_confidence_interval) %>%
    arrange(year_range) %>%
    mutate(year_range = factor(year_range)) %>%
    rename("geography_type" = "area_type",
           "geography" = "area_name",
           "Rate of CHD deaths per 100,000 (age 45-74)" = "measure")

  data_filtered <- data_unfiltered %>%
    filter(geography_type == input$chd_deaths_geog_type) %>%
    filter(geography == input$chd_deaths_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "chd_deaths", filename = "chd_deaths",
                     add_separator_cols_2dp = c(4,5,6))
  })
})

observeEvent(input$chd_deaths_geog_name,{

  output$chd_deaths_title <- renderText({glue("Data table: Age-sex standardised rates per 100,000 of CHD deaths (age 45-74) in ",
                                              input$chd_deaths_geog_name)})
})

##############################################.
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
##############################################.

output$hospital_admission_heart_attack_plot <- renderPlotly({

  title <- "Total number of first ever hopsital admissions for heart attack (under 75) annually in Scotland"

  p <- heart_attack %>%
    line_chart_function(y_title = "Total number of hospital admissions", label = "Number of admissions", title = title)

})

heart_attack %>%
  select(date, total_admissions) %>%
  arrange(date) %>%
  mutate(date = factor(date)) %>%
  rename("Year" = "date",
         "Total number of hospital admissions" = "total_admissions") %>%
  dataDownloadServer(id = "heart_attack_admission",
                     filename = "first_ever_hospital_admission_heart_attack",
                     add_separator_cols = c(2))


##############################################.
# DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS ----
##############################################.


altTextServer("drug_admissions_alt",
              title = "Drug admissions plot",
              content = tags$ul(tags$li("This is a plot for the drug-related hospital admissions indicator.")

              )
)

output$drug_admissions_plot = renderPlotly({

  if(length(input$drug_admissions_age) != 1){
    age_title <- "by age"
  } else if (input$drug_admissions_age == "All age groups") {
  age_title <- "all age groups"
  } else {
    age_title <- paste0("ages ", input$drug_admissions_age)
  }

  title <- glue("Age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                            age_title, ") in Scotland")

  data = drug_stays %>%
    filter(age_group %in% input$drug_admissions_age) %>%
    mutate(indicator = rate, date = financial_year) %>%

  make_line_chart_multi_lines(x = .$date, y = .$indicator,
                              colour = .$age_group,
                              title = title,
                              y_axis_title = "Age-sex standardised rate of stays<br>(per 100,000)",
                              x_axis_title = "Financial year", label = " rate") %>%
    layout(xaxis = list(tickangle = 45))

})



observeEvent(input$drug_admissions_age,{

    data_unfiltered <- drug_stays %>%
      select(financial_year, age_group, rate) %>%
      arrange(financial_year) %>%
      mutate(financial_year = factor(financial_year)) %>%
      rename("Drug-related hospital admissions rate" = "rate")

    data_filtered <- data_unfiltered %>%
      filter(age_group == input$drug_admissions_age)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "drug_admissions", filename = "drug_admissions",
                       add_separator_cols_2dp = c(3))
})

observeEvent(input$drug_admissions_age,{

  if(length(input$drug_admissions_age) != 1){
    age_title <- "by age"
  } else if (input$drug_admissions_age == "All age groups") {
    age_title <- "all age groups"
  } else {
    age_title <- paste0("ages ", input$drug_admissions_age)
  }

  output$drug_admissions_title <- renderText({glue("Data table: Age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                                                   age_title, ") in Scotland")})
})




##############################################.
# DRUG RELATED DEATHS----
##############################################.

observeEvent(input$drug_deaths_geog_type,
             {

               data <- drug_related_deaths %>%
                 filter(geography_type == input$drug_deaths_geog_type)

               updateSelectizeInput(session,
                                    "drug_deaths_geog_name",
                                    "Step 2. Select a national or local geography area",
                                    choices = unique(data$geography))
             })


altTextServer("drug_deaths_alt",
              title = "Drug-related deaths plot",
              content = tags$ul(tags$li("This is a plot for the drug-related deaths indicator."),
                                tags$li("Rates based on fewer than 10 deaths not shown")

              )
)

output$drug_deaths_plot = renderPlotly({

  title <- glue("Drug misuse deaths by 5-year periods in ",
                            input$drug_deaths_geog_name)

  if (input$drug_deaths_rate_number == "Rate") {
    drug_related_deaths %>%
      mutate(date = year) %>%
      filter(geography_type == input$drug_deaths_geog_type,
             geography == input$drug_deaths_geog_name) %>%
      confidence_line_function(., "Age-standardised death rate<br>(per 100,000)", title = title) %>%
      layout(xaxis = list(tickangle = 45))

  } else if (input$drug_deaths_rate_number == "Number") {
    drug_related_deaths %>%
      mutate(date = year, indicator = number) %>%
      filter(geography_type == input$drug_deaths_geog_type,
             geography == input$drug_deaths_geog_name) %>%
      line_chart_function(., "Total number of deaths", title = title) %>%
      layout(xaxis = list(tickangle = 45))

  }
})

observeEvent(input$drug_deaths_geog_type,{
  observeEvent(input$drug_deaths_geog_name,{

  data_unfiltered <- drug_related_deaths %>%
    select(year, geography_type, geography, number, rate,
           lower_confidence_interval, upper_confidence_interval) %>%
    arrange(year) %>%
    mutate(year = factor(year)) %>%
    rename("Year range" = "year",
           "Number of drug-related deaths" = "number",
           "Drug-related deaths rate" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(geography_type == input$drug_deaths_geog_type,
           geography == input$drug_deaths_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "drug_deaths", filename = "drug_deaths",
                     add_separator_cols = c(4),
                     add_separator_cols_1dp = c(5,6,7))
  })
})

observeEvent(input$drug_deaths_geog_name,{

  output$drug_deaths_title <- renderText({glue("Data table: Age-sex standardised rates per 100,000 of drug-related deaths in ",
                                               input$drug_deaths_geog_name)})
})

##############################################.
# ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.
observeEvent(input$alcohol_admissions_geog_type,
             {

               alcohol_filtered = alcohol_admissions %>%
                 filter(geography_type == input$alcohol_admissions_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "alcohol_admissions_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(alcohol_filtered$geography))#,
               #selected = "")
             })

output$alcohol_admissions_plot = renderPlotly({

  title <- glue("Trend in total number of alcohol related admissions in ",
                            input$alcohol_admissions_geog_name)

  data_alc = alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(geography == input$alcohol_admissions_geog_name,
           condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "European age-sex standardised rate<br>(per 100,000)") %>%
    layout(xaxis = list(tickangle = 45))

    })

observeEvent(input$alcohol_admissions_geog_name,{

    data_unfiltered <- alcohol_admissions %>%
      arrange(financial_year) %>%
      filter(condition == "All alcohol conditions",
             smr_type == "Combined") %>%
      mutate(financial_year = factor(financial_year)) %>%
      select(financial_year, geography_type, geography, stays_easr) %>%
      rename("Number of alcohol related admissions" = "stays_easr")

    data_filtered <- data_unfiltered %>%
        filter(geography == input$alcohol_admissions_geog_name)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "alcohol_related_admissions", filename = "alcohol_related_admissions",
                       add_separator_cols_1dp = c(4))

})

observeEvent(input$alcohol_admissions_geog_name,{

    output$alcohol_admissions_title <- renderText({glue("Data table: Total number of alcohol related admissions in ",
                                                        input$alcohol_admissions_geog_name)})
})



##############################################.
# ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
##############################################.
output$alcohol_deaths_plot <- renderPlotly({

  plot <- alcohol_deaths %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    rename("lower_confidence_interval" = lower_ci,
           "upper_confidence_interval" = upper_ci,
           "date" = year,
           "indicator" = rate) %>%
    confidence_line_function(y_title = "Age-standardised mortality rate<br>(per 100,000)")


})

output$alcohol_deaths_by_age_plot <- renderPlotly({

  plot <- alcohol_deaths_by_age %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    make_line_chart_multi_lines(., x = .$year, y = .$indicator,
                                colour = .$age_group, y_axis_title = "Deaths per 100,000 people")

})



output$alcohol_deaths_table <- DT::renderDataTable({

  alcohol_deaths_by_age %>%
    select(c(year, age_group, indicator, sex)) %>%
    mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
    rename(Year = "year",
           Sex = "sex",
           `Age Group` = "age_group",
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
                                    "healthy_birthweight_geog_name",
                                    "Step 2. Select a national or local geography area",
                                    choices = unique(birthweight_data$geography))
             })

output$healthy_birthweight_plot = renderPlotly({

  title <- glue("Birthweight of babies based on gestational age in ",
                            input$healthy_birthweight_geog_name)

  birthweight %>%
    mutate(date = financial_year,
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age, levels = c("Small", "Appropriate", "Large", "Not Applicable"))) %>%
    filter(geography == input$healthy_birthweight_geog_name, geography_type == input$healthy_birthweight_geog_type) %>%
    stacked_bar_function(., .$birthweight_for_gestational_age, title = title)
})

observeEvent(input$healthy_birthweight_geog_name,{

  data_unfiltered <- birthweight %>%
    arrange(financial_year) %>%
    mutate(percentage = round_half_up(proportion*100,1)) %>%
    select(financial_year, geography_type, geography,
           birthweight_for_gestational_age, percentage) %>%
    mutate(financial_year = factor(financial_year),
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age)) %>%
    rename("Percentage of babies (%)" = "percentage")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$healthy_birthweight_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "healthy_birthweight", filename = "healthy_birthweight",
                     add_separator_cols_1dp = c(5))

})

observeEvent(input$healthy_birthweight_geog_name,{

  output$healthy_birthweight_title <- renderText({glue("Data table: Birthweight of babies based on gestational age in ",
                                                      input$healthy_birthweight_geog_name)})
})


##############################################.
#  SELF-ASSESSED HEALTH OF ADULTS (16+)----
##############################################.

output$adult_self_assessed_health_plot <- renderPlotly({

  title<- "Percentage of adults in Scotland who describe their general health as 'good' or 'very good'"

  plot <- adult_self_assessed_health %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage", label = "Percentage", title = title)%>%
    layout(yaxis = yaxis_proportion)

})



adult_self_assessed_health %>%
  select(c(Year, indicator)) %>%
  mutate(indicator = round(as.integer(indicator), 1)) %>%
  mutate(Year = factor(Year)) %>%
  rename("Percentage of adults who describe their general health as 'good' or 'very good' (%)" = "indicator") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "adult_self_assessed_health",
                     filename = "adult_self_assessed_health")


##############################################.
#  LIMITING LONG-TERM CONDITIONS (16+)----
##############################################.

output$adult_long_term_condition_plot <- renderPlotly({

  title <- "Percentage of adults with a limiting long-term condition in Scotland"

  plot <- adult_living_limiting_long_term_condition %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage", label = "Percentage", title = title)%>%
    layout(yaxis = yaxis_proportion)

})



adult_living_limiting_long_term_condition %>%
  select(c(Year, indicator)) %>%
  mutate(indicator = round(as.integer(indicator), 1)) %>%
  mutate(Year = factor(Year)) %>%
  rename("Percentage of adults with a limiting long-term condition (%)" = "indicator") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "limiting_ltcs",
                     filename = "limiting_long_term_conditions")

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


observeEvent(input$asthma_admissions_geog_type,
             {

               asthma_filtered = asthma_admissions %>%
                 filter(geography_type == input$asthma_admissions_geog_type)


               updateSelectizeInput(session, "asthma_admissions_geog_name",
                                    choices = unique(asthma_filtered$geography))#,
               #selected = "")
             })



output$asthma_admissions_plot <- renderPlotly({

  geog <- input$asthma_admissions_geog_name

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    breakdown <- ""

  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    breakdown <- "by age "


  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    breakdown <- "by sex "
  }

  title <- glue("Trend of total number of asthma admissions ",
                            breakdown, "in \n ", geog)

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", age_group == "All Ages", geography == input$asthma_admissions_geog_name) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      line_chart_function(., y_title = "Total number of admissions", title = glue("{title}"), label = "Number of admissions")


  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", geography == input$asthma_admissions_geog_name) %>%
      filter(!(age_group %in% c("All Ages", "65+", "75+", "85+", "90+", "<18"))) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$age_group, y_axis_title = "Total number of admissions", title = title)


  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    plot <- asthma_admissions %>%
      filter(age_group == "All Ages", geography == input$asthma_admissions_geog_name) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$sex, y_axis_title = "Total number of admissions", title = title)

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



observeEvent(input$asthma_admissions_breakdowns,{
  observeEvent(input$asthma_admissions_geog_name,{

  data_unfiltered <- asthma_admissions %>%
    arrange(desc(date)) %>%
    mutate(provisional = ifelse(provisional == "1", "p", ""),
           date = factor(date),
           sex = factor(sex),
           age_group = factor(age_group)) %>%
    select(c(date, geography_type, geography, sex, age_group, indicator, provisional)) %>%
    rename(`Total number of admissions` = "indicator",
           "Year" = "date",
           "Is data provisional (p)?" = "provisional")

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    data_filtered <- data_unfiltered %>%
      filter(sex == "All Sexes", age_group == "All Ages",
             geography == input$asthma_admissions_geog_name)

  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    data_filtered <- data_unfiltered %>%
      filter(sex == "All Sexes",
             geography == input$asthma_admissions_geog_name) %>%
      filter(!(age_group %in% c("All Ages", "65+", "75+", "85+", "90+", "<18")))


  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    data_filtered <- data_unfiltered %>%
      filter(age_group == "All Ages",
             geography == input$asthma_admissions_geog_name)
  }

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "asthma_admissions", filename = "asthma_admissions",
                     add_separator_cols = c(6))

  })
})

observeEvent(input$asthma_admissions_breakdowns,{
  observeEvent(input$asthma_admissions_geog_name,{

    geog <- input$asthma_admissions_geog_name

    if(input$asthma_admissions_breakdowns == "Yearly total"){

      breakdown <- ""

    } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

      breakdown <- "by age "


    } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

      breakdown <- "by sex "
    }

  output$asthma_admissions_title <- renderText({glue("Data table: Total number of asthma admissions ",
                                                     breakdown, "in ", geog)})
  })
})


altTextServer("asthma_admissions_alt",
              title = "Asthma admissions plot",
              content = tags$ul(tags$li("This is a plot for the admissions for asthma indicator.")

              )
)


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

  title <- "Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"

  experience_unpaid_carers %>%
    mutate(proportion = as.numeric(indicator)) %>%
    stacked_bar_function(., category_var = .$breakdown, title = title)


})

experience_unpaid_carers %>%
  select(c(date, breakdown, indicator)) %>%
  mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
  arrange(desc(date)) %>%
  mutate(date = factor(date),
         breakdown = factor(breakdown)) %>%
  rename("Financial Year" = "date",
         Answer = "breakdown",
         Percentage = "indicator") %>%
  dataDownloadServer(id = "experience_unpaid_carers",
                     filename = "experience_unpaid_carers")


