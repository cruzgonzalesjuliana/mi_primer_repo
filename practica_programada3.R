ui <- fluidPage(
  titlePanel("Planificador de eventos"),
  
  sidebarLayout(
    sidebarPanel( 
      width = 4,
      textInput(inputId = "Nombre del evento", 
                label = "Ingrese su nombre:"),
      br(),
      selectInput(inputId = "selector_provincias", 
                  label = "Tema del Evento", 
                  choices = c("Boda", "Fiesta de Cumpleaños", "Conferencia", "Otro"),
                  multiple = FALSE),
      br(),
      
      numericInput(inputId = "edad", 
                   label = "Elija su edad:", 
                   value = 18, #indica el valor inicial a mostrar
                   min = 25, #permite indicar el valor mínimo
                   max = 120),
      br(),
      
      selectInput(inputId = "selector_provincias", 
                  label = "Seleccione la provincia en la que vive:", 
                  choices = c("San José", "Cartago", "Heredia", "Alajuela","Limón", "Guanacaste", "Puntarenas"),
                  multiple = FALSE),
  
    ),
    mainPanel(
      width = 7,
      textOutput("materia_elegida"),
      br()
    ),

    
  ))
  
    
  
  server <- function(input, output) {
    
    output$materia_elegida <- renderText(paste0("Le damos la bienvenida, la materia que usted eligió matricular es: ",
                                                input$selector_materias, "."))
    
  } 
  

shinyApp(ui, server)