##############################################.
# ACCESS TO GREEN AND BLUE SPACE ----
##############################################.

output$info_blue_green_space = renderUI({

  tagList(

    h4("Access to green and blue space"),

    br(),

    bsButton("info_to_blue_green_space", "Go to access to green and blue space tab")

  )

})

##############################################.
# JOURNEYS BY ACTIVE TRAVEL ----
##############################################.

output$info_journeys_active = renderUI({

  tagList(

    h4("Journeys by active travel"),

    br(),

    bsButton("info_to_journeys_active", "Go to journeys by active travel tab")

  )

})

##############################################.
# VISITS TO THE OUTDOORS ----
##############################################.

output$info_visit_outdoors = renderUI({

  tagList(

    h4("Visits to the outdoors"),

    br(),

    bsButton("info_to_visit_outdoors", "Go to visits to the outdoors tab")

  )

})
