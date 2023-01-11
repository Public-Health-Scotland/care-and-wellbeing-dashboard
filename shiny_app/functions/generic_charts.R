## Generic Chart Functions ----

# Insert a chart and its title
plot_title <- function(title_plot, plot_output, subtitle = "") {
  tagList(h3(title_plot),
          p(paste0(subtitle)),
          withSpinner(plotlyOutput(plot_output)))
}



# Add a vline as a segment of a chart (has a lengend item)
add_vline_seg = function(p, x_date, yvalue, name, colour, group) {

  p %<>%
    add_segments(x=x_date,
                 xend=x_date,
                 type = "scatter",
                 mode = "lines",
                 inherit = F,
                 y= 0,
                 yend = max(yvalue),
                 name = name,
                 line = list(color = colour, dash = "dot"),
                 showlegend = T,
                 legendgroup = group)

}

# Add vertical lines

vline = function(x, width=3.0, color="black", ...) {
  l_shape = list(
    type = "line",
    y0 = 0, y1 = 1, yref = "paper", # i.e. y as a proportion of visible region
    x0 = x, x1 = x,
    line = list(color = color,
                dash = "dot")
  )
  return(l_shape)
}

# Add horizontal lines
hor_line = function(y=0, color="black", ...) {
  hline_shape = list(
    type = "line",
    y0 = y, y1 = y, yref = "paper",
    x0 = 0, x1 = 1,
    line = list(color = color,
                dash = "dash")
  )

}

annotation = function(frac, y, note, color){
  ann = list(yref = "paper",
             xref = "paper",
             y = y,
             x = frac,
             text = note,
             bgcolor = 'white',
             # Styling annotations' text:
             font = list(color = color,
                         size = 14),
             showarrow=FALSE)
  return(ann)
}

add_vline = function(p, x, ...){
  l_shape <- vline(x, ...)
  p %>% layout(shapes=list(l_shape))
}



add_lines_and_notes <- function(p, xs, ys, fracs, notes, colors, widths=NULL){

  shapes <- list()
  annotations <- list()
  # Create vlines
  for(i in seq(length(xs))){
    new_vline <- vline(as.Date(xs[i]), color=colors[i])
    new_annotation <- annotation(fracs[i], ys[i], notes[i], colors[i])
    shapes[[i]] <- new_vline
    annotations[[i]] <- new_annotation

  }

  # browser()
  p %>% layout(annotations=annotations, shapes=shapes)

}

# These functions should be able to apply to multiple datasets to easily produce a similar style chart

# Confidence interval line chart
# This creates a line chart with one geographic area, showing a line chart over time
# The CIs show as a shaded area
# Must be named x = "date", y = "indicator", "upper_confidence_interval" and
# "lower_confidence_interval"

#### Charts ----

confidence_line_function = function(data, y_title) {

  yaxis_number[["title"]] = y_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~upper_confidence_interval,
              type = "scatter",
              mode = "lines",
              line = list(color = 'transparent'),
              name = "upper bound",
              showlegend = FALSE) %>%
    add_trace(x=~date, y=~lower_confidence_interval,
              type = "scatter",
              mode = "lines",
              fill = 'tonexty',
              fillcolor = phsstyles::phs_colours("phs-purple-10"),
              line = list(color = 'transparent'),
              name = "lower bound",
              showlegend = FALSE) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              name = "Age-sex standardised rates per 100,000",
              line = list(color = phsstyles::phs_colours("phs-purple")),
              showlegend = TRUE) %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}





line_chart_function = function(data, y_title) {

  yaxis_number[["title"]] = y_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              line = list(color = phs_colours("phs-purple"))) %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


stacked_bar_function = function(data, category_var) {

  data %>%
  plot_ly(x=~date,
          y=~proportion*100,
          color = ~category_var,
          colors = phs_colours(c('phs-purple', 'phs-magenta', 'phs-blue', 'phs-green')),
          type = 'bar') %>%
    layout(barmode = "stack",
           xaxis = xaxis_finyear,
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%")) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}
