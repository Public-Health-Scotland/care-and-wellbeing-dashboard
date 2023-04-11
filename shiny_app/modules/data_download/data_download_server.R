####################### Modals #######################

# Data download  server ----
dataDownloadServer <- function(data, id, filename) {

  table_colnames = names(data) %>%
    gsub("_", " ", .) %>%
    str_to_title(.)

  moduleServer(
    id,
    function(input, output, session) {

      output$table <-
        DT::renderDataTable({

          dt <- DT::datatable(data,
                              style = 'bootstrap',
                              class = 'table-bordered table-condensed',
                              rownames = FALSE,
                              filter="top",
                              colnames = table_colnames,
                              options = list(pageLength = 10,
                                             scrollX = FALSE,
                                             scrollY = FALSE,
                                             dom = 'Btip',
                                             autoWidth = TRUE,
                                             # style header
                                             initComplete = htmlwidgets::JS(
                                               "function(settings, json) {",
                                               "$(this.api().table().header()).css({'background-color': '#C5C3DA', 'color': '#3F3685'});",
                                               "$(this.api().table().row().index()).css({'background-color': '#C5C3DA', 'color': '#3F3685'});",
                                               "}")))

          return(dt)

        })

      output$csv <- downloadHandler(
        file = function(){
          glue("{filename}.csv")
        },

        content = function(file) {
            write.csv(data, file, row.names = FALSE)
          }

        )

      output$excel <- downloadHandler(
        file = function(){
          glue("{filename}.xlsx")
        },

        content = function(file) {
          write.csv(data, file, row.names = FALSE)
        }

      )

    }

  )
}

