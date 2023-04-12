##############################################.
# NAVIGATION BUTTONS----
##############################################.
# This buttons link to all the different tabs on the dashboard
# It gets sourced into the server script

##############################################.
# GO TO INFO BUTTONS----
##############################################.

### Covid recovery ###

observeEvent(input$wellbeing_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Covid recovery")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Wellbeing of children and young people")})

observeEvent(input$financial_security_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Covid recovery")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Financial security for low income households")})

observeEvent(input$good_green_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Covid recovery")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Good, green jobs and fair work")})


### Care and wellbeing ###

observeEvent(input$strengthen_prevention_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Strengthen the role and impact of ill health prevention")})

observeEvent(input$sustainable_communities_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Create and develop healthy and sustainable place and communities")})

observeEvent(input$environmental_sustainability_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Pursuing environmental sustainabaility and health equity together")})

observeEvent(input$control_lives_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Enable all children, young people and adultsto maximise their capabilities and control over their lives")})

observeEvent(input$child_start_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Give every child the best start in life")})

observeEvent(input$discrimination_racism_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Tackling discrimination, racism and their outcomes")})

observeEvent(input$fair_work_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Create fair employment and good work for all")})

observeEvent(input$healthy_standard_to_info,
             {updateTabsetPanel(session,
                                "intabset",
                                selected = "info_notes")
               updateRadioButtons(session,
                                  "pillar_type_info",
                                  selected = "Care and wellbeing")
               updateRadioButtons(session,
                                  "indicator_type_info",
                                  selected = "Ensure healthy standard of living for all")})

