##############################################.
# NUMBER OF AREAS WHERE HEALTH INEQUALITIES ARE REDUCING ----
##############################################.

output$info_areas_of_health_inequalities = renderUI({

  tagList(

    h4("Number of areas where health inequalities are reducing"),

    br(),

    bsButton("info_to_areas_of_health_inequalities", "Go to areas where health inequalities are reducing tab")

  )

})

##############################################.
# LONELINESS ----
##############################################.

output$info_loneliness = renderUI({

  tagList(

    h4("Loneliness"),

    br(),

    bsButton("info_to_loneliness", "Go to loneliness tab")

  )

})

##############################################.
# PERCEPTIONS OF LOCAL AREA ----
##############################################.

output$info_perceptions_of_local_area = renderUI({

  tagList(

    h4("Perceptions of local area"),

    br(),

    bsButton("info_to_perceptions_of_local_area", "Go to perceptions of local area tab")

  )

})

##############################################.
# PLACES TO INTERACT ----
##############################################.

output$info_places_to_interact = renderUI({

  tagList(

    h4("Places to interact"),

    br(),

    bsButton("info_to_places_to_interact", "Go to places to interact tab")

  )

})
