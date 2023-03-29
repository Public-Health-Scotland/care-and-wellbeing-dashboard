##############################################.
# SUMMARY FIGURES ----
##############################################.

observeEvent(input$pillar_type_summary,
             {
               summary_filtered = summary_final %>%
                 filter(pillar == input$pillar_type_summary)

               updateSelectizeInput(session, "indicator_type_summary",
                                    #label = "2. Select indicator section",
                                    choices = unique(summary_filtered$section))#,
               #selected = "")

             })

observeEvent(input$geog_type_summary,
             {

  summary_filtered = summary_final %>%
    filter(geography_type == input$geog_type_summary)

  select_choice <- ifelse(input$geog_type_summary == "Scotland", "area", input$geog_type_summary)

  updateSelectizeInput(session, "geog_name_summary",
                 label = glue("4. Select {select_choice}"),
                 choices = unique(summary_filtered$geography))#,
                 #selected = "")
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
