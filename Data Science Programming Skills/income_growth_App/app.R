# Complex Shiny UI layouts for Income Growth

# Load libraries so they are available
list.of.packages <- c("shiny")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library("shiny")

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)
