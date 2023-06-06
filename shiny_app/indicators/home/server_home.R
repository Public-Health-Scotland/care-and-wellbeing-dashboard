# Navigation buttons on home page

observeEvent(input$jump_to_child_start, {
  updateTabsetPanel(session, "intabset", selected = "child_start")})

observeEvent(input$jump_to_control_lives, {
  updateTabsetPanel(session, "intabset", selected = "control_lives")})

observeEvent(input$jump_to_fair_work, {
  updateTabsetPanel(session, "intabset", selected = "fair_work")})

observeEvent(input$jump_to_healthy_standard, {
  updateTabsetPanel(session, "intabset", selected = "healthy_standard")})

observeEvent(input$jump_to_sustainable_communities, {
  updateTabsetPanel(session, "intabset", selected = "sustainable_communities")})

observeEvent(input$jump_to_strengthen_prevention, {
  updateTabsetPanel(session, "intabset", selected = "strengthen_prevention")})

observeEvent(input$jump_to_discrimination_racism, {
  updateTabsetPanel(session, "intabset", selected = "discrimination_racism")})

observeEvent(input$jump_to_environmental_sustainability, {
  updateTabsetPanel(session, "intabset", selected = "environmental_sustainability")})


# Second lot of action links for full objective descriptions on home page

observeEvent(input$jump_to_child_start2, {
  updateTabsetPanel(session, "intabset", selected = "child_start")})

observeEvent(input$jump_to_control_lives2, {
  updateTabsetPanel(session, "intabset", selected = "control_lives")})

observeEvent(input$jump_to_fair_work2, {
  updateTabsetPanel(session, "intabset", selected = "fair_work")})

observeEvent(input$jump_to_healthy_standard2, {
  updateTabsetPanel(session, "intabset", selected = "healthy_standard")})

observeEvent(input$jump_to_sustainable_communities2, {
  updateTabsetPanel(session, "intabset", selected = "sustainable_communities")})

observeEvent(input$jump_to_strengthen_prevention2, {
  updateTabsetPanel(session, "intabset", selected = "strengthen_prevention")})

observeEvent(input$jump_to_discrimination_racism2, {
  updateTabsetPanel(session, "intabset", selected = "discrimination_racism")})

observeEvent(input$jump_to_environmental_sustainability2, {
  updateTabsetPanel(session, "intabset", selected = "environmental_sustainability")})



