ui <- fluidPage(
  titlePanel("Planificador de eventos"),
  
  sidebarLayout(
    sidebarPanel( 
      width = 4,
      textInput(inputId = "nombre_evento", 
                label = "Ingrese el nombre del evento:",
                placeholder = "Ej: Cumpleaños n5"),
      br(),
      selectInput(inputId = "selector_eventos", 
                  label = "Tema del Evento:", 
                  choices = c("Boda", "Fiesta de Cumpleaños", "Conferencia", "Otro"),
                  multiple = FALSE),
      br(),
      
      numericInput(inputId = "numero_invitados", 
                   label = "Número de invitados:", 
                   value = 25,
                   min = 25,
                   max = 120),
      br(),
      
      selectInput(inputId = "selector_provincias", 
                  label = "Seleccione la provincia en la que vive:", 
                  choices = c("San José", "Cartago", "Heredia", "Alajuela","Limón", "Guanacaste", "Puntarenas"),
                  multiple = FALSE),
  
    ),
    mainPanel(
      h1(strong("¡Vamos a planificar su día especial!"), align = "center", style="color:green"),
      tags$hr(style = "border-color:green"),
      h2(strong( "Detalles de su evento:"), width = 9), 
      hr(),
      textOutput("nombre_evento"),
      hr(),
      textOutput("selector_eventos"),
      hr(),
      textOutput("numero_invitados_ubicacion")
      
    
  )))
  
    
  
  server <- function(input, output) {
    
    output$nombre_evento <- renderText(paste0("Nombre del evento: ", input$nombre_evento))
    output$selector_eventos <- renderText(paste0("Tema del evento: ", input$selector_eventos))
    output$numero_invitados_ubicacion <- renderText(paste0("Número de invitados y ubicación: El evento ", input$tema_evento, " tendrá ", 
                                                           input$numero_invitados, " invitados y será llevado a cabo en la provincia de ",
                                                           input$selector_provincias, "."))
    
  } 
  

shinyApp(ui, server)