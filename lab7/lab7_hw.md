---
title: "Lab 7 Homework"
author: "Alejandra Ramirez"
date: "2/25/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Libraries

```r
library(tidyverse)
library(shiny)
library(shinydashboard)
```

## Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admit <- readr::read_csv("data/UC_admit.csv")
```

```
## Parsed with column specification:
## cols(
##   Campus = col_character(),
##   Academic_Yr = col_double(),
##   Category = col_character(),
##   Ethnicity = col_character(),
##   `Perc FR` = col_character(),
##   FilteredCountFR = col_double()
## )
```

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**  


```r
UC_admit
```

```
## # A tibble: 2,160 x 6
##    Campus Academic_Yr Category   Ethnicity        `Perc FR` FilteredCountFR
##    <chr>        <dbl> <chr>      <chr>            <chr>               <dbl>
##  1 Davis         2019 Applicants International    21.16%              16522
##  2 Davis         2019 Applicants Unknown          2.51%                1959
##  3 Davis         2019 Applicants White            18.39%              14360
##  4 Davis         2019 Applicants Asian            30.76%              24024
##  5 Davis         2019 Applicants Chicano/Latino   22.44%              17526
##  6 Davis         2019 Applicants American Indian  0.35%                 277
##  7 Davis         2019 Applicants African American 4.39%                3425
##  8 Davis         2019 Applicants All              100.00%             78093
##  9 Davis         2018 Applicants International    19.87%              15507
## 10 Davis         2018 Applicants Unknown          2.83%                2208
## # ... with 2,150 more rows
```



```r
colnames(UC_admit)
```

```
## [1] "Campus"          "Academic_Yr"     "Category"        "Ethnicity"      
## [5] "Perc FR"         "FilteredCountFR"
```

```r
glimpse(UC_admit)
```

```
## Observations: 2,160
## Variables: 6
## $ Campus          <chr> "Davis", "Davis", "Davis", "Davis", "Davis", "...
## $ Academic_Yr     <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019...
## $ Category        <chr> "Applicants", "Applicants", "Applicants", "App...
## $ Ethnicity       <chr> "International", "Unknown", "White", "Asian", ...
## $ `Perc FR`       <chr> "21.16%", "2.51%", "18.39%", "30.76%", "22.44%...
## $ FilteredCountFR <dbl> 16522, 1959, 14360, 24024, 17526, 277, 3425, 7...
```


```r
UC_admit%>%
  na_if("  ")%>%
  na_if("-999")%>%
  anyNA()
```

```
## [1] TRUE
```


```r
UC_admit%>%
  summarise(total_nas = sum(is.na(UC_admit)))
```

```
## # A tibble: 1 x 1
##   total_nas
##       <int>
## 1         2
```


**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to make the app neat and clean.**


```r
UC_admit%>%
  group_by(Campus)%>%
  count()
```

```
## # A tibble: 9 x 2
## # Groups:   Campus [9]
##   Campus            n
##   <chr>         <int>
## 1 Berkeley        240
## 2 Davis           240
## 3 Irvine          240
## 4 Los_Angeles     240
## 5 Merced          240
## 6 Riverside       240
## 7 San_Diego       240
## 8 Santa_Barbara   240
## 9 Santa_Cruz      240
```

```r
ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Admissions App"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
   selectInput("x", "Select X Variable", choices = c("Academic_Yr", "Campus", "Category"), 
              selected = "Academic_Yr"),
  sliderInput("pointsize", "Select the Point Size", min = 1, max = 5, value = 2, step = 0.5)
  ), # close the first box
  box(title = "Plot of UC Admissions Data", width = 7,
  plotOutput("plot", width = "600px", height = "500px")
  ) # close the second box
  ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) {
  
    # the code to make the plot of iris data grouped by species
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = input$x , y = "FilteredCountFR" , fill = "Ethnicity" )) + geom_bar(stat= "identity", position = "dodge")
  })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
  }

  
  shinyApp(ui, server)
```

```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->
  
**3. Make alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Admissions App Alternative"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
   selectInput("x", "Select X Variable", choices = c("Ethnicity", "Campus", "Category"), 
              selected = "Ethnicity"),
  sliderInput("pointsize", "Select the Point Size", min = 1, max = 5, value = 2, step = 0.5)
  ), # close the first box
  box(title = "Plot of UC Admissions Data", width = 7,
  plotOutput("plot", width = "600px", height = "500px")
  ) # close the second box
  ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) {
  
    # the code to make the plot of iris data grouped by species
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = "Academic_Yr"  , y = "FilteredCountFR"  , fill = input$x )) + geom_bar(stat= "identity", position = "dodge")
  })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
  }

  
  shinyApp(ui, server)
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->
```

## Push your final code to GitHub!


Please be sure that you check the `keep md` file in the knit preferences. 
