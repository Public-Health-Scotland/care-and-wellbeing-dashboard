####################### Modals #######################

# Data download  server ----
dataDownloadServer <- function(data, data_download = data, id, filename,
                               add_separator_cols = NULL, # with , separator and 0dp
                               add_separator_cols_1dp = NULL, # with , separator and 1dp
                               add_separator_cols_2dp = NULL, # with , separator and 2dp,
                               add_percentage_cols = NULL, # with % symbol and 2dp
                               maxrows = 14, # max rows displayed on page
                               order_by_firstcol = NULL, # asc, desc or NULL
                               filter_cols = NULL, # columns to have filters for
                               highlight_column = NULL) { # Column to highlight specific entries based off


  moduleServer(
    id,
    function(input, output, session) {


      ### Create data table to show - data that goes in here should be the data that will also be downloaded
      output$table <-
        DT::renderDataTable({

          table_colnames = names(data) %>%
            gsub("_", " ", .) %>%
            str_to_sentence(.)

          # Add column formatting

          for (i in add_separator_cols){
            data[i] <- apply(data[i], MARGIN=1, FUN=format_entry)
          }

          for (i in add_separator_cols_1dp){
            data[i] <- apply(data[i], MARGIN=1, FUN=format_entry, dp=1)
          }

          for (i in add_separator_cols_2dp){
            data[i] <- apply(data[i], MARGIN=1, FUN=format_entry, dp=2)
          }

          for (i in add_percentage_cols){
            data[i] <- apply(data[i], MARGIN=1, FUN=format_entry, dp=1, perc=T)
          }

          # Always filter date cols
          date_cols <- which({purrr::map(data, class) %>% paste()} == "Date")
          filter_cols <- union(filter_cols, date_cols)

          # Getting columns not to filter based off columns to filter
          # Shifting down by 1 as data table starts counting from 0 whereas we want
          # to choose columns to filter by counting from 1 like in R
          no_filter_cols <- seq(0, (ncol(data)-1)) %>% .[!(. %in% (filter_cols-1))]

          if(!is.null(order_by_firstcol)){
            tab_order <- list(list(0, order_by_firstcol))
          } else {
            tab_order <- NULL
          }

          dt <- DT::datatable(data,
                              style = 'bootstrap',
                              class = 'table-bordered table-condensed',
                              rownames = FALSE,
                              filter="top",
                              colnames = table_colnames,
                              options = list(pageLength = 10,
                                             scrollX = FALSE,
                                             scrollY = FALSE,
                                             dom = 'tip',
                                             autoWidth = TRUE,
                                             # style header
                                             initComplete = htmlwidgets::JS(
                                               "function(settings, json) {",
                                               "$(this.api().table().header()).css({'background-color': '#4B006E', 'color': '#FFFFFF'});",
                                               "$(this.api().table().row().index()).css({'background-color': '#4B006E', 'color': '#FFFFFF'});",
                                               "}")))

          return(dt)

        })

      date_of_download <- format(today(), "%Y%m%d")

      table_colnames = names(data_download) %>%
        gsub("_", " ", .) %>%
        str_to_sentence(.)

      data_output <- data_download %>%
        rename_at(vars(names(data_download)), ~ table_colnames)

      output$csv <- downloadHandler(
        file = function(){
          glue("{filename}_{date_of_download}.csv")
        },

        content = function(file) {
          write.csv(data_output, file, row.names = FALSE)
          }

        )

      output$excel <- downloadHandler(
        file = function(){
          glue("{filename}_{date_of_download}.xlsx")
        },

        content = function(file) {
          openxlsx::write.xlsx(data_output, file)
        }

      )

    }

  )
}

