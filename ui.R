
## ~~~~~~~~~~ UI ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-31
# Description: UI for TBI project management dashboard

ui <- fluidPage(
  useShinyjs(),
  title="TBI-PPM",
  class="mainpage",
  tags$head(
    tags$link(rel="stylesheet",type="text/css",href="style.css")
  ),
  div(
    id="content",
    div(
      id="english",
      fluidRow(
        class="header",
        h2(class="title","TBI - PPM Dashboard")
      ),
      fluidRow(
        id="selector_en",
        em("Dashboard for current projects in Technology and Business Innovation"),
        br(),
        br(),
        tags$table(
          tags$tr(
            tags$td(style="padding:0 10px 23px 15px;",
                    tags$strong("Select a project:")),
            tags$td(selectInput(inputId="project_en",label=NULL,width="440px",
                                choices=c("All",health$Project)))
          )
        )
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Progress")
      ),
      fluidRow(
        style="margin:0 30px 0 30px;",
        br(),
        uiOutput(outputId="progress_en") %>% withSpinner(color="#999999"),
        br()
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Finances")
      ),
      br(),
      fluidRow(
        style="margin:5px;",
        column(
          width=6,
          div(style="width:400px; margin:0 auto;",
              div(plotOutput(outputId="finance1_en",height="380px") %>% withSpinner(color="#999999")),
              div(
                style="text-align:center;",
                div(style="display:inline-block; font-size:10pt; margin-right:5px;","Variance:"),
                div(style="display:inline-block;",uiOutput("variance_en"))
              )
          )
        ),
        column(
          width=6,
          wellPanel(
            style="padding:0; background-color:#fffbf0;",
            h5(style="padding:13px 0 5px 30px;","Breakdown of Forecasted Expenditures"),
            plotlyOutput(outputId="finance2_en",
                         width="100%",height="300px") %>% withSpinner(color="#999999"),
            br(),
            p(style="font-size:8pt; margin:0 0 20px 0; text-align:center;",
              "Hover over to view dollar amounts")
          )
        )
      )
    ),
    div(
      id="form",
      style="display:none;"
    )
  )
)