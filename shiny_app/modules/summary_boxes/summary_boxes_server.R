

summaryBoxServer <- function(id, recent_date,
                             previous_date,
                             recent_value,
                             previous_value,
                             change,
                             percentage_symbol = "" # If a percentage symbol is needed update to "%"
) {

  moduleServer(
    id,
    function(input, output, session) {


      output$summary_values <- renderUI(

        tagList(

          div(class = "recent-value",
              ifelse(length(recent_value)[1] == 0,'Not available', glue("{recent_date}: {format(round_half_up(recent_value,2),big.mark=',')}{percentage_symbol}"))),

          div(class = "previous-value",
              ifelse(length(previous_value)[1] == 0,'', glue("{previous_date}: {format(round_half_up(previous_value,2),big.mark=',')}{percentage_symbol}"))),


          div(class = "value-change",
              glue("Percentage change: ",
                   "{ifelse(change < 0,'','+')}{round_half_up(change,2)}%"))


        )

      )

    }
  )




}
