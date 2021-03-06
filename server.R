
## ~~~~~~~~~~ SERVER ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-04-13
# Description: Server logic for TBI project management dashboard

server <- function(session, input, output) {
  
  runjs('document.getElementById("update").onclick = function() {
        $("#form").show();
        $("#english").hide();
        $("#successmsg").hide();
};
        document.getElementById("exit").onclick = function() {
        $("#form").hide();
        $("#english").show();
        $("#successmsg").hide();
        };
        document.getElementById("actionsel").onchange = function() {
        $("#health").hide();
        $("#budget").hide();
        $("#deliverable").hide();
        $("#delete").hide();
        if($("#actionsel").val()=="Update project health") {
        $("#health").show();
        }
        if($("#actionsel").val()=="Update budget") {
        $("#budget").show();
        }
        if($("#actionsel").val()=="Update deliverables") {
        $("#deliverable").show();
        }
        if($("#actionsel").val()=="Delete project") {
        $("#delete").show();
        }
        $("#projdates1").hide();
        $("#projdates2").hide();
        $("#successmsg").hide();
        };
        document.getElementById("healthsel").onchange = function() {
        $("#update1").prop("disabled",false);
        $("#successmsg").hide();
        };
        document.getElementById("projname").oninput = function() {
        checkUpdate5();
        $("#successmsg").hide();
        };
        document.getElementById("projip").oninput = function() {
        $("#successmsg").hide();
        };
        document.getElementById("healthsel_new").onchange = function() {
        $("#successmsg").hide();
        };
        document.getElementById("budgetinput_new").oninput = function() {
        checkUpdate5();
        $("#successmsg").hide();
        };
        document.getElementById("actualsinput_new").oninput = function() {
        checkUpdate5();
        $("#successmsg").hide();
        };
        document.getElementById("committedinput_new").oninput = function() {
        checkUpdate5();
        $("#successmsg").hide();
        };
        document.getElementById("anticipatedinput_new").oninput = function() {
        checkUpdate5();
        $("#successmsg").hide();
        };
        document.getElementById("budgetinput").oninput = function() {
        checkUpdate2();
        $("#successmsg").hide();
        };
        document.getElementById("actualsinput").oninput = function() {
        checkUpdate2();
        $("#successmsg").hide();
        };
        document.getElementById("committedinput").oninput = function() {
        checkUpdate2();
        $("#successmsg").hide();
        };
        document.getElementById("anticipatedinput").oninput = function() {
        checkUpdate2();
        $("#successmsg").hide();
        };
        document.getElementById("delivname").oninput = function() {
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("pstart1").onchange = function() {
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("pend1").onchange = function() {
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("astart1").onchange = function() {
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("aend1").onchange = function() {
        if($("#aend1").find("input").val()!="") {
        $("#percent1").val(100);
        }
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("percent1").oninput = function() {
        checkUpdate3();
        $("#successmsg").hide();
        };
        document.getElementById("pstart2").onchange = function() {
        checkUpdate4();
        $("#successmsg").hide();
        };
        document.getElementById("pend2").onchange = function() {
        checkUpdate4();
        $("#successmsg").hide();
        };
        document.getElementById("astart2").onchange = function() {
        checkUpdate4();
        $("#successmsg").hide();
        };
        document.getElementById("aend2").onchange = function() {
        if($("#aend2").find("input").val()!="") {
        $("#percent2").val(100);
        }
        checkUpdate4();
        $("#successmsg").hide();
        };
        document.getElementById("percent2").oninput = function() {
        checkUpdate4();
        $("#successmsg").hide();
        };
        function checkUpdate2() {
        var pass = true;
        if($("#budgetinput").val()=="" || $("#budgetinput").val()<0
        || $("#actualsinput").val()=="" || $("#actualsinput").val()<0
        || $("#committedinput").val()=="" || $("#committedinput").val()<0
        || $("#anticipatedinput").val()=="" || $("#anticipatedinput").val()<0) {
        pass = false;
        }
        if(pass) {
        document.getElementById("update2").disabled = false;
        } else {
        document.getElementById("update2").disabled = true;
        }
        };
        function checkUpdate3() {
        var pass = true;
        if($("#delivname").val()=="" || $("#delivname").val()=="- Create new deliverable -") {
        pass = false;
        }
        var pstart1 = $("#pstart1").find("input").val();
        var pend1 = $("#pend1").find("input").val();
        var astart1 = $("#astart1").find("input").val();
        var aend1 = $("#aend1").find("input").val();
        if(pstart1!="" && pend1!="") {
        var d1 = Date.parse(pstart1);
        var d2 = Date.parse(pend1);
        if(d1 > d2) {
        pass = false;
        }
        }
        if(astart1!="" && aend1!="") {
        var d1 = Date.parse(astart1);
        var d2 = Date.parse(aend1);
        if(d1 > d2) {
        pass = false;
        }
        }
        if($("#percent1").val()=="" || $("#percent1").val()<0 || $("#percent1").val()>100) {
        pass = false;
        }
        if(pass) {
        document.getElementById("update3").disabled = false;
        } else {
        document.getElementById("update3").disabled = true;
        }
        };
        function checkUpdate4() {
        var pass = true;
        var pstart2 = $("#pstart2").find("input").val();
        var pend2 = $("#pend2").find("input").val();
        var astart2 = $("#astart2").find("input").val();
        var aend2 = $("#aend2").find("input").val();
        if(pstart2!="" && pend2!="") {
        var d1 = Date.parse(pstart2);
        var d2 = Date.parse(pend2);
        if(d1 > d2) {
        pass = false;
        }
        }
        if(astart2!="" && aend2!="") {
        var d1 = Date.parse(astart2);
        var d2 = Date.parse(aend2);
        if(d1 > d2) {
        pass = false;
        }
        }
        if($("#percent2").val()=="" || $("#percent2").val()<0 || $("#percent2").val()>100) {
        pass = false;
        }
        if(pass) {
        document.getElementById("update4").disabled = false;
        } else {
        document.getElementById("update4").disabled = true;
        }
        };
        function checkUpdate5() {
        var pass = true;
        if($("#projname").val()=="" || $("#projname").val()=="- Create new project -") {
        pass = false;
        }
        if($("#budgetinput_new").val()=="" || $("#budgetinput_new").val()<0
        || $("#actualsinput_new").val()=="" || $("#actualsinput_new").val()<0
        || $("#committedinput_new").val()=="" || $("#committedinput_new").val()<0
        || $("#anticipatedinput_new").val()=="" || $("#anticipatedinput_new").val()<0) {
        pass = false;
        }
        if(pass) {
        document.getElementById("update5").disabled = false;
        } else {
        document.getElementById("update5").disabled = true;
        }
        };')
  
  observeEvent(input$project,{
    if(input$project!="- Create new project -" & input$actionsel=="Update project health") {
      proj.health <- health[health$Project==input$project,]$Status[1]
      if(is.na(proj.health)) { proj.health <- "N/A" }
      updateSelectInput(session,inputId="healthsel",selected=proj.health,
                        choices=c("On track","Attention required",
                                  "Immediate attention required","N/A"))
    }
    if(input$project!="- Create new project -" & input$actionsel=="Update budget") {
      bdgt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Budget"]) * 1000
      actl <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Actuals"]) * 1000
      comt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Commitment"]) * 1000
      antc <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Anticipated"]) * 1000
      updateNumericInput(session,inputId="budgetinput",label="",min=0,step=0.01,value=bdgt)
      updateNumericInput(session,inputId="actualsinput",label="",min=0,step=0.01,value=actl)
      updateNumericInput(session,inputId="committedinput",label="",min=0,step=0.01,value=comt)
      updateNumericInput(session,inputId="anticipatedinput",label="",min=0,step=0.01,value=antc)
    }
    if(input$project!="- Create new project -" & input$actionsel=="Update deliverables") {
      delivs <- progress[progress$Project==input$project,]$Deliverables
      updateSelectInput(session,inputId="delivsel",
                        choices=c("- Create new deliverable -",delivs))
    }
    runjs(
      paste0(
        'if($("#project").val()=="- Create new project -") {
        $("#actiondiv").hide();
        $("#health").hide();
        $("#budget").hide();
        $("#deliverable").hide();
        $("#projdates1").hide();
        $("#projdates2").hide();
        $("#delete").hide();
        $("#new").show();
        $("#update5").prop("disabled",true);
  } else {
        $("#actiondiv").show();
        $("#health").hide();
        $("#budget").hide();
        $("#deliverable").hide();
        $("#delete").hide();
        if($("#actionsel").val()=="Update project health") {
        $("#health").show();
        }
        if($("#actionsel").val()=="Update budget") {
        $("#budget").show();
        }
        if($("#actionsel").val()=="Update deliverables") {
        $("#deliverable").show();
        }
        if($("#actionsel").val()=="Delete project") {
        $("#delete").show();
        }
        $("#projdates1").hide();
        $("#projdates2").hide();
        $("#new").hide();
  }
        $("#successmsg").hide();'
      )
      )
    })
  
  observeEvent(input$actionsel,{
    if(input$actionsel=="Update project health") {
      proj.health <- health[health$Project==input$project,]$Status[1]
      if(is.na(proj.health)) {
        proj.health <- "N/A"
      }
      updateSelectInput(session,inputId="healthsel",selected=proj.health,
                        choices=c("On track","Attention required",
                                  "Immediate attention required","N/A"))
    }
    if(input$actionsel=="Update budget") {
      bdgt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Budget"]) * 1000
      actl <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Actuals"]) * 1000
      comt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Commitment"]) * 1000
      antc <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project,
                                "Anticipated"]) * 1000
      updateNumericInput(session,inputId="budgetinput",label="",min=0,step=0.01,value=bdgt)
      updateNumericInput(session,inputId="actualsinput",label="",min=0,step=0.01,value=actl)
      updateNumericInput(session,inputId="committedinput",label="",min=0,step=0.01,value=comt)
      updateNumericInput(session,inputId="anticipatedinput",label="",min=0,step=0.01,value=antc)
    }
    if(input$actionsel=="Update deliverables") {
      delivs <- progress[progress$Project==input$project,]$Deliverables
      updateSelectInput(session,inputId="delivsel",
                        choices=c("- Create new deliverable -",delivs))
    }
  })
  
  observeEvent(input$go2,{
    runjs(
      paste0(
        'if($("#delivsel").val()=="- Create new deliverable -") {
        $("#projdates1").show();
        $("#projdates2").hide();
        $("#update3").prop("disabled",true);
  } else {
        $("#projdates1").hide();
        $("#projdates2").show();
        $("#update4").prop("disabled",true);
  }'
      )
      )
    if(input$delivsel!="- Create new deliverable -") {
      planned.start <- progress[progress$Project==input$project
                                & progress$Deliverables==input$delivsel,]$Planned.Start[1]
      planned.end <- progress[progress$Project==input$project
                              & progress$Deliverables==input$delivsel,]$Planned.End[1]
      actual.start <- progress[progress$Project==input$project
                               & progress$Deliverables==input$delivsel,]$Actual.Start[1]
      actual.end <- progress[progress$Project==input$project
                             & progress$Deliverables==input$delivsel,]$Actual.End[1]
      completion <- progress[progress$Project==input$project
                             & progress$Deliverables==input$delivsel,]$Completion[1]
      updateDateInput(session,inputId="pstart2",label="",value=planned.start)
      updateDateInput(session,inputId="pend2",label="",value=planned.end)
      updateDateInput(session,inputId="astart2",label="",value=actual.start)
      updateDateInput(session,inputId="aend2",label="",value=actual.end)
      updateNumericInput(session,inputId="percent2",label="",value=completion,
                         min=0,max=100,step=1)
    }
    })
  
  observeEvent(input$update1,{
    if(input$healthsel!="N/A") {
      health[health$Project==input$project,"Status"] <- input$healthsel
    } else {
      health[health$Project==input$project,"Status"] <- NA
    }
    runjs('$("#successmsg").show();
          $("#update1").prop("disabled",true);')
    
    write.csv(health,"health.csv",na="",row.names=FALSE)
    health <<- read.csv("health.csv",header=TRUE,na.strings=c(""))
    health$Project <<- as.character(health$Project)
    health$IP <<- as.character(health$IP)
    health$Status <<- as.character(health$Status)
  })
  
  observeEvent(input$update2,{
    name <- input$project
    if(name %in% budget$Project) {
      budget[budget$Project==name,"Budget"] <- round(input$budgetinput/1000,0)
      budget[budget$Project==name,"Actuals"] <- round(input$actualsinput/1000,0)
      budget[budget$Project==name,"Commitment"] <- round(input$committedinput/1000,0)
      budget[budget$Project==name,"Anticipated"] <- round(input$anticipatedinput/1000,0)
      budget[budget$Project==name,"Total.Forecast"] <-
        round(input$actualsinput/1000,0) + round(input$committedinput/1000,0) +
        round(input$anticipatedinput/1000,0)
    } else {
      d <- data.frame(Project=c(name),Type=c("Total"),Budget=c(input$budgetinput/1000),
                      Actuals=c(round(input$actualsinput/1000,0)),
                      Commitment=c(round(input$committedinput/1000,0)),
                      Anticipated=c(round(input$anticipatedinput/1000,0)),
                      Total.Forecast=c(round(input$actualsinput/1000,0) +
                                         round(input$committedinput/1000,0) +
                                         round(input$anticipatedinput/1000,0)))
      budget <- rbind(budget,d)
    }
    runjs('$("#successmsg").show();
          $("#update2").prop("disabled",true);')
    
    write.csv(budget,"budget.csv",na="",row.names=FALSE)
    budget <<- read.csv("budget.csv",header=TRUE,na.strings=c(""))
    budget$Project <<- as.character(budget$Project)
    budget$Type <<- as.character(budget$Type)
    for(col in c("Budget","Actuals","Commitment","Anticipated","Total.Forecast")) {
      budget[is.na(budget[,col]),col] <<- 0
    }
  })
  
  observeEvent(input$update3,{
    name1 <- input$project
    name2 <- input$delivname
    pstart <- input$pstart1
    if(!isTruthy(pstart)) { pstart <- NA }
    pend <- input$pend1
    if(!isTruthy(pend)) { pend <- NA }
    astart <- input$astart1
    if(!isTruthy(astart)) { astart <- NA }
    aend <- input$aend1
    if(!isTruthy(aend)) { aend <- NA }
    compl <- input$percent1
    
    if(name1 %in% progress$Project & name2 %in% progress[progress$Project==name1,]$Deliverables) {
      progress[progress$Project==name1 & progress$Deliverables==name2,"Planned.Start"] <- pstart
      progress[progress$Project==name1 & progress$Deliverables==name2,"Planned.End"] <- pend
      progress[progress$Project==name1 & progress$Deliverables==name2,"Actual.Start"] <- astart
      progress[progress$Project==name1 & progress$Deliverables==name2,"Actual.End"] <- aend
      progress[progress$Project==name1 & progress$Deliverables==name2,"Completion"] <- compl
    } else {
      d <- data.frame(Project=c(name1),Deliverables=c(name2),Planned.Start=c(pstart),
                      Planned.End=c(pend),Actual.Start=c(astart),Actual.End=c(aend),
                      Completion=c(compl))
      progress <- rbind(progress,d)
    }
    runjs('$("#successmsg").show();
          $("#update3").prop("disabled",true);')
    
    write.csv(progress,"progress.csv",na="",row.names=FALSE)
    progress <<- read.csv("progress.csv",header=TRUE,na.strings=c(""))
    progress$Project <<- as.character(progress$Project)
    progress$Deliverables <<- as.character(progress$Deliverables)
    progress$Planned.Start <<- as.Date(progress$Planned.Start,"%Y-%m-%d",tz="UTC")
    progress$Planned.End <<- as.Date(progress$Planned.End,"%Y-%m-%d",tz="UTC")
    progress$Actual.Start <<- as.Date(progress$Actual.Start,"%Y-%m-%d",tz="UTC")
    progress$Actual.End <<- as.Date(progress$Actual.End,"%Y-%m-%d",tz="UTC")
    updateSelectInput(session,inputId="delivsel",label="",
                      choices=c("- Create new deliverable -",
                                progress[progress$Project==name1,]$Deliverables))
  })
  
  observeEvent(input$update4,{
    name1 <- input$project
    name2 <- input$delivsel
    pstart <- input$pstart2
    if(!isTruthy(pstart)) { pstart <- NA }
    pend <- input$pend2
    if(!isTruthy(pend)) { pend <- NA }
    astart <- input$astart2
    if(!isTruthy(astart)) { astart <- NA }
    aend <- input$aend2
    if(!isTruthy(aend)) { aend <- NA }
    compl <- input$percent2
    
    progress[progress$Project==name1 & progress$Deliverables==name2,"Planned.Start"] <- pstart
    progress[progress$Project==name1 & progress$Deliverables==name2,"Planned.End"] <- pend
    progress[progress$Project==name1 & progress$Deliverables==name2,"Actual.Start"] <- astart
    progress[progress$Project==name1 & progress$Deliverables==name2,"Actual.End"] <- aend
    progress[progress$Project==name1 & progress$Deliverables==name2,"Completion"] <- compl
    
    runjs('$("#successmsg").show();
          $("#update4").prop("disabled",true);')
    
    write.csv(progress,"progress.csv",na="",row.names=FALSE)
    progress <<- read.csv("progress.csv",header=TRUE,na.strings=c(""))
    progress$Project <<- as.character(progress$Project)
    progress$Deliverables <<- as.character(progress$Deliverables)
    progress$Planned.Start <<- as.Date(progress$Planned.Start,"%Y-%m-%d",tz="UTC")
    progress$Planned.End <<- as.Date(progress$Planned.End,"%Y-%m-%d",tz="UTC")
    progress$Actual.Start <<- as.Date(progress$Actual.Start,"%Y-%m-%d",tz="UTC")
    progress$Actual.End <<- as.Date(progress$Actual.End,"%Y-%m-%d",tz="UTC")
  })
  
  observeEvent(input$update5,{
    name <- input$projname
    if(name %in% health$Project) {
      if(input$projip=="") {
        health[health$Project==name,"IP"] <- NA
      } else {
        health[health$Project==name,"IP"] <- input$projip
      }
      if(input$healthsel_new!="N/A") {
        health[health$Project==name,"Status"] <- input$healthsel_new
      }
    } else {
      if(input$healthsel_new=="N/A" & input$projip=="") {
        d <- data.frame(Project=c(name),IP=NA,Status=NA)
      } else if(input$healthsel_new=="N/A") {
        d <- data.frame(Project=c(name),IP=c(input$projip),Status=NA)
      } else if(input$projip=="") {
        d <- data.frame(Project=c(name),IP=NA,Status=input$healthsel_new)
      } else {
        d <- data.frame(Project=c(name),IP=c(input$projip),Status=c(input$healthsel_new))
      }
      health <- rbind(health,d)
    }
    if(name %in% budget$Project) {
      budget[budget$Project==name,"Budget"] <- round(input$budgetinput_new/1000,0)
      budget[budget$Project==name,"Actuals"] <- round(input$actualsinput_new/1000,0)
      budget[budget$Project==name,"Commitment"] <- round(input$committedinput_new/1000,0)
      budget[budget$Project==name,"Anticipated"] <- round(input$anticipatedinput_new/1000,0)
      budget[budget$Project==name,"Total.Forecast"] <-
        round(input$actualsinput_new/1000,0) + round(input$committedinput_new/1000,0) +
        round(input$anticipatedinput_new/1000,0)
    } else {
      d <- data.frame(Project=c(name),Type=c("Total"),Budget=c(input$budgetinput_new/1000),
                      Actuals=c(round(input$actualsinput_new/1000,0)),
                      Commitment=c(round(input$committedinput_new/1000,0)),
                      Anticipated=c(round(input$anticipatedinput_new/1000,0)),
                      Total.Forecast=c(round(input$actualsinput_new/1000,0) +
                                         round(input$committedinput_new/1000,0) +
                                         round(input$anticipatedinput_new/1000,0)))
      budget <- rbind(budget,d)
    }
    runjs('$("#successmsg").show();
          $("#update5").prop("disabled",true);')
    
    write.csv(health,"health.csv",na="",row.names=FALSE)
    health <<- read.csv("health.csv",header=TRUE,na.strings=c(""))
    health$Project <<- as.character(health$Project)
    health$IP <<- as.character(health$IP)
    health$Status <<- as.character(health$Status)
    updateSelectInput(session,inputId="project",label="",
                      choices=c("- Create new project -",health$Project))
    
    write.csv(budget,"budget.csv",na="",row.names=FALSE)
    budget <<- read.csv("budget.csv",header=TRUE,na.strings=c(""))
    budget$Project <<- as.character(budget$Project)
    budget$Type <<- as.character(budget$Type)
    for(col in c("Budget","Actuals","Commitment","Anticipated","Total.Forecast")) {
      budget[is.na(budget[,col]),col] <<- 0
    }
  })
  
  observeEvent(input$del,{
    name <- input$project
    health <- health[health$Project!=name,]
    budget <- budget[budget$Project!=name,]
    progress <- progress[progress$Project!=name,]
    
    write.csv(health,"health.csv",na="",row.names=FALSE)
    health <<- read.csv("health.csv",header=TRUE,na.strings=c(""))
    health$Project <<- as.character(health$Project)
    health$IP <<- as.character(health$IP)
    health$Status <<- as.character(health$Status)
    
    write.csv(budget,"budget.csv",na="",row.names=FALSE)
    budget <<- read.csv("budget.csv",header=TRUE,na.strings=c(""))
    budget$Project <<- as.character(budget$Project)
    budget$Type <<- as.character(budget$Type)
    for(col in c("Budget","Actuals","Commitment","Anticipated","Total.Forecast")) {
      budget[is.na(budget[,col]),col] <<- 0
    }
    
    write.csv(progress,"progress.csv",na="",row.names=FALSE)
    progress <<- read.csv("progress.csv",header=TRUE,na.strings=c(""))
    progress$Project <<- as.character(progress$Project)
    progress$Deliverables <<- as.character(progress$Deliverables)
    progress$Planned.Start <<- as.Date(progress$Planned.Start,"%Y-%m-%d",tz="UTC")
    progress$Planned.End <<- as.Date(progress$Planned.End,"%Y-%m-%d",tz="UTC")
    progress$Actual.Start <<- as.Date(progress$Actual.Start,"%Y-%m-%d",tz="UTC")
    progress$Actual.End <<- as.Date(progress$Actual.End,"%Y-%m-%d",tz="UTC")
    
    updateSelectInput(session,inputId="project",label="",
                      choices=c("- Create new project -",health$Project))
  })
  
  output$progress_en <- renderUI({
    if(input$project_en=="All") {
      htmlstr <-
        "<table class='table table-striped' style='background-color:#fffbf0; font-size:10pt; margin:0 10px;'>
      <thead>
      <tr>
      <th width='32%'>Project</th>
      <th width='28%'>Status</th>
      <th width='20%'>Overall Progress</th>
      <th width='20%'>Anticipated End Date</th>
      </tr>
      </thead>
      <tbody>"
      col1 <-"<td>%s</td>"
      col2 <-
        "<td>
      <span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color: %s;'>
      %s
      </span>
      </td>"
      col3 <-
        "<td>
      <span style='background-color:%s; width:50%%; margin-top:5px; border-radius:2px;'>
      %s
      </span>
      <span style='margin-top:5px; margin-left:5px;'>%s%%</span>
      </td>"
      col4 <- "<td>%s</td>"
      for(proj in health$Project) {
        tblrow <-"<tr style='font-size:10pt;'>"
        td1 <- sprintf(col1,proj)
        proj.status <- health[health$Project==proj,]$Status[1]
        if(is.na(proj.status)) {
          td2 <- sprintf(col2,"#bbbbbb","N/A")
        } else if(proj.status=="On track") {
          td2 <- sprintf(col2,"#a2bf8a","On track")
        } else if(proj.status=="Attention required") {
          td2 <- sprintf(col2,"#fddc81","Attention required")
        } else {
          td2 <- sprintf(col2,"#f0807f","Immediate attention required")
        }
        proj.progress <- mean(progress[progress$Project==proj,]$Completion)
        bar.len <- round(proj.progress/100*25,0)
        if(!is.na(bar.len) & bar.len<1) { bar.len <- 1 }
        if(is.na(proj.progress)) {
          td3 <- "<td style='color:#999999;'>--</td>"
        } else if(proj.progress>75) {
          td3 <- sprintf(col3,"#98abc5",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>50) {
          td3 <- sprintf(col3,"#8989a6",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>25) {
          td3 <- sprintf(col3,"#6b486b",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>0){
          td3 <- sprintf(col3,"#9f5d55",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else {
          td3 <- sprintf(col3,"#d0743c",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        }
        proj.end <- suppressWarnings(max(progress[progress$Project==proj,]$Planned.End,na.rm=TRUE))
        if(is.finite(proj.end)) {
          td4 <- sprintf(col4,proj.end)
        } else {
          td4 <- "<td style='color:#999999;'>--</td>"
        }
        
        tblrow <- paste0(tblrow,td1,td2,td3,td4,"</tr>")
        htmlstr <- paste0(htmlstr,tblrow)
      }
      htmlstr <- paste0(htmlstr,"</tbody></table>")
      htmlstr2 <- paste0(shiny.header,
                         htmlstr,
                         '</body></html>')
      write(htmlstr2,"www/table.html")
      tags$iframe(src="table.html",width="100%",height="330px",frameborder=0)
    } else {
      topstr <-"<div>"
      tag1 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:%s;
      margin-right:3px;'>
      %s
      </span>"
      tag2 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:%s;
      margin-right:3px;'>
      %s%% complete
      </span>"
      tag3 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:#d9b38c;
      margin-right:3px;'>
      Anticipated end: %s
      </span>"
      proj.status <- health[health$Project==input$project_en,]$Status[1]
      if(is.na(proj.status)) {
        tg1 <- sprintf(tag1,"#bbbbbb","N/A")
      } else if(proj.status=="On track") {
        tg1 <- sprintf(tag1,"#a2bf8a","On track")
      } else if(proj.status=="Attention required") {
        tg1 <- sprintf(tag1,"#fddc81","Attention required")
      } else {
        tg1 <- sprintf(tag1,"#f0807f","Immediate attention required")
      }
      proj.progress <- mean(progress[progress$Project==input$project_en,]$Completion)
      if(is.na(proj.progress)) {
        tg2 <- sprintf(tag2,"#bbbbbb","--")
      } else if(proj.progress>75) {
        tg2 <- sprintf(tag2,"#98abc5",round(proj.progress,0))
      } else if(proj.progress>50) {
        tg2 <- sprintf(tag2,"#8989a6",round(proj.progress,0))
      } else if(proj.progress>25) {
        tg2 <- sprintf(tag2,"#6b486b",round(proj.progress,0))
      } else if(proj.progress>0){
        tg2 <- sprintf(tag2,"#9f5d55",round(proj.progress,0))
      } else {
        tg2 <- sprintf(tag2,"#d0743c",round(proj.progress,0))
      }
      proj.end <- suppressWarnings(max(progress[progress$Project==input$project_en,]$Planned.End,
                                       na.rm=TRUE))
      if(is.finite(proj.end)) {
        tg3 <- sprintf(tag3,proj.end)
      } else {
        tg3 <- sprintf(tag3,"--")
      }
      topstr <- paste0(topstr,tg1,tg2,tg3,"</div><br />")
      htmlstr <- "<div>
      <table class='table table-striped'
      style='background-color:#fffbf0; font-size:10pt; margin:0 10px;'>
      <thead>
      <tr>
      <th width='32%'>Deliverable</th>
      <th width='28%'>Status</th>
      <th width='20%'>Overall Progress</th>
      <th width='20%'>Anticipated End Date (actual if complete)</th>
      </tr>
      </thead>
      <tbody>"
      col1 <-"<td>%s</td>"
      col2 <-
        "<td>
      <span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color: %s;'>
      %s
      </span>
      </td>"
      col3 <-
        "<td>
      <span style='background-color:%s; width:50%%; margin-top:5px; border-radius:2px;'>
      %s
      </span>
      <span style='margin-top:5px; margin-left:5px;'>%s%%</span>
      </td>"
      col4 <- "<td>%s</td>"
      
      proj.data <- progress[progress$Project==input$project_en,]
      for(deliv in proj.data$Deliverables) {
        tblrow <-"<tr style='font-size:10pt;'>"
        td1 <- sprintf(col1,deliv)
        
        deliv.progress <- proj.data[proj.data$Deliverables==deliv,]$Completion[1]
        bar.len <- round(deliv.progress/100*25,0)
        if(!is.na(bar.len) & bar.len<1) { bar.len <- 1 }
        if(is.na(deliv.progress)) {
          td3 <- "<td style='color:#999999;'>--</td>"
        } else if(deliv.progress>75) {
          td3 <- sprintf(col3,"#98abc5",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>50) {
          td3 <- sprintf(col3,"#8989a6",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>25) {
          td3 <- sprintf(col3,"#6b486b",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>0){
          td3 <- sprintf(col3,"#9f5d55",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else {
          td3 <- sprintf(col3,"#d0743c",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        }
        deliv.end <- proj.data[proj.data$Deliverables==deliv,]$Planned.End[1]
        deliv.act.end <- proj.data[proj.data$Deliverables==deliv,]$Actual.End[1]
        if(deliv.progress==100 & !is.na(deliv.act.end)) {
          td4 <- sprintf(col4,deliv.act.end)
        } else if(deliv.progress==100 & !is.na(deliv.end)) {
          td4 <- sprintf(col4,deliv.end)
        } else if(deliv.progress==100) {
          td4 <- "<td style='color:#999999;'>--</td>"
        } else if(!is.na(deliv.end)) {
          td4 <- sprintf(col4,deliv.end)
        } else {
          td4 <- "<td style='color:#999999;'>--</td>"
        }
        if(is.na(deliv.act.end)) {
          td2 <- sprintf(col2,"#ccccb3","In progress")
        } else if(is.na(deliv.end)) {
          td2 <- sprintf(col2,"#bbbbbb","N/A")
        } else {
          diff <- as.period(
            interval(ymd(deliv.end),ymd(deliv.act.end))) %>% month()
          if(diff<=-1) {
            td2 <- sprintf(col2,"#9fbfdf","Early")
          } else if(diff<3) {
            td2 <- sprintf(col2,"#a2bf8a","No change")
          } else if(diff<6) {
            td2 <- sprintf(col2,"#fddc81","3-6 months")
          } else {
            td2 <- sprintf(col2,"#ee9791","6+ months")
          }
        }
        
        tblrow <- paste0(tblrow,td1,td2,td3,td4,"</tr>")
        htmlstr <- paste0(htmlstr,tblrow)
      }
      
      htmlstr <- paste0(htmlstr,"</tbody></table></div>")
      htmlstr2 <- paste0(shiny.header,htmlstr,'</body></html>')
      write(htmlstr2,"www/table.html")
      tagList(
        HTML(topstr),
        tags$iframe(src="table.html",width="100%",height="280px",frameborder=0))
    }
  })
  
  output$variance_en <- renderUI({
    htmlstr <- 
      "<span class='label' style='display:inline-block; font-size:10pt;
    padding:6px 10px 6px 10px; color:white; background-color: %s;'>
    %s
    </span>"
    if(input$project_en=="All") {
      var <- sum(budget[budget$Type=="Total","Budget"]) -
        sum(budget[budget$Type=="Total","Total.Forecast"])
    } else {
      var <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                               "Budget"]) -
        as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                          "Total.Forecast"])
    }
    var <- var*1000
    if(is.na(var)) {
      htmlstr <- "<span style='display:inline-block; color:#999999; font-size:10pt;'>N/A</span>"
    } else if(var>0) {
      htmlstr <- sprintf(htmlstr,"#a2bf8a",
                         paste0("+ $",formatC(var,format="d",big.mark=",")))
    } else if (var==0) {
      htmlstr <- sprintf(htmlstr,"#999999",paste0("$ 0"))
    } else {
      htmlstr <- sprintf(htmlstr,"#f0807f",
                         paste0("- $",formatC(-var,format="d",big.mark=",")))
    }
    HTML(htmlstr)
  })
  
  output$finance1_en <- renderPlot(bg="transparent",{
    if(input$project_en=="All") {
      d <- data.frame(Project=rep("All",2),
                      Cat=c("Budget","Forecast"),
                      Val=c(sum(budget[budget$Type=="Total","Budget"]),
                            sum(budget[budget$Type=="Total","Total.Forecast"])))
    } else {
      bgt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,"Budget"])
      fcst <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                "Total.Forecast"])
      d <- data.frame(Project=rep(input$project_en,2),
                      Cat=c("Budget","Forecast"),
                      Val=c(bgt,fcst))
    }
    p <- ggplot(d,aes(x=input$project_en,y=Val)) +
      geom_bar(aes(fill=Cat),stat="identity",width=0.45,position=position_dodge(width=0.6)) +
      geom_text(aes(label=Val),size=3,position=position_dodge2(width=0.6),vjust=-1) +
      labs(fill="Expense",x="",y="1000s of dollars") +
      ggtitle("Budget vs Total Forecast") +
      theme_minimal() +
      theme(
        plot.title = element_text(hjust=0.5,margin=margin(b=15)),
        axis.title.y = element_text(margin=margin(t=0,r=20,b=0,l=0)),
        panel.background = element_blank(),
        plot.background = element_blank()
      )
    suppressWarnings(print(p))
  })
  
  output$finance2_en <- renderPlotly({
    if(input$project_en=="All") {
      d <- data.frame(Category=factor(c("Actuals","Commitment","Anticipated"),
                                      levels=c("Actuals","Commitment","Anticipated")),
                      Value=c(sum(budget[budget$Type=="Total","Actuals"]),
                              sum(budget[budget$Type=="Total","Commitment"]),
                              sum(budget[budget$Type=="Total","Anticipated"])))
    } else {
      actuals <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,"Actuals"])
      commitment <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                      "Commitment"])
      anticipated <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                       "Anticipated"])
      d <- data.frame(Category=factor(c("Actuals","Commitment","Anticipated"),
                                      levels=c("Actuals","Commitment","Anticipated")),
                      Value=c(actuals,commitment,anticipated))
    }
    colors <- c("rgb(254,232,154)","rgb(78,163,177)","rgb(162,217,163)")
    fig <- plot_ly(d, labels=~Category, values=~Value, type="pie",
                   textposition="outside",
                   textinfo="label+percent",
                   insidetextfont=list(color="#000000"),
                   hoverinfo="text",
                   hoverlabel=list(bordercolor="#444444"),
                   text=~paste0("$ ",Value*1000),
                   marker=list(colors=colors,line=list(color="rgb(253,253,253)",width=2)),
                   showlegend=FALSE,
                   hole=0.5)
    fig <- fig %>% layout(margin=list(l=40,r=25,b=35,t=60),
                          paper_bgcolor="rgba(245,245,245,0)")
    if(!is.na(d$Value[1]) & !is.na(d$Value[2]) & !is.na(d$Value[1])
       & d$Value[1]==0 & d$Value[2]==0 & d$Value[3]==0) {
      fig <- plotly_empty(type="pie") %>%
        layout(paper_bgcolor="rgba(245,245,245,0)")
    }
    fig
  })
}