
## ~~~~~~~~~~ GLOBAL DATA ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-04-13
# Description: Global data for TBI project management dashboard

library(shiny)
library(shinyjs)
library(shinycssloaders)
library(dplyr)
library(ggplot2)
library(plotly)
library(reshape2)
library(V8)
library(readxl)
library(zoo)
library(ggpubr)
library(lubridate)

# New CSVs
health <- read.csv("health.csv",header=TRUE,na.strings=c(""))
progress <- read.csv("progress.csv",header=TRUE,na.strings=c(""))
budget <- read.csv("budget.csv",header=TRUE,na.strings=c(""))

# Formatting for health data
health$Project <- as.character(health$Project)
health$IP <- as.character(health$IP)
health$Status <- as.character(health$Status)

# Formatting for progress data
progress$Project <- as.character(progress$Project)
progress$Deliverables <- as.character(progress$Deliverables)
progress$Planned.Start <- as.Date(progress$Planned.Start,"%Y-%m-%d",tz="UTC")
progress$Planned.End <- as.Date(progress$Planned.End,"%Y-%m-%d",tz="UTC")
progress$Actual.Start <- as.Date(progress$Actual.Start,"%Y-%m-%d",tz="UTC")
progress$Actual.End <- as.Date(progress$Actual.End,"%Y-%m-%d",tz="UTC")

# Formatting for budget data
budget$Project <- as.character(budget$Project)
budget$Type <- as.character(budget$Type)
for(col in c("Budget","Actuals","Commitment","Anticipated","Total.Forecast")) {
  budget[is.na(budget[,col]),col] <- 0
}

shiny.header <- '<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="application/shiny-singletons">603e796bcfc2ab3685167d58c426f64c15a95192,991a9dee8b6f41039f0d48e0f3cb481dfef69248,abbc5191535f7e95ba1254171676097ac26b5edc,2581d36bc09732ee052ca2bcc5a7ae809019206f,56c1130f97d0d86ece8834f978595a7e44693c45</script>
<script type="application/html-dependencies">json2[2014.02.04];jquery[3.4.1];shiny[1.4.0];selectize[0.11.2];htmlwidgets[1.5.1];plotly-binding[4.9.2.1];bootstrap[3.4.1]</script>
<script src="shared/json2-min.js"></script>
<script src="shared/jquery.min.js"></script>
<link href="shared/shiny.css" rel="stylesheet" />
<script src="shared/shiny.min.js"></script>
<link href="shared/selectize/css/selectize.bootstrap3.css" rel="stylesheet" />
<!--[if lt IE 9]>
<script src="shared/selectize/js/es5-shim.min.js"></script>
<![endif]-->
<script src="shared/selectize/js/selectize.min.js"></script>
<script src="htmlwidgets-1.5.1/htmlwidgets.js"></script>
<script src="plotly-binding-4.9.2.1/plotly.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="shared/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="shared/bootstrap/js/bootstrap.min.js"></script>
<script src="shared/bootstrap/shim/html5shiv.min.js"></script>
<script src="shared/bootstrap/shim/respond.min.js"></script>  <title>TBI-PPM / TIA-GPP</title>
<style>.shinyjs-hide { display: none !important; }</style>
<script>Shiny.addCustomMessageHandler("shinyjs-show", function(params) { shinyjs.debugMessage("shinyjs: calling function "show" with parameters:"); shinyjs.debugMessage(params); shinyjs.show(params);});
Shiny.addCustomMessageHandler("shinyjs-hide", function(params) { shinyjs.debugMessage("shinyjs: calling function "hide" with parameters:"); shinyjs.debugMessage(params); shinyjs.hide(params);});
Shiny.addCustomMessageHandler("shinyjs-toggle", function(params) { shinyjs.debugMessage("shinyjs: calling function "toggle" with parameters:"); shinyjs.debugMessage(params); shinyjs.toggle(params);});
Shiny.addCustomMessageHandler("shinyjs-enable", function(params) { shinyjs.debugMessage("shinyjs: calling function "enable" with parameters:"); shinyjs.debugMessage(params); shinyjs.enable(params);});
Shiny.addCustomMessageHandler("shinyjs-disable", function(params) { shinyjs.debugMessage("shinyjs: calling function "disable" with parameters:"); shinyjs.debugMessage(params); shinyjs.disable(params);});
Shiny.addCustomMessageHandler("shinyjs-toggleState", function(params) { shinyjs.debugMessage("shinyjs: calling function "toggleState" with parameters:"); shinyjs.debugMessage(params); shinyjs.toggleState(params);});
Shiny.addCustomMessageHandler("shinyjs-addClass", function(params) { shinyjs.debugMessage("shinyjs: calling function "addClass" with parameters:"); shinyjs.debugMessage(params); shinyjs.addClass(params);});
Shiny.addCustomMessageHandler("shinyjs-removeClass", function(params) { shinyjs.debugMessage("shinyjs: calling function "removeClass" with parameters:"); shinyjs.debugMessage(params); shinyjs.removeClass(params);});
Shiny.addCustomMessageHandler("shinyjs-toggleClass", function(params) { shinyjs.debugMessage("shinyjs: calling function "toggleClass" with parameters:"); shinyjs.debugMessage(params); shinyjs.toggleClass(params);});
Shiny.addCustomMessageHandler("shinyjs-html", function(params) { shinyjs.debugMessage("shinyjs: calling function "html" with parameters:"); shinyjs.debugMessage(params); shinyjs.html(params);});
Shiny.addCustomMessageHandler("shinyjs-onevent", function(params) { shinyjs.debugMessage("shinyjs: calling function "onevent" with parameters:"); shinyjs.debugMessage(params); shinyjs.onevent(params);});
Shiny.addCustomMessageHandler("shinyjs-alert", function(params) { shinyjs.debugMessage("shinyjs: calling function "alert" with parameters:"); shinyjs.debugMessage(params); shinyjs.alert(params);});
Shiny.addCustomMessageHandler("shinyjs-logjs", function(params) { shinyjs.debugMessage("shinyjs: calling function "logjs" with parameters:"); shinyjs.debugMessage(params); shinyjs.logjs(params);});
Shiny.addCustomMessageHandler("shinyjs-runjs", function(params) { shinyjs.debugMessage("shinyjs: calling function "runjs" with parameters:"); shinyjs.debugMessage(params); shinyjs.runjs(params);});
Shiny.addCustomMessageHandler("shinyjs-reset", function(params) { shinyjs.debugMessage("shinyjs: calling function "reset" with parameters:"); shinyjs.debugMessage(params); shinyjs.reset(params);});
Shiny.addCustomMessageHandler("shinyjs-delay", function(params) { shinyjs.debugMessage("shinyjs: calling function "delay" with parameters:"); shinyjs.debugMessage(params); shinyjs.delay(params);});
Shiny.addCustomMessageHandler("shinyjs-click", function(params) { shinyjs.debugMessage("shinyjs: calling function "click" with parameters:"); shinyjs.debugMessage(params); shinyjs.click(params);});</script>
<script src="shinyjs/shinyjs-default-funcs.js"></script>
<script>shinyjs.debug = false;</script>
<link rel="stylesheet" type="text/css" href="style.css"/>
<link rel="stylesheet" href="assets/spinner.css"/>
<link rel="stylesheet" href="css-loaders/css/fallback.css"/>
<link rel="stylesheet" href="css-loaders/css/load1.css"/>
<style>#spinner-fa111c89f00347edefa37fc0b175e38f, #spinner-fa111c89f00347edefa37fc0b175e38f:before, #spinner-fa111c89f00347edefa37fc0b175e38f:after {background: #999999} #spinner-fa111c89f00347edefa37fc0b175e38f {color: #999999}</style>
<style>#spinner-fa111c89f00347edefa37fc0b175e38f {font-size: 8px}spinner-fa111c89f00347edefa37fc0b175e38f8</style>
<style>#spinner-7c0ece51ee34a875379a6e8353494b2c, #spinner-7c0ece51ee34a875379a6e8353494b2c:before, #spinner-7c0ece51ee34a875379a6e8353494b2c:after {background: #999999} #spinner-7c0ece51ee34a875379a6e8353494b2c {color: #999999}</style>
<style>#spinner-7c0ece51ee34a875379a6e8353494b2c {font-size: 8px}spinner-7c0ece51ee34a875379a6e8353494b2c8</style>
<style>#spinner-68390b3bfbf316c74bcb32e6dab4ebc8, #spinner-68390b3bfbf316c74bcb32e6dab4ebc8:before, #spinner-68390b3bfbf316c74bcb32e6dab4ebc8:after {background: #999999} #spinner-68390b3bfbf316c74bcb32e6dab4ebc8 {color: #999999}</style>
<style>#spinner-68390b3bfbf316c74bcb32e6dab4ebc8 {font-size: 8px}spinner-68390b3bfbf316c74bcb32e6dab4ebc88</style>
<style>#spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe, #spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe:before, #spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe:after {background: #999999} #spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe {color: #999999}</style>
<style>#spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe {font-size: 8px}spinner-d89dac6a9d9ac35ff70f3b5ab69b51fe8</style>
<style>#spinner-ed65df870a62c09da85dc574f13690c9, #spinner-ed65df870a62c09da85dc574f13690c9:before, #spinner-ed65df870a62c09da85dc574f13690c9:after {background: #999999} #spinner-ed65df870a62c09da85dc574f13690c9 {color: #999999}</style>
<style>#spinner-ed65df870a62c09da85dc574f13690c9 {font-size: 8px}spinner-ed65df870a62c09da85dc574f13690c98</style>
<style>#spinner-3203bb262ba6e7597c93fbd425e9d013, #spinner-3203bb262ba6e7597c93fbd425e9d013:before, #spinner-3203bb262ba6e7597c93fbd425e9d013:after {background: #999999} #spinner-3203bb262ba6e7597c93fbd425e9d013 {color: #999999}</style>
<style>#spinner-3203bb262ba6e7597c93fbd425e9d013 {font-size: 8px}spinner-3203bb262ba6e7597c93fbd425e9d0138</style>
</head><body style="background-color:#fffbf0; overflow-x:hidden;">'