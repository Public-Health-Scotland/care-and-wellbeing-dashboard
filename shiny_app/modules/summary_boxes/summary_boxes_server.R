

summaryBoxServer <- function(id, recent_date,# = recent_date,
                             previous_date,# = previous_date,
                             recent_value,# = recent_value,
                             previous_value,# = previous_value,
                             change) {# = change) {

  moduleServer(
    id,
    function(input, output, session) {


      output$summary_values <- renderUI(

        tagList(
          div(class = "recent-value",
              glue("{recent_date}: ",
                   "{ifelse(length(recent_value)[1] == 0,'Not available', recent_value)}")),

          div(class = "previous-value",
              glue("{previous_date}: ",
                   "{ifelse(length(previous_value)[1] == 0,'Not available', previous_value)}")),

          div(class = "value-change",
              glue("Percentage change: +{round_half_up(change,2)}%")),

        )

      )

    }
  )




}
