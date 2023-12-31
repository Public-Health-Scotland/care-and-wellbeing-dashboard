####################### Modals #######################

# Alt text module server ----
altTextServer <- function(id, title, content) {

  moduleServer(
    id,
    function(input, output, session) {

      modal <- modalDialog(
        h3(title),
        content,
        size = "l",
        easyClose = TRUE,
        fade = TRUE,
        footer = modalButton("Close")
      )

      observeEvent(input$alttext, { showModal(modal) })


    }
  )

}


# Map alt text module server ----
mapAltTextServer <- function(id, title, content) {

  moduleServer(
    id,
    function(input, output, session) {

      modal <- modalDialog(
        h3(title),
        content,
        size = "l",
        easyClose = TRUE,
        fade = TRUE,
        footer = modalButton("Close")
      )

      observeEvent(input$map_alttext, { showModal(modal) })


    }
  )

}
