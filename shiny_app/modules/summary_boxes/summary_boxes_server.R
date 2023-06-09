

summaryBoxServer <- function(id,
                             recent_date = numeric(0),
                             previous_date = numeric(0),
                             recent_value = "To be developed",
                             previous_value = numeric(0),
                             value_dp = 2,
                             percentage = FALSE
) {

  moduleServer(
    id,
    function(input, output, session) {

      ## define percentage symbol and change
      change <- numeric(0)

      if(percentage) {percentage_symbol <- "%"} else {percentage_symbol <- ""}

      output$summary_values <- renderUI(

        tagList(


          ## Sentence for recent value
          div(class = "recent-value",
              ifelse(length(recent_value)[1] == 0,'Not available',
                     ifelse(recent_value == "To be developed", "",
                            glue("{recent_date}: {format(round_half_up(recent_value,value_dp),big.mark=',')}{percentage_symbol}")))),

          ## Sentence for previous value
          div(class = "previous-value",
              ifelse(length(previous_value)[1] == 0,'', glue("{previous_date}: {format(round_half_up(previous_value,value_dp),big.mark=',')}{percentage_symbol}"))),

          ## Sentence for either percentage change or difference depending on 'percentage' argument

          # Difference
          if(percentage) {

            if(is.numeric(recent_value)) {change = round_half_up((recent_value-previous_value), 2)}

            div(class = "value-change",
                ifelse(length(change)[1] == 0,"", glue("Difference: {ifelse(change < 0,'','+')}{round_half_up(change,2)}%")))


          # Percentage change
          } else {

            if(is.numeric(recent_value)) {change <- round_half_up((recent_value-previous_value)*100/previous_value,2)}

            div(class = "value-change",
                ifelse(length(change)[1] == 0,"", glue("Percentage change: {ifelse(change < 0,'','+')}{round_half_up(change,2)}%")))


          }
        )
      )
    }
  )
}
