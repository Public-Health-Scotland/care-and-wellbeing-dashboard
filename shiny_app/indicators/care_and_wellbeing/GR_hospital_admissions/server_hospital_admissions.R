##############################################.
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75) ----
##############################################.


##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS (<75) ----
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
# ALOCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.

output$alcohol_admissions_plot = renderPlotly({
  data_alc = alcohol_admissions %>% filter(sub_group_select_group_first==input$hb_alcohol_admissions) %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "Alcohol related admissions trend")})

##############################################.
# ASTHMA HOSPITAL ADMISSIONS----
##############################################.
