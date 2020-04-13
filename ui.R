
## ~~~~~~~~~~ UI ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-04-13
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
      # style="display:none;",
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
      ),
      br(),
      fluidRow(
        style="text-align:center;",
        em("Information not up to date? Click",
           a(id="update",href="javascript:void(0);","here"),
           "to update")
      ),
      div(class="back")
    ),
    div(
      id="form",
      style="display:none;",
      fluidRow(
        column(width=8,h2(style="margin-top:0;","Update PPM data")),
        column(width=4,style="text-align:right;",
               actionButton(inputId="exit",label="Exit"))
      ),
      fluidRow(
        style="margin:0 30px;",
        tags$table(
          tags$tr(
            tags$td(class="labelcol","Select project:"),
            tags$td(selectInput(inputId="project",label="",width="440px",
                                choices=c("- Create new project -",health$Project)))
          )
        ),
        div(
          id="actiondiv",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Action:"),
              tags$td(selectInput(inputId="actionsel",label="",
                                  choices=c("Update project health","Update budget",
                                            "Update deliverables","Delete project")))
            )
          )
        ),
        div(
          id="health",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Project health:"),
              tags$td(selectInput(inputId="healthsel",label="",
                                  choices=c("On track","Attention required",
                                            "Immediate attention required","N/A")))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(actionButton(inputId="update1",label="Update"))
            )
          )
        ),
        div(
          id="budget",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Project budget:"),
              tags$td(numericInput(inputId="budgetinput",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Actuals:"),
              tags$td(numericInput(inputId="actualsinput",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Committed:"),
              tags$td(numericInput(inputId="committedinput",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Anticipated:"),
              tags$td(numericInput(inputId="anticipatedinput",label="",value=0,min=0,
                                   step=0.01,width="100px"))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(actionButton(inputId="update2",label="Update"))
            )
          )
        ),
        div(
          id="deliverable",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Deliverable:"),
              tags$td(selectInput(inputId="delivsel",label="",width="440px",
                                  choices=c("- Create new deliverable -"))),
              tags$td(style="padding-top:5px;",
                      actionButton(inputId="go2",label=" Select",icon=icon("sync-alt")))
            )
          )
        ),
        div(
          id="projdates1",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","New name:"),
              tags$td(textInput(inputId="delivname",label=""))
            )
          ),
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Planned start:"),
              tags$td(dateInput(inputId="pstart1",label="",width="100px")),
              tags$td(style="text-align:right;","Planned end:"),
              tags$td(dateInput(inputId="pend1",label="",width="100px"))
            ),
            tags$tr(
              tags$td(class="labelcol","Actual start:"),
              tags$td(dateInput(inputId="astart1",label="",width="100px")),
              tags$td(style="text-align:right;","Actual end:"),
              tags$td(dateInput(inputId="aend1",label="",width="100px")),
              tags$td(class="labelcol","% complete"),
              tags$td(numericInput(inputId="percent1",label="",value=100,min=0,max=100,
                                   step=1,width="60px"))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(actionButton(inputId="update3",label="Add"))
            )
          )
        ),
        div(
          id="projdates2",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Planned start:"),
              tags$td(dateInput(inputId="pstart2",label="",width="100px")),
              tags$td(style="text-align:right;","Planned end:"),
              tags$td(dateInput(inputId="pend2",label="",width="100px"))
            ),
            tags$tr(
              tags$td(class="labelcol","Actual start:"),
              tags$td(dateInput(inputId="astart2",label="",width="100px")),
              tags$td(style="text-align:right;","Actual end:"),
              tags$td(dateInput(inputId="aend2",label="",width="100px")),
              tags$td(class="labelcol","% complete"),
              tags$td(numericInput(inputId="percent2",label="",value=0,min=0,max=100,
                                   step=1,width="60px"))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(actionButton(inputId="update4",label="Update"))
            )
          )
        ),
        div(
          id="delete",
          style="display:none;",
          tags$table(
            tags$tr(
              style="height:35px;",
              tags$td(class="labelcol"),
              tags$td(em("Are you sure you want to delete this project?"))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(actionButton(inputId="del",label="Delete"))
            )
          )
        ),
        div(
          id="new",
          style="display:none;",
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Project name:"),
              tags$td(textInput(inputId="projname",label="")),
              tags$td("Project IP:"),
              tags$td(textInput(inputId="projip",label="",width="100px"))
            ),
            tags$tr(
              tags$td(class="labelcol","Project health:"),
              tags$td(
                selectInput(inputId="healthsel_new",label="",
                            choices=c("On track","Attention required",
                                      "Immediate attention required","N/A")))
            )
          ),
          tags$table(
            tags$tr(
              tags$td(class="labelcol","Project budget:"),
              tags$td(numericInput(inputId="budgetinput_new",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Actuals:"),
              tags$td(numericInput(inputId="actualsinput_new",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Committed:"),
              tags$td(numericInput(inputId="committedinput_new",label="",value=0,min=0,
                                   step=0.01,width="100px")),
              tags$td("Anticipated:"),
              tags$td(numericInput(inputId="anticipatedinput_new",label="",value=0,min=0,
                                   step=0.01,width="100px"))
            ),
            tags$tr(tags$td(br())),
            tags$tr(
              tags$td(),
              tags$td(colspan=2,
                      actionButton(inputId="update5",label="Create project")
              )
            )
          )
        ),
        div(id="successmsg",style="display:none;",br(),em("Project data updated.")),
        div(class="back")
      )
    )
  )
)