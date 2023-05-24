## Generic Chart Functions ----

#plot title style
title_style <- list(size =24, color = "#4B006E", family = "Arial")

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

create_palette <- function(colour) {

  if (length(unique(colour)) ==1 ) {
    palette <- phs_colours('phs-purple')
  } else {
    palette <- phs_colours(c('phs-purple', 'phs-magenta', 'phs-teal', 'phs-green', 'phs-rust'))
  }

  return(palette)

}

# These functions should be able to apply to multiple datasets to easily produce a similar style chart

# Confidence interval line chart
# This creates a line chart with one geographic area, showing a line chart over time
# The CIs show as a shaded area
# Must be named x = "date", y = "indicator", "upper_confidence_interval" and
# "lower_confidence_interval"

#### Charts ----

confidence_line_function = function(data, y_title, x_title = "Year range", title = "") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  plot_ly(data = data) %>%

    add_trace(x=~date, y=~lower_confidence_interval,
              type = "scatter",
              mode = "lines",
              line = list(color = 'transparent'),
              name = "Lower confidence interval",
              showlegend = TRUE,
              hovertemplate = ~glue("{lower_confidence_interval %>% round_half_up(2)}"),
              hoverinfo = "none",
              textposition = "none",
              legendgroup = "z_confidence_interval") %>%
    add_trace(x=~date,
              y=~upper_confidence_interval,
              type = "scatter",
              mode = "lines",
              fill = 'tonexty',
              fillcolor = phsstyles::phs_colours("phs-liberty-30"),
              line = list(color = 'transparent'),
              name = "Upper confidence interval",
              showlegend = TRUE,
              hovertemplate = ~glue("{upper_confidence_interval %>% round_half_up(2)}"),
              hoverinfo = "none",
              textposition = "none",
              legendgroup = "z_confidence_interval") %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              name = "Rate",
              line = list(color = phsstyles::phs_colours("phs-purple")),
              showlegend = TRUE,
              hovertemplate = ~glue("{indicator %>% round_half_up(2)}"),
              hoverinfo = "text",
              textposition = "none",
              legendgroup = "rate") %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}






line_chart_function = function(data, y_title, x_title = "Year", title = "", label = "Number") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              line = list(color = phs_colours("phs-purple")),
              name = glue("{label}"),
              hovertemplate = ~glue("{format(round_half_up(indicator, 2), big.mark=',')}{ifelse(label == 'Percentage','%','')}")) %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number,
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


stacked_bar_function = function(data, category_var, title = "") {

  data %>%
    plot_ly(x=~date,
            y=~proportion*100,
            color = ~category_var,
            colors = c("#0060a9", phs_colours(c('phs-blue', 'phs-blue-80', 'phs-blue-50', 'phs-blue-30'))),
            type = 'bar',
            # name = glue("{category_var}{label}"),
            hovertemplate = ~glue("{round_half_up(proportion*100, 2)}%")
    ) %>%
    layout(barmode = "stack",
           xaxis = xaxis_finyear,
           yaxis = list(title = "Percentage",
                        rangemode="tozero",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text =str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}

mode_bar_plot <- function(data, x, y, xaxis_title = "Date", yaxis_title = "Total", category_var, mode = "stack", title = "") {


  #Modifying standard layout
  yaxis_plots[["title"]] <- yaxis_title
  xaxis_plots[["title"]] <- xaxis_title


  data %>%
    plot_ly(x=~x,
            y=~y,
            color = ~category_var,
            colors = c("#0060a9", phs_colours(c('phs-blue', 'phs-blue-80', 'phs-blue-50', 'phs-blue-30'))),
            type = 'bar',
            # name = glue("{category_var}{label}"),
            hovertemplate = ~glue("{y %>% round_half_up(2)}"),
            textposition = "none"
    ) %>%
    layout(barmode = mode,
           xaxis = xaxis_plots,
           yaxis = yaxis_plots,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
  config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}




make_line_chart_multi_lines <- function(data, x, y, colour, y_axis_title, x_axis_title = "Year",
                                        label = "", title = "", hover_end="") {

  plot_ly(data = data,
          x = ~x,
          y = ~y,
          color = ~colour,
          type="scatter",
          mode="lines",
          colors = palette,
          # text = "rate",
          # name = glue("{colour}{label}"), ## unordering factors - levels didn't match legend
          hovertemplate = ~glue("{format(round_half_up(y, 2), big.mark=',')}{hover_end}")

  ) %>%
    layout(yaxis = list(title = y_axis_title,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        fixedrange=FALSE,
                        showlegend = T),
           xaxis = list(title = x_axis_title,
                        tickfont = list(size=14),
                        titlefont = list(size=18)),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = FALSE, displayModeBar = TRUE,
           modeBarButtonsToRemove = bttn_remove)


}



