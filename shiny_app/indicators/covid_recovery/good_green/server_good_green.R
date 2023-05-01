##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

## lines overall
output$employees_living_wage_line = renderPlotly({

  measure_option = "proportion"
  earning_option = "Earning less than the living wage"

  plot_data = employees_living_wage_by_sector %>%
    filter(measure == measure_option,
           earning == earning_option)


  employees_living_wage_plot_line(plot_data, color_column = "sector")

})



# map
employees_living_wage_option = "Earning less than the living wage"

#add the values to the LA shapes
employees_living_wage_by_LA_ind = employees_living_wage_by_LA %>%
  filter(earning == employees_living_wage_option) %>%
  select(year, local_authority, ca2019, measure_value)


employees_living_wage_las_shape = pub_las_simplified

# value for storing the selected LA; initialized with Scotland geometry
rv_employees_living_wage = reactiveVal("S92000003")


## if the 'Trend for scotland' button is pressed
observeEvent(input$employees_living_wage_map_button, {
  rv_employees_living_wage("S92000003")
})


LA_Look_up = employees_living_wage_by_LA %>%
  select(local_authority, ca2019) %>%
  unique()

## create a list and assign the council area code to it's respective name
LA_Look_up_list = list()

for (i in 1:nrow(LA_Look_up))
{
  LA_Look_up_list[LA_Look_up$local_authority[i]] = LA_Look_up$ca2019[i]
}


# output$employees_living_wage_LA_ui = renderUI({
#
#   #employees_living_wage_LA_selected = "Scotland"
#   selectizeInput("employees_living_wage_LA_input",
#                  label = "Select local authority for trend:",
#                  choices = LA_Look_up_list, #LA_Look_up$local_authority,
#                  selected = "S92000003")
# })
#
# observe({
#   # print(input$employees_living_wage_LA_input)
#   rv_employees_living_wage(input$employees_living_wage_LA_input)
# })


output$employees_living_wage_map = renderLeaflet({

  employees_living_wage_by_LA_ind_year = employees_living_wage_by_LA_ind %>%
    filter(year == input$employees_living_wage_year_input)

  employees_living_wage_las_shape@data = employees_living_wage_las_shape@data %>%
    left_join(employees_living_wage_by_LA_ind_year , by = c("code" = "ca2019"))

  # features of the map
  bins = c(0, 10, 15, 20, 25, 30, 35, 40, 100)
  pal = colorBin("YlOrRd", domain = employees_living_wage_las_shape$measure_value, bins = bins)
  indicator_name = tolower(employees_living_wage_option)
  labels <- sprintf(
    "<strong>%s</strong><br/> Employees %s (%%): %g%%",
    employees_living_wage_las_shape@data[["local_authority"]], indicator_name, employees_living_wage_las_shape@data[["measure_value"]]
  ) %>%
    lapply(htmltools::HTML)


  leaflet(employees_living_wage_las_shape, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
    setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
    addTiles() %>%
    addPolygons(weight = 1, smoothFactor = 0.5,
                fillColor = ~pal(measure_value),
                opacity = 0.5, fillOpacity = 0.7,
                color = "white",
                dashArray = "3",
                popup = labels,
                highlightOptions =  highlightOptions(color = "white", weight = 2,
                                                     bringToFront = TRUE),
                layerId = ~code) %>%
    addLegend("bottomright", pal = pal, values = ~measure_value,
              title = paste0("Percent of Employees (%)", "<br> in ", input$employees_living_wage_year_input),
              labFormat = labelFormat(suffix  = "%"),
              opacity = 1
    )
}
)

# update the varible rv_fuel_poverty
observeEvent(input$employees_living_wage_map_shape_click,{
  rv_employees_living_wage(input$employees_living_wage_map_shape_click$id)

  updateSelectizeInput(session, "employees_living_wage_cr_LA_input",
                       #label = paste("Select input label", length(x)),
                       choices = input$employees_living_wage_map_shape_click$id)
})


# plot trend

  output$employees_living_wage_line_LA = renderPlotly({

    employees_living_wage_line_LA_data = employees_living_wage_by_LA_ind %>%
      filter(ca2019  == rv_employees_living_wage())


    title = employees_living_wage_line_LA_data$local_authority %>% unique()
    employees_living_wage_plot_line(employees_living_wage_line_LA_data, title = title)
  })

  output$employees_living_wage_cw_line_LA = renderPlotly({

    employees_living_wage_cw_line_LA_data = employees_living_wage_by_LA_ind %>%
      filter(ca2019  == rv_employees_living_wage_cw())


    title = employees_living_wage_cw_line_LA_data$local_authority %>% unique()
    make_employees_living_wage_cw_line_plot(employees_living_wage_cw_line_LA_data, title = title)
  })



  living_wage_sector <- employees_living_wage_by_sector %>%
    filter(measure == "proportion") %>%
    mutate(local_authority = "Scotland",
           ca2019 = "S92000003") %>%
    select(year, ca2019, local_authority, sector, earning, measure_value) %>%
    rename("Proportion of employees" = "measure_value")

  living_wage_la <- employees_living_wage_by_LA %>%
    filter(local_authority != "Scotland") %>%
    filter(measure == "proportion") %>%
    mutate(sector = "All") %>%
    select(year, ca2019, local_authority, sector, earning, measure_value) %>%
    rename("Proportion of employees" = "measure_value")

  living_wage_all <- bind_rows(living_wage_sector, living_wage_la) %>%
    arrange(year, sector, earning) %>%
    filter(earning == "Earning less than the living wage") %>%
    select(-earning)

  living_wage_scotland <- living_wage_all %>%
    filter(local_authority == "Scotland") %>%
    mutate(year = factor(year),
           sector = factor(sector)) %>%
    select(-ca2019)

  dataDownloadServer(data = living_wage_scotland, data_download = living_wage_all,
                     id = "living_wage", filename = "living_wage",
                     add_separator_cols_1dp = c(4))

  output$living_wage_table_title <- renderText({
    glue("Data table: Proportion of employees (18+) earning less than the real Living Wage by sector in Scotland")
  })

  observeEvent(input$employees_living_wage_map_button, {

    dataDownloadServer(data = living_wage_scotland, data_download = living_wage_all,
                       id = "living_wage", filename = "living_wage",
                       add_separator_cols_1dp = c(4))

    output$living_wage_table_title <- renderText({
      glue("Data table: Proportion of employees (18+) earning less than the real Living Wage by sector in Scotland")
    })

  })

  observeEvent(input$employees_living_wage_map_shape_click$id,{

    living_wage_la <- living_wage_all %>%
      filter(ca2019 == rv_employees_living_wage()) %>%
      mutate(year = factor(year),
             sector = factor(sector)) %>%
      select(-ca2019)

    dataDownloadServer(data = living_wage_la, data_download = living_wage_all,
                       id = "living_wage", filename = "living_wage",
                       add_separator_cols_1dp = c(4))

    la_selected <- unique(living_wage_la$local_authority)

    output$living_wage_table_title <- renderText({
      glue("Data table: Proportion of employees (18+) earning less than the real Living Wage in ", la_selected)
    })

  })

##############################################.
# GENDER PAY GAP----
##############################################.


output$gender_pay_gap_plot_line_output = renderPlotly({

  sector_option = input$gender_pay_gap_sector_radio
  work_pattern_option = input$gender_pay_gap_work_radio


  gender_pay_gap_by_sector_pattern = gender_pay_gap_by_sector %>%
    filter(work_pattern == work_pattern_option)

  gender_pay_gap_by_sector_line_data = gender_pay_gap_by_sector_pattern %>%
    filter(sector == sector_option)

  plot_data =gender_pay_gap_by_sector_line_data %>%
    pivot_wider(names_from = gender, values_from = measure_value)



  add_Earning = input$gender_pay_gap_show_earnings_check_box
  gender_pay_gap_plot_line(plot_data, second_axis = add_Earning)

})



observeEvent(input$gender_pay_gap_sector_radio, {

  observeEvent(input$gender_pay_gap_work_radio, {

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender == "Pay Gap") %>%
      select(year, sector, work_pattern, measure_value) %>%
      rename("Gender Pay Gap (%)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_sector_radio) %>%
      filter(work_pattern == input$gender_pay_gap_work_radio)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap", filename = "gender_pay_gap")
  })
})

observeEvent(input$gender_pay_gap_sector_radio, {

  observeEvent(input$gender_pay_gap_work_radio, {

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender != "Pay Gap") %>%
      select(year, sector, work_pattern, gender, measure_value) %>%
      rename("Median Hourly Earnings (£)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_sector_radio) %>%
      filter(work_pattern == input$gender_pay_gap_work_radio)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap_earnings", filename = "gender_pay_gap_earnings")
  })
})


observeEvent(input$gender_pay_gap_tabBox, {
  observeEvent(input$gender_pay_gap_sector_radio, {
    observeEvent(input$gender_pay_gap_work_radio, {

      string_tab <- ifelse(input$gender_pay_gap_tabBox == "Earnings",
                           "Data table: Median Hourly Earnings (£) by gender - ",
                           "Data table: Gender pay gap (%) - ")
      string_sector <- ifelse(input$gender_pay_gap_sector_radio == "All",
                              "all sectors, ",
                              tolower(paste0(input$gender_pay_gap_sector_radio, " sector, ")))
      string_work <- tolower(paste0(input$gender_pay_gap_work_radio, " work patterns"))

      output$gender_pay_gap_table_title <- renderText({glue(string_tab, string_sector, string_work)})
    })
  })
})

##############################################.
# DISABILITY EMPLOYMENT GAP----
##############################################.




disability_employment_gap_option = "Disability Employment Gap"
disability_employment_gap_data_cat = disability_employment_gap_data %>%
  filter(category == disability_employment_gap_option)

disability_employment_gap_indicator_name = paste0(disability_employment_gap_option," (%)")

#add the values to the LA shapes
rv_disability_employment_gap = reactiveVal("S92000003")

disability_employment_gap_choices = disability_employment_gap_data_cat$year %>%
  unique() %>%
  sort()

output$disability_gap_ui_map = renderLeaflet({

  las_shape_map_data = pub_las_simplified

  disability_employment_gap_data_cat_year = disability_employment_gap_data_cat %>%
    filter(year == input$disability_employment_gap_input)


  las_shape_map_data@data = las_shape_map_data@data %>%
    left_join(disability_employment_gap_data_cat_year , by = c("code" = "ca2019"))

  # features of the map
  bins = c(10, 15, 20, 25, 30, 35, 40, 45, 50, 100)
  pal = colorBin("YlOrRd", domain = las_shape_map_data$measure_value, bins = bins)

  labels <- sprintf(
    "<strong>%s</strong>
    <br/> %s: %g%%",
    las_shape_map_data@data[["local_authority"]], disability_employment_gap_indicator_name, las_shape_map_data@data[["measure_value"]]
  ) %>%
    lapply(htmltools::HTML)


  leaflet(las_shape_map_data, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
    setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
    addTiles() %>%
    addPolygons(weight = 1, smoothFactor = 0.5,
                fillColor = ~pal(measure_value),
                opacity = 0.5, fillOpacity = 0.7,
                color = "white",
                dashArray = "3",
                popup = labels,
                highlightOptions =  highlightOptions(color = "white", weight = 2,
                                                     bringToFront = TRUE),
                layerId = ~code) %>%
    addLegend("bottomright", pal = pal, values = ~measure_value,
              title = paste0(disability_employment_gap_indicator_name, "<br>in ", input$disability_employment_gap_input),
              labFormat = labelFormat(suffix  = "%"),
              opacity = 1)
})


observeEvent(input$disability_employment_gap_button, {
  rv_disability_employment_gap("S92000003")
})


observeEvent(input$disability_gap_ui_map_shape_click,{
  rv_disability_employment_gap(input$disability_gap_ui_map_shape_click$id)
})





disability_employment_gap_data_wider = disability_employment_gap_data %>%
  pivot_wider(names_from = category, values_from = measure_value)

output$disability_gap_bar_line_LA = renderPlotly({
  plot_data = disability_employment_gap_data_wider %>%
    filter(ca2019 == rv_disability_employment_gap())

  title = plot_data$local_authority %>% unique()
  disability_employment_gap_line_bar(plot_data, title = title)

})


output$disability_employment_gap_line_LA = renderPlotly({

  disability_employment_gap_line_LA_data = disability_employment_gap_data_cat %>%
    filter(ca2019  == rv_disability_employment_gap())

  title = disability_employment_gap_line_LA_data$local_authority %>% unique()


  disability_employment_gap_plot_line(disability_employment_gap_line_LA_data,
                                      title = title,
                                      indicator_name = disability_employment_gap_indicator_name)
})


disability_all <- disability_employment_gap_data %>%
  select(year, ca2019, local_authority, category, measure_value) %>%
  arrange(year, ca2019, local_authority, category) %>%
  mutate(category = ifelse(category != "Disability Employment Gap",
                           paste0(category, " employment rate (%)"),
                           "Disability Employment Gap (%)")) %>%
  pivot_wider(names_from = "category", values_from = "measure_value")

disability_scotland <- disability_all %>%
  filter(local_authority == "Scotland") %>%
  mutate(year = factor(year)) %>%
  select(-ca2019)

dataDownloadServer(data = disability_scotland, data_download = disability_all,
                   id = "disability_employment_gap", filename = "disability_employment_gap",
                   add_separator_cols_1dp = c(3,4,5))

output$disability_employment_gap_table_title <- renderText({
  glue("Data table: Disability employment gap in Scotland")
})

observeEvent(input$disability_employment_gap_button, {

  dataDownloadServer(data = disability_scotland, data_download = disability_all,
                     id = "disability_employment_gap", filename = "disability_employment_gap",
                     add_separator_cols_1dp = c(3,4,5))

  output$disability_employment_gap_table_title <- renderText({
    glue("Data table: Disability employment gap in Scotland")
  })

})

observeEvent(input$disability_gap_ui_map_shape_click$id,{

  disability_la <- disability_all %>%
    filter(ca2019 == rv_disability_employment_gap()) %>%
    mutate(year = factor(year)) %>%
    select(-ca2019)

  dataDownloadServer(data = disability_la, data_download = disability_all,
                     id = "disability_employment_gap", filename = "disability_employment_gap",
                     add_separator_cols_1dp = c(3,4,5))

  la_selected <- unique(disability_la$local_authority)

  output$disability_employment_gap_table_title <- renderText({
    glue("Data table: Disability employment gap in ", la_selected)
  })

})

##############################################.
# ETHNICITY EMPLOYMENT GAP----
##############################################.


output$ethnicity_employment_gap_line_bar_figure = renderPlotly({
  plot_data = ethnicity_employment_gap_chart_data %>%
    mutate( `Ethnicity Employment Gap` =  round_half_up(`Ethnicity Employment Gap`, 0))

  ethnicity_employment_gap_line_bar(plot_data)
})


output$ethnicity_employment_gap_chart_data = DT::renderDataTable({

  datatable_style_download(ethnicity_employment_gap_chart_data,
                           datetype = "year",
                           data_name = "ethnicity_employment_gap_chart",
                           geogtype = "none")
})

ethnicity_employment_gap_chart_data %>%
  rename("Financial Year" = "year",
         "White employment rate (%)" = "White",
         "Minority ethnic employment rate (%)" = "Minority Ethnic",
         "Ethnicity Employment Gap (%)" = "Ethnicity Employment Gap") %>%
  dataDownloadServer(id = "ethnicity_employment_gap", filename = "ethnicity_employment_gap",
                   add_separator_cols_1dp = c(2,3,4))


##############################################.
# EMPLOYMENT GAP UIs----
##############################################.

# output$disability_gap_ui = renderUI({

# tagList(
#
#     h3("Disability employment gap by local authority"),
#
#     bsButton("disabilityemploymentgap_to_info", "Go to information page"),
#
#     br(),
#     br(),
#
#
#              actionButton(
#                "disability_employment_gap_modal_info",
#                tags$b("Background information and source"),
#                icon = icon_no_warning_fn("info-circle")
#              ),
#
#              actionButton(
#                "disability_employment_gap_modal_comment",
#                tags$b("Summary of indicator during covid and pre-covid period"),
#                icon = icon_no_warning_fn("info-circle")
#              ),
#     br(),
#
#     fluidRow(
#       column(6,
# selectizeInput("disability_employment_gap_input",
#                label = "Select year to view on heatmap:",
#                choices = disability_employment_gap_choices,
#                selected = max(disability_employment_gap_choices))#),
#       column(6,
#              actionButton("disability_employment_gap_button", "Trend for Scotland"))
#     ),
#     fluidRow(
#       column(12,
#              tags$b("Select a local authority on the map to view local trend:")),
#       column(6,
#              withSpinner(leafletOutput("disability_gap_ui_map"))),
#       column(6,
#              #withSpinner(plotlyOutput("disability_employment_gap_line_LA"))
#              withSpinner(plotlyOutput("disability_gap_bar_line_LA"))
#
#       )
#     ),
#
#
#       h3("Data table"),
#       withSpinner(DT::dataTableOutput("disability_gap_data_table"))
# )
# })

# output$ethnicity_gap_ui = renderUI({
#
#   tagList(
#
#     # tabPanel(title = "Ethnicity employment gap",
#     #          value = "ethnicity_employment_gap",
#
#
#              bsButton("ethnicityemploymentgap_to_info", "Go to information page"),
#
#              br(),
#
#                       actionButton(
#                         "ethnicity_employment_gap_modal_info",
#                         tags$b("Background information and source"),
#                         icon = icon_no_warning_fn("info-circle")
#                       ),
#
#
#                       actionButton(
#                         "ethnicity_employment_gap_modal_comment",
#                         tags$b("Summary of indicator during covid and pre-covid period"),
#                         icon = icon_no_warning_fn("info-circle")
#                       ),
#
#                       withSpinner(plotlyOutput("ethnicity_employment_gap_line_bar_figure")),
#
#              br(),
#
#              div("Before to the pandemic the ethnicity employment gap had been consistently increases, reaching 18% in the year prior to the pandemic. From 2020 onward the gap has been decreasing, falling to 8.2% in 2020/21.",
#              br(),
#              "This was largely driven by employment in the working age white population falling post pandemic and the employment rate in the minority ethnic population  increasing."
#              ),
#
#                h3("Data table"),
#                withSpinner(DT::dataTableOutput("ethnicity_employment_gap_chart_data"))
#   )
# })




##############################################.
# ZERO-HOURS CONTRACTS----
##############################################.




output$zero_hours_contracts_line_plot = renderPlotly({
  plot_data = zero_hour_contracts %>%
    mutate(percent_of_people = round_half_up(percent_of_people,1))

  zero_hours_contracts_plot_bar(plot_data)
  #zero_hours_contracts_plot_line(plot_data)

})


zero_hour_contracts %>%
  mutate(percent_of_people = round_half_up(percent_of_people,1)) %>%
  select(date, percent_of_people) %>%
  rename("Quarter" = "date",
         "Percentage of people on zero-hours contacts (%)" = "percent_of_people") %>%
  dataDownloadServer(id = "zero_hour_contracts", filename = "zero_hour_contracts",
                     add_separator_cols_1dp = c(2))



##############################################.
# EMPLOYABILITY----
##############################################.

### EMPLOYABILITY - referral
# output$employability_FSS_referral_slider_ui = renderUI({
#   min_slider = min(employability_FSS_referral$year_quarter_date)
#   max_slider = max(employability_FSS_referral$year_quarter_date) +  months(3)
#
#   sliderInput("employability_FSS_referral_slider_input", "Selected quarters:",
#               min = min_slider,
#               max = max_slider,
#               value=c(min_slider, max_slider),timeFormat="%b %Y")
# })


employability_FSS_referral_reactive <- reactiveValues()
observe({

  full_date_left = as.character(input$employability_FSS_referral_slider_input[1])
  full_date_right = as.character(input$employability_FSS_referral_slider_input[2])
  full_date_left = format(as.Date(ifelse(is.null(full_date_left), min(employability_FSS_referral$year_quarter_date), full_date_left),"%Y-%m-%d"),"%Y-%m-%d")
  full_date_right = format(as.Date(ifelse(is.null(full_date_right), max(employability_FSS_referral$year_quarter_date), full_date_right),"%Y-%m-%d"),"%Y-%m-%d")
  full_date_left = floor_date(as.Date(full_date_left), unit = "month")
  full_date_right = floor_date(as.Date(full_date_right), unit = "month")

  employability_FSS_referral_reactive$data_subset = employability_FSS_referral %>%
    filter(year_quarter_date>=full_date_left,
           year_quarter_date +  months(2) <= full_date_right)

  date_max = employability_FSS_referral_reactive$data_subset$year_quarter_date %>% max()
  date_min = employability_FSS_referral_reactive$data_subset$year_quarter_date %>% min()

  output$employability_FSS_referral_reactive_text =  renderText({

    paste0("Q", quarter(date_min), " ", year(date_min), " - Q", quarter(date_max), " ", year(date_max))
  })

})





output$employability_FSS_referral_figure = renderPlotly({

  x_col = "year_quarter"
  v_y_col = c("referrals", "starts_from_referrals")
  v_color = c('rgb(31, 119, 180)', 'rgb(44, 160, 44)')
  v_name = c("Referrals", "Starts <br> (from referrals)")
  v_bar_width = c(0.4, 0.2)
  with_bar = TRUE
  xaxisTitle = "Quarter"
  V_funnel_width = c(1, 0.5)

  plot_line_with_bar(employability_FSS_referral, x_col, v_y_col, v_color, v_name, v_bar_width, xaxisTitle, with_bar)


})


output$employability_FSS_referral_funnel_figure = renderPlotly({

  x_col = "year_quarter"
  v_y_col = c("referrals", "starts_from_referrals")
  v_color = c('rgb(31, 119, 180)', 'rgb(44, 160, 44)')
  v_name = c("Referrals", "Starts <br> (from referrals)")
  v_bar_width = c(0.4, 0.2)
  with_bar = TRUE
  V_funnel_width = c(1, 0.5)

  plot_funnel_layers(employability_FSS_referral_reactive$data_subset, v_y_col, v_name, v_color, V_funnel_width)

})


## EMPLOYABILITY - starts

# output$employability_FSS_start_month_slider_ui = renderUI({
#   min_slider = min(employability_FSS_start_month$year_quarter_date)
#   max_slider = max(employability_FSS_start_month$year_quarter_date)
#
#   sliderInput("employability_FSS_start_month_input", "Select range of months:",
#               min = min_slider,
#               max = max_slider,
#               value=c(min_slider, max_slider),
#               timeFormat="%b %Y")
# })


employability_FSS_start_month_reactive <- reactiveValues()
observe({

  full_date_left = as.character(input$employability_FSS_start_month_input[1])
  full_date_right = as.character(input$employability_FSS_start_month_input[2])
  full_date_left = format(as.Date(ifelse(is.null(full_date_left), min(employability_FSS_start_month$year_quarter_date), full_date_left), "%Y-%m-%d"),"%Y-%m-%d")
  full_date_right = format(as.Date(ifelse(is.null(full_date_left), max(employability_FSS_start_month$year_quarter_date), full_date_right), "%Y-%m-%d"),"%Y-%m-%d")
  full_date_left = floor_date(as.Date(full_date_left), unit = "month")
  full_date_right = floor_date(as.Date(full_date_right), unit = "month")
  employability_FSS_start_month_reactive$data_subset = employability_FSS_start_month %>%
    filter(year_quarter_date>=full_date_left,
           year_quarter_date<=full_date_right)

  date_max = employability_FSS_start_month_reactive$data_subset$year_quarter_date %>% max()
  date_min = employability_FSS_start_month_reactive$data_subset$year_quarter_date %>% min()

  output$employability_FSS_start_month_reactive_text =  renderText({

    paste0(format(date_min, "%B %Y"), " - ", format(date_max, "%B %Y"))
  })

})






output$employability_FSS_start_month_figure = renderPlotly({
  x_col = "year_quarter"
  v_y_col = c("starts" , "job_starts", "sustained_employment_3_month", "sustained_employment_6_month", "sustained_employment_1_year")
  v_color = c("rgb(31, 119, 180)", "rgb(44, 160, 44)", "rgb(148, 103, 189)", "rgb(188, 189, 34)", "rgb(23, 190, 207)")
  v_name = c("Starts" , "Job starts", "3 monthes <br> sustained employment", "6 monthes <br> sustained employment", "1 year <br> sustained employment")
  v_bar_width = c(0.5, 0.4, 0.3, 0.2, 0.1)
  xaxisTitle = "Month"
  with_bar = TRUE
  V_funnel_width = c(1, 0.8, 0.6, 0.4, 0.2)

  plot_line_with_bar(employability_FSS_start_month, x_col, v_y_col, v_color, v_name, v_bar_width, xaxisTitle, with_bar)

})


output$employability_FSS_start_month_funnel_figure = renderPlotly({

  x_col = "year_quarter"
  v_y_col = c("starts" , "job_starts", "sustained_employment_3_month", "sustained_employment_6_month", "sustained_employment_1_year")
  v_color = c("rgb(31, 119, 180)", "rgb(44, 160, 44)", "rgb(148, 103, 189)", "rgb(188, 189, 34)", "rgb(23, 190, 207)")
  v_name = c("Starts" , "Job starts", "3 monthes <br> sustained employment", "6 monthes <br> sustained employment", "1 year <br> sustained employment")
  v_bar_width = c(0.5, 0.4, 0.3, 0.2, 0.1)
  xaxisTitle = "Month"
  with_bar = TRUE
  V_funnel_width = c(1, 0.8, 0.6, 0.4, 0.2)

  plot_funnel_layers(employability_FSS_start_month_reactive$data_subset, v_y_col, v_name, v_color, V_funnel_width)

})




###

employability_FSS_start_month %>%
  arrange(desc(year_quarter_date)) %>%
  select(-year_quarter, -early_leavers) %>%
  mutate(year_quarter_date = format(year_quarter_date, "%B %Y")) %>%
  rename("Sustained employment after 3 months" = "sustained_employment_3_month",
         "Sustained employment after 6 months" = "sustained_employment_6_month",
         "Sustained employment after 1 year" = "sustained_employment_1_year",
         "Month" = "year_quarter_date") %>%
  dataDownloadServer(id = "employability_starts",
                     filename = "employability_starts",
                     add_separator_cols = c(2,3,4,5,6))


employability_FSS_referral %>%
  arrange(desc(year_quarter)) %>%
  select(year_quarter, referrals, starts_from_referrals, start_rate) %>%
  mutate(year_quarter = factor(year_quarter),
         start_rate = start_rate*100) %>%
  rename("Start Rate (%)" = "start_rate",
         "Quarter" = "year_quarter") %>%
  dataDownloadServer(id = "employability_referrals",
                     filename = "employability_referrals",
                     add_separator_cols = c(2,3,4))

##############################################.
# SKILLS SHORTAGE VACANCIES ----
##############################################.

observeEvent(input$skills_shortage_geog_type,
             {

               skills_shortage_filtered = skills_shortage_vacancies %>%
                 filter(geography == input$skills_shortage_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "skills_shortage_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(skills_shortage_filtered$geography_type))#,
               #selected = "")
             })

output$skills_shortage_graph_bar <- renderPlotly({
  region_filter_table(skills_shortage_vacancies, region_of_interest = input$skills_shortage_geog_name) %>%
    plot_skills_shortage(.)
})

observeEvent(input$skills_shortage_geog_name, {

  data_unfiltered <- skills_shortage_vacancies %>%
    arrange(year, region, vacancy_type) %>%
    select(year, region, vacancy_type, n_vacancies, all_establishments, percent) %>%
    mutate(percent = 100*percent) %>%
    rename("Number of Vacancies" = "n_vacancies",
           "Percentage of Vacancies (%)" = "percent")

    data_filtered <- data_unfiltered %>%
      filter(region == input$skills_shortage_geog_name)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "skills_shortage", filename = "skills_shortage",
                       add_separator_cols = c(4,5,6))

    output$skills_shortage_table_title <- renderText({
      glue("Data table: Percentage of vacancies by vacancy type in ",
           input$skills_shortage_geog_name)
    })
})


##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

observeEvent(input$economic_inactivity_cr_geog_type,
             {

               economic_inactivity_cr_filtered = economic_inactivity %>%
                 filter(geography_type == input$economic_inactivity_cr_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "economic_inactivity_cr_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(economic_inactivity_cr_filtered$geography))#,
               #selected = "")
             })

output$economic_inactivity_graph_line <- renderPlotly({
  region_filter_table(economic_inactivity, region_of_interest = input$economic_inactivity_cr_geog_name) %>%
    plot_economic_inactivity(.)

})

observeEvent(input$economic_inactivity_cr_geog_name, {

  data_unfiltered <- economic_inactivity %>%
    select(year, region, breakdown, n, percent) %>%
    rename("category" = "breakdown",
           "Number of People" = "n",
           "Percentage of People (%)" = "percent")

  data_filtered <- data_unfiltered %>%
    filter(region == input$economic_inactivity_cr_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "economic_inactivity", filename = "economic_inactivity",
                     add_separator_cols = c(4),
                     add_separator_cols_1dp = c(5))

  output$economic_inactivity_table_title <- renderText({
    glue("Data table: Percentage of economically inactive people aged 16 to 64 by willingness to work in ",
         input$economic_inactivity_cr_geog_name)
  })
})


##############################################.
# UNDEREMPLOYMENT----
##############################################.

observeEvent(input$underemployment_geog_type,
             {

               underemployment_filtered = underemployment %>%
                 filter(geography_type == input$underemployment_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "underemployment_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(underemployment_filtered$geography))#,
               #selected = "")
             })

output$underemployment_graph_line <- renderPlotly({
  data = underemployment %>%
    filter(local_authority == input$underemployment_geog_name)


  line_plot_with_marker(data, x_col = "year", y_col = "proportion",  x_axis_title = "Year", y_axis_title = "Underemployment (%)")

})



observeEvent(input$underemployment_geog_name, {

  data_unfiltered <- underemployment %>%
    select(local_authority, year, proportion) %>%
    rename( "Underemployment (%)" = proportion)

  data_filtered <- data_unfiltered %>%
    filter(local_authority == input$underemployment_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "underemployment", filename = "underemployment",
                     add_separator_cols_1dp = c(3))

  output$underemployment_table_title <- renderText({
    glue("Data table: Percentage of adults 16 years old and over who are underemployed in ",
         input$underemployment_geog_name)
  })
})

