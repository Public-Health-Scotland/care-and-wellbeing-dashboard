##############################################.
# FUNCTIONS ----
##############################################.



##############################################.
# GENERAL UTILITY ----
##############################################.


# Creating home page buttons ----
home_page_buttons_fn <- function(title_box, button_name, description="") {

  div(class="landing-page-box-about",
      div(title_box, class = "landing-page-box-title"),
      div(description, class = "landing-page-box-description"),
      (actionButton(button_name, NULL,
                    class="landing-page-button")))
}




# Remove warnings from icons ----

icon_no_warning_fn = function(icon_name) {
  icon(icon_name, verify_fa=FALSE)
}


# Pretty numbers ----

pretty_big_numbers = function(data, columns) {
  if(is.null(columns))
  {
    return(data)
  }

  data %<>%
    mutate_at(columns, ~format(., big.mark = ","))
}

pretty_decimal_numbers = function(data, columns) {
  if(is.null(columns))
  {
     return(data)
  }

  data %<>%
    mutate_at(columns, ~format(round_half_up(., 2)), 2)
}

##############################################.
# CHARTS ----
##############################################.

# Insert a chart and its title
plot_title <- function(title_plot, plot_output, subtitle = "") {
  tagList(h3(title_plot),
          p(paste0(subtitle)),
          withSpinner(plotlyOutput(plot_output)))
}

# Filter a dataframe to health board function
hb_filter_table = function(data, health_board) {
  data_filtered = data %>%
    filter(hb2019name == health_board)
}

# Filter a dataframe to ROA region function
region_filter_table = function(data, region_of_interest) {
  data_filtered = data %>%
    filter(region == region_of_interest)
}

# Filter a dataframe to geography type and geography
geog_all_filter_table = function(data, geog_type, geog_name) {
  data %<>%
    filter(geography_type == geog_type,
           geography == geog_name)

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

# Reading in generic chart
source(file.path("functions/generic_charts.R"),local = TRUE)$value

  ##############################################.
  # CHILD POVERTY----
  ##############################################.

child_poverty_plot = function(data) {
  data %<>%
    pivot_wider(names_from = Group, values_from = proportion) %>%
    clean_names()

  data %>%
    plot_ly(x=~financial_year,
            y=~children*100,
            type="scatter",
            mode="lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            name = "Children",
            text = paste0(data$financial_year, "<br>",
                          "Proportion of children: ",
                          scales::percent(data$children, accuracy = .1),
                          "<br>",
                          "Proportion of all ages: ",
                          scales::percent(data$all_people, accuracy = .1)),
            hoverinfo = 'text') %>%
    add_trace(x=~financial_year,
              y=~all_people*100,
              type="scatter",
              mode="lines+markers",
              line = list(color=palette[2]),
              marker = list(color=palette[2]),
              name = "All Ages",
              text = paste0(data$financial_year, "<br>",
                            "Proportion of children: ",
                            scales::percent(data$children, accuracy = .1),
                            "<br>",
                            "Proportion of all ages: ",
                            scales::percent(data$all_people, accuracy = .1)),
              hoverinfo = 'text') %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion,
           legend = list(bgcolor = "#E2E2E2",
                         title = list(
                           text = "Filter chart"))) %>%
             config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}

  ##############################################.
  # PRE-SCHOOL DEVELOPMENT----
  ##############################################.

preschool_plot_line = function(data, data_baseline, baseline = FALSE,
                               geog_name = NA, baseline_name) {
  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any*100,
            type="scatter",
            mode="lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            text = paste0(data$financial_year, "<br>",
                          "Proportion of reviews with any concern: ",
                          scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
                          "Number of reviews with any concern: ",
                          format(data$concern_any), big.mark = ","),
            hoverinfo = "text",
            name = geog_name) %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  if (baseline) {
    plot = plot %>%
      add_trace(data = data_baseline,
                x=~financial_year,
                y=~prop_concern_any*100,
                type="scatter",
                mode="lines+markers",
                line = list(color=palette[2]),
                marker = list(color=palette[2]),
                text = paste0(data_baseline$financial_year, "<br>",
                              "Proportion of reviews with any concern: ",
                              scales::percent(data_baseline$prop_concern_any, accuracy = .1),"<br>",
                              "Number of reviews with any concern: ",
                              format(data_baseline$concern_any), big.mark = ","),
                hoverinfo = "text",
                name = baseline_name)
  }

  return(plot)
}


preschool_plot_line2 = function(data) {
  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any*100,
            type="scatter",
            mode="lines+markers",
            color = data$geography,
            colors = palette,
            text = paste0(data$geography, "<br>", data$financial_year, "<br>",
                          "Proportion of reviews with any concern: ",
                          scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
                          "Number of reviews with any concern: ",
                          format(data$concern_any, big.mark = ",")),
            hoverinfo = "text") %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# CAMHS WAITING TIMES----
##############################################.

camhs_plot_line = function(data, vline=TRUE) {
  p = data %>%
    plot_ly(x=~date,
            y=~proportion*100,
            type = "scatter",
            mode = "lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          "Proportion of patients seen within 18 weeks: ",
                          scales::percent(data$proportion, accuracy = .1),
                          "<br>",
                          "Number of patients seen within 18 weeks: ",
                          format(data$number, big.mark = ",")),
            hoverinfo = "text",
            name = "Proportion of patients seen in 18 weeks") %>%
    layout(xaxis = xaxis_month,
           yaxis = yaxis_proportion) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  p %<>%
    add_segments(data=NULL, inherit = FALSE, text = NULL, hoverinfo = "text",
                 x = min(data$date), xend = max(data$date), y = 90, yend=90,
                 type = "line",
                 name = "Scottish Government Target",
                 line = list(color = "#C73918",width=1,dash = "dash"))

  if (vline) {

    xs = c("2020-03-24", "2021-01-05", "2021-12-05")


    fracs <- unlist(purrr::map(.x=xs,
                               .f= ~ as.numeric(as.Date(.x) - min(data$date))/as.numeric(max(data$date - min(data$date)))))

    p %<>%
      add_lines_and_notes(xs=xs,
                          ys=c(0.1, 0.2, 0.3),
                          fracs = fracs,
                          notes = c("1st<br>Lockdown", "2nd<br>Lockdown", "3rd<br>Lockdown"),
                          colors = (c(phs_colours("phs-teal"), phs_colours("phs-purple"),
                                      phs_colours("phs-blue"))))

  }
  return(p)

}


camhs_plot_stacked_bar = function(data) {
  data %>%
    mutate(wait_time = factor(wait_time, levels = c("0 to 18 weeks",
                                                    "19 to 35 weeks",
                                                    "36 to 52 weeks",
                                                    "Over 52 weeks"))) %>%
    plot_ly(x=~date,
            y=~proportion*100,
            color = ~wait_time,
            type = 'bar',
            colors = palette_camhs,
            marker = list(line = list(width=1,
                                      color = 'rgb(0,0,0)')),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          data$wait_time, "<br>",
                          "Proportion of patients seen: ",
                          scales::percent(data$proportion, accuracy = .1),"<br>",
                          "Number of patients seen: ",
                          format(data$number, big.mark = ",")),
            hoverinfo = "text") %>%
    layout(barmode = "stack",
           bargap = 0,
           xaxis = xaxis_month,
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(bgcolor = "#E2E2E2",
                         title = list(
                           text = "Filter wait time")
           )) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}


##############################################.
# Positive desinations of school leavers----
##############################################.

school_leavers_plot_line = function(data) {
  data %>%
    plot_ly(x=~financial_year,
            y=~percent,
            type="scatter",
            mode="lines+markers",
            color = data$characteristic,
            colors = palette,
            text = paste0(data$characteristic, "<br>", data$financial_year, "<br>",
                          "School leavers (%)", data$percent,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Financial year"),
           yaxis = list(title = "School leavers (%)", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# PROTECTION FROM HARM----
##############################################.


protection_from_harm_line_chart = function(data) {

  protect_median = data %>%
    summarise(Median = median(Value)) %>%
    .$Median

  p = data %>%
    plot_ly() %>%
    add_trace(x=~date_end,
              y=~Value,
              type="scatter",
              mode="lines+markers",
              line = list(color = palette[1]),
              marker = list(color = palette[1]),
              showlegend = F,
              text = paste0("Date range: ", format(data$date_start, "%d %B %Y"),
                            " to ",
                            format(data$date_end, "%d %B %Y"), br(),
                            "Number of children: ", data$Value),
              hoverinfo = 'text') %>%
    add_segments(x=min(data$date_end),
                 xend=max(data$date_end),
                 type = "scatter",
                 mode = "lines",
                 inherit = F,
                 y=protect_median,
                 yend = protect_median,
                 name = "Median",
                 line = list(color = palette[3], type = "dash"),
                 showlegend = T) %>%
    layout(xaxis = list(title = "Fortnight Ending (Wednesdays)",
                        type = 'date',
                        tickformat = "%b<br>%Y",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE,
                        fixedrange=TRUE),
           yaxis = list(title = "Number of children subject to\ninteragency referral discussions",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE,
                        fixedrange=TRUE,
                        range = c(0,max(data$Value)),
                        showlegend = T)) %>%
             config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  p %<>%
    add_vline_seg(., "2020-03-20", data$Value, "Schools to close (COVID-19 measures)", phs_colours("phs-rust"), group = "Schools close (COVID-19 measures)") %>%
    add_vline_seg(., "2020-08-11", data$Value, "Pupils return to school (COVID-19 measures)", phs_colours("phs-teal"), group = "Schools reopen (COVID-19 measures)") %>%
    add_vline_seg(., "2021-01-05", data$Value, "Schools to close (COVID-19 measures)", phs_colours("phs-rust"), group = "Schools close (COVID-19 measures)") %>%
    add_vline_seg(., "2021-03-15", data$Value, "Pupils return to school (COVID-19 measures)", phs_colours("phs-teal"), group = "Schools reopen (COVID-19 measures)")




  return(p)

}



##############################################.
# FUEL POVERTY----
##############################################.

fuel_afford_plot_line = function(data, title = NULL) {
  plot = data %>%
    plot_ly(x=~date_code,
            y=~value,
            type="scatter",
            mode="lines+markers",
            color = data$fuel_poverty,
            colors = palette,
            text = paste0(data$fuel_poverty, "<br>", data$date_code, "<br>",
                          "Percentage of household: ", data$value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Percentage of household", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}
#yaxis = yaxis_proportion




##############################################.
# MANAGING FINANCIALLY----
##############################################.

managing_financially_plot_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig %<>% add_trace(x=~Category,
                     y=~Percent,
                     type="bar",
                     name = "Managing financially",
                     textposition = "outside",
                     texttemplate = '%{y:s}%',
                     #textfont = list(size = 10),
                     text = ~Percent,
                     hovertemplate = paste0("Category: ", data$Answer, "<br>",
                                            "Percentage of household (%): ", "%{text}%"))

  fig %<>%
    layout(xaxis = list(title = "Category"),
           yaxis = list(title = "Percentage of household (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = FALSE,
           uniformtext=list(minsize=8, mode='show'),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}

##############################################.
# UNMANAGEABLE DEBT----
##############################################.

unmanageable_debt_plot_line = function(data, title = NULL) {
  max_y_value = max(data$perc_with_problem_debt)
  data %>%
    plot_ly(x=~year,
            y=~perc_with_problem_debt,
            type="scatter",
            mode="lines+markers",
            color = NULL,
            colors = palette,
            text = paste0("Percentage of household with unmanageable debt", "<br>", data$year, "<br>",
                          "Percentage of household: ", data$perc_with_problem_debt,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Percentage of household", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}

##############################################.
# SAVINGS----
##############################################.

savings_plot_stacked_bar = function(data) {

  data %>%
    plot_ly(x=~year,
            y=~percentage,
            color = ~savings,
            type = 'bar',
            colors = palette_camhs,
            marker = list(line = list(width=1,
                                      color = 'rgb(0,0,0)')),
            text = paste0("Year: ",data$year, "<br>",
                          "Savings: ", data$savings, "<br>",
                          "Percentage of household: ",
                          scales::percent(data$percentage*0.01, accuracy = .1)),
            hoverinfo = "text",
            textposition = "none") %>%
    layout(barmode = "stack",
           bargap = 0,
           xaxis = list(title = "Year",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        dtick = 1),
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))
           ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}



savings_low_income_plot_line = function(data, title = NULL, color_column = NULL, indicator_name = "Value") {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }

  #indicator_name = "Proportion (%): "

  data %>%
    plot_ly(x=~year,
            y=~percentage,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          indicator_name, data$percentage,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = indicator_name, range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# HOUSEHOLD EXPENDITURE----
##############################################.

household_expenditure_barplot = function(data) {

  data %>%
    plot_ly(x=~household_spending,
            y=~scotland,
            color=~year,
            type = 'bar',
            text = paste0("Time period: ", data$year, "<br>",
                          "Proportion of total household expenditure (",
                          data$household_spending, "): ", data$scotland, "%"),
            hoverinfo='text',
            colors = c(palette[2], palette[5])) %>%
    layout(yaxis = yaxis_proportion,
           xaxis = list(title = "Household Spending",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE,
                        fixedrange=TRUE),
           legend = list(title = list(text = "Time Period (Financial Years)"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}

##############################################.
# CHILDCARE UPTAKE----
##############################################.

childcare_uptake_plot <- function(data) {

  data %>%
    plot_ly(x = ~date,
            y = ~percent*100,
            color = ~breakdown,
            type="scatter",
            mode="lines+markers",
            colors = c(palette[2], palette[3]),
            text = paste0("Collection date: ", data$date, "<br>",
                          "Proportion (%): ",
                          scales::percent(data$percent, accuracy = .1),
                          "<br>",
                          "Number of eligible children accessing 1140 hours of funded ELC: ",
                          format(data$n, big.mark = ",")),
            hoverinfo = "text",
            textposition="none") %>%
    layout(yaxis = yaxis_proportion,
           xaxis = xaxis_month) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}






##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

employees_living_wage_plot_line = function(data, title = NULL, color_column = NULL) {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }



  data %>%
    plot_ly(x=~year,
            y=~measure_value,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Sector: ", color_column_option, "<br>",
                          "Year: ", data$year, "<br>",
                          "Proportion (%): ", data$measure_value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Proportion (%)", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# GENDER PAY GAP----
##############################################.


gender_pay_gap_plot_line = function(data, title = NULL, second_axis = FALSE) {

  fig = data %>%
    plot_ly(x=~year,
            y=~`Pay Gap`,
            type="scatter",
            mode="lines+markers",
            name = "Pay Gap \n(Woman/Men) (%)",
            #color = color_column_option,
            #colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Pay Gap (Woman/Men) (%): ", data$`Pay Gap`,"% <br>"),
            hoverinfo = "text")

  if(second_axis)
  {
    fig = fig %>% add_trace(x=~year,
                            y=~Men,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Men (£)",
                            line = list(dash = 'dash'),
                            text = paste0("Year: ", data$year, "<br>",
                                          "Men Median Hourly Earnings (£): ", data$Men," <br>"),
                            hoverinfo = "text")
    fig = fig %>% add_trace(x=~year,
                            y=~Woman,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Women (£)",
                            line = list(dash = 'dash'),
                            text = paste0("Year: ", data$year, "<br>",
                                          "Women Median Hourly Earnings (£): ", data$Men," <br>"),
                            hoverinfo = "text")  %>%
      layout(yaxis2 =  list(title = "Median Hourly Earnings (£)",
                            overlaying = "y",
                            side = "right",
                            rangemode="tozero",
                            #gridcolor = "blue",
                            showgrid = FALSE))


  }

  fig = fig %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Pay Gap (Woman/Men) (%)", range = c(-100,100), ticksuffix = "%"),
           title = title,
           showlegend = TRUE,
           legend = list(x = 1.2, y = 1, bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig

}


##############################################.
# DISABILITY EMPLOYMENT GAP----
##############################################.

disability_employment_gap_line_bar = function(data, title = NULL) {

  fig = data %>%
    plot_ly()

  fig = fig %>% add_trace(x=~year,
                          y=~`Not Equality Act Disabled`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Not Equality Act Disabled",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Not Equality Act Disabled",  "<br>",
                                        "Employment Rate (%): ", data$`Not Equality Act Disabled`,"% <br>"),
                          hoverinfo = "text")
  fig = fig %>% add_trace(x=~year,
                          y=~`Equality Act Disabled`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Equality Act Disabled",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Equality Act Disabled",  "<br>",
                                        "Employment Rate (%): ", data$`Equality Act Disabled`,"% <br>"),
                          hoverinfo = "text")

  fig = fig %>% add_trace(x=~year,
                          y=~`Disability Employment Gap`,
                          type="bar",
                          name = "Disability Employment Gap",
                          base = ~`Equality Act Disabled`,
                          textposition = "inside",
                          texttemplate = '%{y:s}%',
                          insidetextanchor = "middle",
                          text = ~`Disability Employment Gap`,
                          hovertemplate = paste0("Year: ", data$year, "<br>",
                                                 "Disability Employment Gap (%): ", "%{text}%"))

  fig %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Employment Rate (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = TRUE,
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



disability_employment_gap_plot_line = function(data, title = NULL, color_column = NULL, indicator_name = "Value") {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }

  #indicator_name = "Proportion (%): "

  data %>%
    plot_ly(x=~year,
            y=~measure_value,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          indicator_name, data$measure_value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = indicator_name, range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# ETHNICITY EMPLOYMENT GAP----
##############################################.


ethnicity_employment_gap_line_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig = fig %>% add_trace(x=~year,
                          y=~White,
                          type="scatter",
                          mode="lines+markers",
                          name = "White",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Ethnicity: White",  "<br>",
                                        "Employment Rate (%): ", data$White,"% <br>"),
                          hoverinfo = "text")
  fig = fig %>% add_trace(x=~year,
                          y=~`Minority Ethnic`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Minority Ethnic",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Ethnicity: Minority Ethnic",  "<br>",
                                        "Employment Rate (%): ", data$`Minority Ethnic`,"% <br>"),
                          hoverinfo = "text")

  fig = fig %>% add_trace(x=~year,
                          y=~`Ethnicity Employment Gap`,
                          type="bar",
                          name = "Ethnicity Employment Gap",
                          base = ~`Minority Ethnic`,
                          textposition = "inside",
                          texttemplate = '%{y:s}%',
                          insidetextanchor = "middle",
                          text = ~`Ethnicity Employment Gap`,
                          hovertemplate = paste0("Year: ", data$year, "<br>",
                                                 "Ethnicity Employment Gap (%): ", "%{text}%"))

  fig %>%
    layout(xaxis = list(title = "Financial year"),
           yaxis = list(title = "Employment Rate (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = TRUE,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}




##############################################.
# EMPLOYABILITY----
##############################################.


quarterStart <- function(x) {
  x <- as.POSIXlt(x)
  x <- quarter(x, type = "date_first", fiscal_start = 1)
  as.Date(x)
}





plot_funnel_layers = function(data_raw, v_y_col, v_name, v_color = NULL, V_funnel_width = NULL) {
  data = data_raw %>%
    summarise_at(v_y_col, ~sum(., na.rm = TRUE)) %>%
    pivot_longer(everything())


  fig <- plot_ly()
  fig %<>%
    add_trace(type = "funnel",
              y = v_name,
              x = data$value,
              textposition = "inside",
              textinfo = "value+percent initial",
              opacity = 0.65,
              marker = list(color = v_color),
              connector = list(line = list(color = "rgb(127, 127, 127)",  width = 1)))
  fig %<>%
    layout(yaxis = list(categoryarray = v_name))

  fig
}



plot_line_with_bar = function(data, x_col, v_y_col,
                              v_color = NULL,
                              v_name = NULL,
                              v_bar_width = NULL,
                              xaxisTitle = NULL,
                              with_bar = TRUE)
{

  fig = data %>%
    plot_ly()

  for (i in 1:length(v_y_col))
  {
    name = v_name[i]
    y_col = v_y_col[i]
    color = v_color[i]
    bar_width = v_bar_width[i]
    fig %<>%
      add_trace(x=data[[x_col]],
                y=data[[y_col]],
                type="scatter",
                name = name,
                mode="lines+marker",
                line = list(color= color),
                #marker = list(color= color),
                opacity = 1,
                text = paste0( data[[x_col]], "<br>",
                               name, ": ", data[[y_col]]),
                #stackgroup = 'one',
                #fillcolor = '#1F77B4',
                hoverinfo = "text")

    if (with_bar)
    {
      fig %<>%
        add_trace(x=data[[x_col]],
                  y=data[[y_col]],
                  type="bar",
                  name = "--",
                  opacity = 0.5,
                  text = paste0( data[[x_col]], "<br>",
                                 name, ": ", data[[y_col]]),
                  marker = list(color=  color),
                  width = bar_width,
                  hoverinfo = "text")
    }

  }

  fig %<>%
    layout(xaxis = list(title = xaxisTitle),
           yaxis = list(title = "Number of people", rangemode="tozero"),
           showlegend = TRUE,
           #bargap  = 0.1,
           barmode='overlay',
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))
    ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}

##############################################.
# ZERO-HOURS CONTRACTS----
##############################################.

zero_hours_contracts_plot_line = function(data) {


  data %>%
    plot_ly(x=~date,
            y=~percent_of_people,
            type="scatter",
            mode="lines+markers",
            text = paste0(data$date, "<br>",
                          "Percentage (%)", data$percent_of_people,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Quarter"),
           yaxis = list(title = "Percentage (%)", range = c(0,100), ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}


zero_hours_contracts_plot_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig %<>% add_trace(x=~date,
                     y=~percent_of_people,
                     type="bar",
                     name = "Zero-hours contracts",
                     textposition = "outside",
                     texttemplate = '%{y:s}%',
                     #textfont = list(size = 10),
                     text = ~percent_of_people,
                     hovertemplate = paste0("Quarter: ", data$date, "<br>",
                                            "Zero-hour Contracts (%): ", "%{text}%"))

  fig %<>%
    layout(xaxis = list(title = "Quarter"),
           yaxis = list(title = "Zero-hour Contracts (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = FALSE,
           uniformtext=list(minsize=8, mode='show'),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}

##############################################.
# SKILLS SHORTAGE VACANCIES----
##############################################.

plot_skills_shortage <- function(data) {

  fig = data %>%
    plot_ly(x = ~year,
            y = ~percent*100,
            color = ~vacancy_type,
            type = "bar",
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Proportion (%): ",
                          scales::percent(data$percent, accuracy = .1),
                          "<br>",
                          "Number of Vacancies: ",
                          format(data$n_vacancies, big.mark = ",")),
            hoverinfo = "text",
            textposition="none") %>%
    layout(yaxis = yaxis_proportion,
           xaxis = xaxis_year) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}


##############################################.
# ECONOMIC INACTIVITY----
##############################################.

plot_economic_inactivity <- function(data) {

  fig = data %>%
    plot_ly(x = ~year,
            y = ~percent,
            color = ~breakdown,
            type="scatter",
            mode="lines+markers",
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Proportion (%): ",
                          data$percent, "%",
                          "<br>",
                          "Number of Vacancies: ",
                          format(data$n, big.mark = ",")),
            hoverinfo = "text",
            textposition="none") %>%
    layout(yaxis = yaxis_proportion,
           xaxis = xaxis_year) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}



##############################################.
# UNDEREMPLOYMENT----
##############################################.


line_plot_with_marker = function(data, x_col, y_col,  x_axis_title = "X", y_axis_title = "Y") {

  data %>%
    plot_ly(x=data[[x_col]],
            y=data[[y_col]],
            type="scatter",
            mode="lines+markers",
            text = paste0(x_axis_title, ": ", data[[x_col]], "<br>",
                          y_axis_title, ": ", data[[y_col]],"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = x_axis_title),
           yaxis = list(title = y_axis_title, range = c(0,100), ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}



##############################################.
# TABLES ----
##############################################.

# Inputs:
# data = the data table you'd like to style in DT
# names = a vector of stylised names. leave blank if pre-prepared
datatable_style_summary = function(data, names=NA) {
  if (!is.na(names)) {
    names(data) = names
  }

  data %>%
    DT::datatable(rownames = FALSE,
                  filter = "none",
                  options = list(
                    pageLength = 12,
                    dom="t",
      initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#C5C3DA',
        'color': '#3F3685'});",
        "}")

    )) %>%
    formatStyle(., columns = 1,
                fontWeight = "bold",
                color = "#3F3685",
                backgroundColor = "#C5C3DA") %>%
    formatStyle(., columns = 2:6,
                color = "#0078D4")
}

datatable_style_download = function(data,
                                    datetype = "month",
                                    data_name,
                                    geogtype = "health_board") {

  # Set NULL as standard in case none
  decimals = NULL
  commas = NULL

  if(datetype == "month") {
    data  %<>%
      mutate(date = format(date, "%B %Y"))
  }

  if(data_name == "camhs") {
    decimals = c(6)
    commas = c(3, 5)
  } else if (data_name == "infant") {
    decimals = c(5)
    commas = c(3, 4)
  } else if(data_name == "preschool") {
    decimals = c("Proportion")
    commas = c("Number Of Reviews", "Concern Any")
  } else if (data_name == "child_poverty") {
    decimals = c("Proportion Of People In Relative Poverty")
    commas = NULL
    data %<>%
      rename("Proportion Of People In Relative Poverty" = "proportion")
  } else if (data_name == "fuel_number") {
    decimals = NULL
    commas = c(5)
  } else if (data_name == "employees_living_wage") {
    decimals = NULL
    commas = c(5)
  } else if (data_name == "gender_pay_gap") {
    decimals =  NULL
    commas = c(5)
  } else if (data_name == "disability_employment_gap") {
    decimals =  NULL
    commas = c(4)
    data %<>%
      select(-c(ca2019))
  } else if (data_name == "ethnicity_employment_gap_chart") {
    decimals =  NULL
    commas = c(4)

  } else if (data_name == "unmanageable_debt") {
    decimals =  NULL
    commas = NULL

    data %<>%
      rename("household with unmanageable debt (%)" = "perc_with_problem_debt")

  } else if (data_name == "savings_low_income") {
    decimals =  NULL
    commas = c(5)
    data %<>%
      select(-c(ca2019))
  } else if(data_name == "childcare_uptake") {

    commas = c(2,3)
    data %<>%
      mutate(percent = round(percent*100, 1))

  } else if (data_name == "employability_FSS_referral") {
    decimals =  NULL
    commas = c(2,3)
    data %<>%
      mutate(start_rate = start_rate*100) %>%
      rename(start_rate_percentage = start_rate)
  } else if (data_name == "skills_shortage_vacancies") {


  } else if (data_name == "zero_hour_contracts") {


  } else if (data_name == "economic_inactivity") {

    commas = c(4)
    decimals = NULL

  } else if (data_name == "underemployment") {

    decimals = c(3)

  } else if (data_name == "school_leavers") {

    decimals = c(4)
  } else if (data_name == "all_cause_mortality") {
    decimals = c(7)
    commas = c(3)
  }

  names(data) = names(data) %>%
    gsub("_", " ", .) %>%
    str_to_title(.)

  if (geogtype == "health_board") {
    data %<>%
      rename("Health Board" = "Hb2019name")
  }

  data %>%
    pretty_big_numbers(., columns = commas) %>%
    pretty_decimal_numbers(., columns = decimals) %>%
    DT::datatable(rownames = FALSE,
                  extensions = 'Buttons',
                  options = list(
                    dom = "Btp",
                    buttons = c('csv', 'excel'),
                    initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#C5C3DA',
                      'color': '#3F3685'});",
                      "}"
                    )
                  ),
                  filter = "top",
                  style = 'bootstrap')

}