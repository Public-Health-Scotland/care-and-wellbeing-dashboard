

make_line_chart_multi_lines <- function(data, x, y, colour, y_axis_title) {
  plot_ly(x = ~x,
          y = ~y,
          color = ~colour,
          type="scatter",
          mode="lines+markers",
          colors = palette) %>%
  layout(yaxis = list(title = y_axis_title,
                      tickfont = list(size=14),
                      titlefont = list(size=18),
                      showline = FALSE,
                      fixedrange=FALSE,
                      showlegend = T),
         xaxis = list(title = "Year",
                      tickfont = list(size=14),
                      titlefont = list(size=18)))

}

test
test <- alcohol_deaths %>%

  filter(sex == "Persons") %>%
  make_line_chart_multi_lines(., x = .$year, y = .$indicator, colour = .$breakdown, y_axis_title = "Rate")

