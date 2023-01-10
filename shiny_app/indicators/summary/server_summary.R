##############################################.
# SUMMARY FIGURES ----
##############################################.

output$indicator_type_ui = renderUI({

  summary_filtered = summary_final %>%
    filter(pillar == input$pillar_type_summary)

  radioButtons("indicator_type_summary",
               label = "2. Select indicator section",
               choices = unique(summary_filtered$section))

})

output$geog_summary_ui = renderUI({

  summary_filtered = summary_final %>%
    filter(geography_type == input$geog_type_summary)

  selectizeInput("geog_name_summary",
                 label = "4. Select geography",
                 choices = unique(summary_filtered$geography),
                 selected = "")
})

output$summary = DT::renderDataTable({

  data = geog_all_filter_table(summary_final,
                               input$geog_type_summary,
                               input$geog_name_summary) %>%
    filter(section == input$indicator_type_summary)


  names(data) = gsub("_", " ", names(data))

  data2 = data  %>%
    select(Indicator = title, Description = "indicator description",
           Latest = latest, Date = date, Previous = previous,
           "Previous Date" = "previous date")

  datatable_style_summary(data2)
})
