---
title: "Lab 4 Homework"
author: "Alejandra Ramirez"
date: "2/1/20"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---





## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove any `#` for included code chunks to run.  

## Load the tidyverse

```r
library(tidyverse)
```

For this assignment we are going to work with a large dataset from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. First, load the data.  

1. Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.


```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
```

```
## See spec(...) for full column specifications.
```



2. What are the names of the columns? Do you see any potential problems with the column names?


```r
names(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```
####yes, years should be part of the data

3. What is the structure of the data? Show the classes of each variable.


```r
str(fisheries)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	17692 obs. of  71 variables:
##  $ Country                : chr  "Albania" "Albania" "Albania" "Albania" ...
##  $ Common name            : chr  "Angelsharks, sand devils nei" "Atlantic bonito" "Barracudas nei" "Blue and red shrimp" ...
##  $ ISSCAAP group#         : num  38 36 37 45 32 37 33 45 38 57 ...
##  $ ISSCAAP taxonomic group: chr  "Sharks, rays, chimaeras" "Tunas, bonitos, billfishes" "Miscellaneous pelagic fishes" "Shrimps, prawns" ...
##  $ ASFIS species#         : chr  "10903XXXXX" "1750100101" "17710001XX" "2280203101" ...
##  $ ASFIS species name     : chr  "Squatinidae" "Sarda sarda" "Sphyraena spp" "Aristeus antennatus" ...
##  $ FAO major fishing area : num  37 37 37 37 37 37 37 37 37 37 ...
##  $ Measure                : chr  "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" ...
##  $ 1950                   : chr  NA NA NA NA ...
##  $ 1951                   : chr  NA NA NA NA ...
##  $ 1952                   : chr  NA NA NA NA ...
##  $ 1953                   : chr  NA NA NA NA ...
##  $ 1954                   : chr  NA NA NA NA ...
##  $ 1955                   : chr  NA NA NA NA ...
##  $ 1956                   : chr  NA NA NA NA ...
##  $ 1957                   : chr  NA NA NA NA ...
##  $ 1958                   : chr  NA NA NA NA ...
##  $ 1959                   : chr  NA NA NA NA ...
##  $ 1960                   : chr  NA NA NA NA ...
##  $ 1961                   : chr  NA NA NA NA ...
##  $ 1962                   : chr  NA NA NA NA ...
##  $ 1963                   : chr  NA NA NA NA ...
##  $ 1964                   : chr  NA NA NA NA ...
##  $ 1965                   : chr  NA NA NA NA ...
##  $ 1966                   : chr  NA NA NA NA ...
##  $ 1967                   : chr  NA NA NA NA ...
##  $ 1968                   : chr  NA NA NA NA ...
##  $ 1969                   : chr  NA NA NA NA ...
##  $ 1970                   : chr  NA NA NA NA ...
##  $ 1971                   : chr  NA NA NA NA ...
##  $ 1972                   : chr  NA NA NA NA ...
##  $ 1973                   : chr  NA NA NA NA ...
##  $ 1974                   : chr  NA NA NA NA ...
##  $ 1975                   : chr  NA NA NA NA ...
##  $ 1976                   : chr  NA NA NA NA ...
##  $ 1977                   : chr  NA NA NA NA ...
##  $ 1978                   : chr  NA NA NA NA ...
##  $ 1979                   : chr  NA NA NA NA ...
##  $ 1980                   : chr  NA NA NA NA ...
##  $ 1981                   : chr  NA NA NA NA ...
##  $ 1982                   : chr  NA NA NA NA ...
##  $ 1983                   : chr  NA NA NA NA ...
##  $ 1984                   : chr  NA NA NA NA ...
##  $ 1985                   : chr  NA NA NA NA ...
##  $ 1986                   : chr  NA NA NA NA ...
##  $ 1987                   : chr  NA NA NA NA ...
##  $ 1988                   : chr  NA NA NA NA ...
##  $ 1989                   : chr  NA NA NA NA ...
##  $ 1990                   : chr  NA NA NA NA ...
##  $ 1991                   : chr  NA NA NA NA ...
##  $ 1992                   : chr  NA NA NA NA ...
##  $ 1993                   : chr  NA NA NA NA ...
##  $ 1994                   : chr  NA NA NA NA ...
##  $ 1995                   : chr  "0 0" "1" NA "0 0" ...
##  $ 1996                   : chr  "53" "2" NA "3" ...
##  $ 1997                   : chr  "20" "0 0" NA "0 0" ...
##  $ 1998                   : chr  "31" "12" NA NA ...
##  $ 1999                   : chr  "30" "30" NA NA ...
##  $ 2000                   : chr  "30" "25" "2" NA ...
##  $ 2001                   : chr  "16" "30" NA NA ...
##  $ 2002                   : chr  "79" "24" NA "34" ...
##  $ 2003                   : chr  "1" "4" NA "22" ...
##  $ 2004                   : chr  "4" "2" "2" "15" ...
##  $ 2005                   : chr  "68" "23" "4" "12" ...
##  $ 2006                   : chr  "55" "30" "7" "18" ...
##  $ 2007                   : chr  "12" "19" NA NA ...
##  $ 2008                   : chr  "23" "27" NA NA ...
##  $ 2009                   : chr  "14" "21" NA NA ...
##  $ 2010                   : chr  "78" "23" "7" NA ...
##  $ 2011                   : chr  "12" "12" NA NA ...
##  $ 2012                   : chr  "5" "5" NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Country = col_character(),
##   ..   `Common name` = col_character(),
##   ..   `ISSCAAP group#` = col_double(),
##   ..   `ISSCAAP taxonomic group` = col_character(),
##   ..   `ASFIS species#` = col_character(),
##   ..   `ASFIS species name` = col_character(),
##   ..   `FAO major fishing area` = col_double(),
##   ..   Measure = col_character(),
##   ..   `1950` = col_character(),
##   ..   `1951` = col_character(),
##   ..   `1952` = col_character(),
##   ..   `1953` = col_character(),
##   ..   `1954` = col_character(),
##   ..   `1955` = col_character(),
##   ..   `1956` = col_character(),
##   ..   `1957` = col_character(),
##   ..   `1958` = col_character(),
##   ..   `1959` = col_character(),
##   ..   `1960` = col_character(),
##   ..   `1961` = col_character(),
##   ..   `1962` = col_character(),
##   ..   `1963` = col_character(),
##   ..   `1964` = col_character(),
##   ..   `1965` = col_character(),
##   ..   `1966` = col_character(),
##   ..   `1967` = col_character(),
##   ..   `1968` = col_character(),
##   ..   `1969` = col_character(),
##   ..   `1970` = col_character(),
##   ..   `1971` = col_character(),
##   ..   `1972` = col_character(),
##   ..   `1973` = col_character(),
##   ..   `1974` = col_character(),
##   ..   `1975` = col_character(),
##   ..   `1976` = col_character(),
##   ..   `1977` = col_character(),
##   ..   `1978` = col_character(),
##   ..   `1979` = col_character(),
##   ..   `1980` = col_character(),
##   ..   `1981` = col_character(),
##   ..   `1982` = col_character(),
##   ..   `1983` = col_character(),
##   ..   `1984` = col_character(),
##   ..   `1985` = col_character(),
##   ..   `1986` = col_character(),
##   ..   `1987` = col_character(),
##   ..   `1988` = col_character(),
##   ..   `1989` = col_character(),
##   ..   `1990` = col_character(),
##   ..   `1991` = col_character(),
##   ..   `1992` = col_character(),
##   ..   `1993` = col_character(),
##   ..   `1994` = col_character(),
##   ..   `1995` = col_character(),
##   ..   `1996` = col_character(),
##   ..   `1997` = col_character(),
##   ..   `1998` = col_character(),
##   ..   `1999` = col_character(),
##   ..   `2000` = col_character(),
##   ..   `2001` = col_character(),
##   ..   `2002` = col_character(),
##   ..   `2003` = col_character(),
##   ..   `2004` = col_character(),
##   ..   `2005` = col_character(),
##   ..   `2006` = col_character(),
##   ..   `2007` = col_character(),
##   ..   `2008` = col_character(),
##   ..   `2009` = col_character(),
##   ..   `2010` = col_character(),
##   ..   `2011` = col_character(),
##   ..   `2012` = col_character()
##   .. )
```

```r
glimpse(fisheries)
```

```
## Observations: 17,692
## Variables: 71
## $ Country                   <chr> "Albania", "Albania", "Albania", "Albania...
## $ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic...
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 3...
## $ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonito...
## $ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX",...
## $ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena ...
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 3...
## $ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)",...
## $ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA...
## $ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA...
## $ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA...
## $ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA...
## $ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA...
## $ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA...
## $ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA...
## $ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA...
## $ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA...
## $ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA...
## $ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, ...
## $ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, ...
## $ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "...
## $ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", ...
## $ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", ...
## $ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", ...
## $ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", ...
## $ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20",...
## $ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", ...
## $ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84...
## $ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", ...
## $ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285...
## $ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "1...
## $ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "1...
## $ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", ...
## $ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", ...
## $ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", ...
## $ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228",...
## $ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA...
## $ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", N...
```



4. Think about the classes. Will any present problems? Make any changes you think are necessary below.

####The years are under characters when they should be numeric

```r
fisheries<-
  fisheries%>%
  mutate_at(vars(starts_with("19")), as.numeric) %>% 
  mutate_at(vars(starts_with("2")), as.numeric) %>% 
  mutate_if(is.character, as.factor)
```

```
## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion
```

```r
glimpse(fisheries)
```

```
## Observations: 17,692
## Variables: 71
## $ Country                   <fct> Albania, Albania, Albania, Albania, Alban...
## $ `Common name`             <fct> "Angelsharks, sand devils nei", "Atlantic...
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 3...
## $ `ISSCAAP taxonomic group` <fct> "Sharks, rays, chimaeras", "Tunas, bonito...
## $ `ASFIS species#`          <fct> 10903XXXXX, 1750100101, 17710001XX, 22802...
## $ `ASFIS species name`      <fct> Squatinidae, Sarda sarda, Sphyraena spp, ...
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 3...
## $ Measure                   <fct> Quantity (tonnes), Quantity (tonnes), Qua...
## $ `1950`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1951`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1952`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1953`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1954`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1955`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1956`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1957`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1958`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1959`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1960`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1961`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1962`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1963`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1964`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1965`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1966`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1967`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1968`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1969`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1970`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1971`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1972`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1973`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1974`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1975`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1976`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1977`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1978`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1979`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1980`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1981`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1982`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1983`                    <dbl> NA, NA, NA, NA, NA, NA, 559, NA, NA, NA, ...
## $ `1984`                    <dbl> NA, NA, NA, NA, NA, NA, 392, NA, NA, NA, ...
## $ `1985`                    <dbl> NA, NA, NA, NA, NA, NA, 406, NA, NA, NA, ...
## $ `1986`                    <dbl> NA, NA, NA, NA, NA, NA, 499, NA, NA, NA, ...
## $ `1987`                    <dbl> NA, NA, NA, NA, NA, NA, 564, NA, NA, NA, ...
## $ `1988`                    <dbl> NA, NA, NA, NA, NA, NA, 724, NA, NA, NA, ...
## $ `1989`                    <dbl> NA, NA, NA, NA, NA, NA, 583, NA, NA, NA, ...
## $ `1990`                    <dbl> NA, NA, NA, NA, NA, NA, 754, NA, NA, NA, ...
## $ `1991`                    <dbl> NA, NA, NA, NA, NA, NA, 283, NA, NA, NA, ...
## $ `1992`                    <dbl> NA, NA, NA, NA, NA, NA, 196, NA, NA, NA, ...
## $ `1993`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1994`                    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1995`                    <dbl> NA, 1, NA, NA, NA, NA, 52, 30, NA, 39, NA...
## $ `1996`                    <dbl> 53, 2, NA, 3, 2, NA, 104, 8, NA, 33, NA, ...
## $ `1997`                    <dbl> 20, NA, NA, NA, NA, NA, 65, 4, NA, 33, NA...
## $ `1998`                    <dbl> 31, 12, NA, NA, NA, NA, 220, 18, NA, 51, ...
## $ `1999`                    <dbl> 30, 30, NA, NA, NA, NA, 220, 18, NA, 51, ...
## $ `2000`                    <dbl> 30, 25, 2, NA, NA, NA, 220, 20, NA, 50, N...
## $ `2001`                    <dbl> 16, 30, NA, NA, NA, NA, 120, 23, NA, 22, ...
## $ `2002`                    <dbl> 79, 24, NA, 34, 6, NA, 150, 84, NA, 52, 8...
## $ `2003`                    <dbl> 1, 4, NA, 22, NA, NA, 84, 178, NA, 43, 4,...
## $ `2004`                    <dbl> 4, 2, 2, 15, 1, 2, 76, 285, 1, 70, 5, 135...
## $ `2005`                    <dbl> 68, 23, 4, 12, 5, 6, 68, 150, 2, 75, 25, ...
## $ `2006`                    <dbl> 55, 30, 7, 18, 8, 9, 86, 102, 4, 86, 40, ...
## $ `2007`                    <dbl> 12, 19, NA, NA, NA, NA, 132, 18, NA, 47, ...
## $ `2008`                    <dbl> 23, 27, NA, NA, NA, NA, 132, 23, NA, 62, ...
## $ `2009`                    <dbl> 14, 21, NA, NA, NA, NA, 154, 20, NA, 126,...
## $ `2010`                    <dbl> 78, 23, 7, NA, NA, NA, 80, 228, NA, 98, 2...
## $ `2011`                    <dbl> 12, 12, NA, NA, NA, NA, 88, 9, NA, 90, 22...
## $ `2012`                    <dbl> 5, 5, NA, NA, NA, NA, 129, 290, NA, 125, ...
```

5. How many countries are represented in the data? Provide a count.


```r
nlevels(fisheries$Country)
```

```
## [1] 204
```




6. What are the names of the countries?


```r
levels(fisheries$Country)
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "C<f4>te d'Ivoire"          "Cabo Verde"               
##  [27] "Cambodia"                  "Cameroon"                 
##  [29] "Canada"                    "Cayman Islands"           
##  [31] "Channel Islands"           "Chile"                    
##  [33] "China"                     "China, Hong Kong SAR"     
##  [35] "China, Macao SAR"          "Colombia"                 
##  [37] "Comoros"                   "Congo, Dem. Rep. of the"  
##  [39] "Congo, Republic of"        "Cook Islands"             
##  [41] "Costa Rica"                "Croatia"                  
##  [43] "Cuba"                      "Cura<e7>ao"               
##  [45] "Cyprus"                    "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "R<e9>union"                "Romania"                  
## [149] "Russian Federation"        "Saint Barth<e9>lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "Ukraine"                  
## [191] "Un. Sov. Soc. Rep."        "United Arab Emirates"     
## [193] "United Kingdom"            "United States of America" 
## [195] "Uruguay"                   "US Virgin Islands"        
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Western Sahara"            "Yemen"                    
## [203] "Yugoslavia SFR"            "Zanzibar"
```



7. Use `rename()` to rename the columns and make them easier to use. The new column names should be:  
+ country
+ commname
+ ASFIS_sciname
+ ASFIS_spcode
+ ISSCAAP_spgroup
+ ISSCAAP_spgroupname
+ FAO_area
+ unit



```r
colnames(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```





```r
Fisheries <-
  fisheries%>%
  dplyr::rename(country='Country', commname='Common name', ASFIS_sciname="ASFIS species name", ASFIS_spcode='ASFIS species#', ISSCAAP_spgroupname='ISSCAAP taxonomic group', ISSCAAP_spgroup='ISSCAAP group#',  FAO_area='FAO major fishing area', unit='Measure')
```



```r
colnames(Fisheries)
```

```
##  [1] "country"             "commname"            "ISSCAAP_spgroup"    
##  [4] "ISSCAAP_spgroupname" "ASFIS_spcode"        "ASFIS_sciname"      
##  [7] "FAO_area"            "unit"                "1950"               
## [10] "1951"                "1952"                "1953"               
## [13] "1954"                "1955"                "1956"               
## [16] "1957"                "1958"                "1959"               
## [19] "1960"                "1961"                "1962"               
## [22] "1963"                "1964"                "1965"               
## [25] "1966"                "1967"                "1968"               
## [28] "1969"                "1970"                "1971"               
## [31] "1972"                "1973"                "1974"               
## [34] "1975"                "1976"                "1977"               
## [37] "1978"                "1979"                "1980"               
## [40] "1981"                "1982"                "1983"               
## [43] "1984"                "1985"                "1986"               
## [46] "1987"                "1988"                "1989"               
## [49] "1990"                "1991"                "1992"               
## [52] "1993"                "1994"                "1995"               
## [55] "1996"                "1997"                "1998"               
## [58] "1999"                "2000"                "2001"               
## [61] "2002"                "2003"                "2004"               
## [64] "2005"                "2006"                "2007"               
## [67] "2008"                "2009"                "2010"               
## [70] "2011"                "2012"
```

 



8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`.  


```r
fisheries_tidy <-
  Fisheries %>%
  pivot_longer(-c(country, commname, ASFIS_sciname, ASFIS_spcode, ISSCAAP_spgroupname, ISSCAAP_spgroup, FAO_area, unit) ,
  names_to = "years", 
 values_to = "catch", values_drop_na = TRUE)
```


9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.



```r
fisheries_tidy2 <-
  fisheries_tidy%>%
  select(country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, years, catch)
```



10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?


```r
glimpse(fisheries_tidy2)
```

```
## Observations: 342,121
## Variables: 6
## $ country             <fct> Albania, Albania, Albania, Albania, Albania, Al...
## $ ISSCAAP_spgroupname <fct> "Sharks, rays, chimaeras", "Sharks, rays, chima...
## $ ASFIS_spcode        <fct> 10903XXXXX, 10903XXXXX, 10903XXXXX, 10903XXXXX,...
## $ ASFIS_sciname       <fct> Squatinidae, Squatinidae, Squatinidae, Squatini...
## $ years               <chr> "1996", "1997", "1998", "1999", "2000", "2001",...
## $ catch               <dbl> 53, 20, 31, 30, 30, 16, 79, 1, 4, 68, 55, 12, 2...
```

#catch isn't a character

11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?


```r
nlevels(fisheries_tidy2$ASFIS_spcode)
```

```
## [1] 1553
```



12. Which country had the largest overall catch in the year 2000?


```r
fisheries_tidy2%>%
  filter(years==2000) %>%
  arrange(desc(catch))
```

```
## # A tibble: 8,001 x 6
##    country       ISSCAAP_spgroupname   ASFIS_spcode ASFIS_sciname   years  catch
##    <fct>         <fct>                 <fct>        <fct>           <chr>  <dbl>
##  1 Peru          Herrings, sardines, ~ 1210600208   Engraulis ring~ 2000  9.58e6
##  2 Chile         Herrings, sardines, ~ 1210600208   Engraulis ring~ 2000  1.70e6
##  3 Chile         Miscellaneous pelagi~ 1702300405   Trachurus murp~ 2000  1.23e6
##  4 Russian Fede~ Cods, hakes, haddocks 1480401601   Theragra chalc~ 2000  1.22e6
##  5 United State~ Cods, hakes, haddocks 1480401601   Theragra chalc~ 2000  1.18e6
##  6 Viet Nam      Marine fishes not id~ 199XXXXXXX0~ Osteichthyes    2000  1.01e6
##  7 Iceland       Miscellaneous pelagi~ 1230400201   Mallotus villo~ 2000  8.92e5
##  8 Myanmar       Marine fishes not id~ 199XXXXXXX0~ Osteichthyes    2000  8.73e5
##  9 Norway        Herrings, sardines, ~ 1210500105   Clupea harengus 2000  8.00e5
## 10 Chile         Herrings, sardines, ~ 1210507801   Strangomera be~ 2000  7.23e5
## # ... with 7,991 more rows
```

###Peru had the largest overall catch

13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?


```r
fisheries_tidy2%>%
  filter(years%in% c(1990,1991,1992,1992,1994,1995,1996,1997,1998,1999,2000), str_detect(ASFIS_sciname,"Sardina"))%>%
  arrange(desc(catch))
```

```
## # A tibble: 286 x 6
##    country      ISSCAAP_spgroupname    ASFIS_spcode ASFIS_sciname   years  catch
##    <fct>        <fct>                  <fct>        <fct>           <chr>  <dbl>
##  1 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1995  556152
##  2 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 2000  525859
##  3 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1997  487496
##  4 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1994  476947
##  5 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1998  426723
##  6 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1999  416171
##  7 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1996  376925
##  8 Russian Fed~ Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1990  356203
##  9 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1991  351827
## 10 Morocco      Herrings, sardines, a~ 1210506401   Sardina pilcha~ 1990  325845
## # ... with 276 more rows
```

###Morocco had largest catch of sardines


14. Which five countries caught the most cephalopods between 2008-2012?



```r
fisheries_tidy2 %>%
  filter(years %in% c(2008,2009,2010,2011,2012), str_detect(ASFIS_sciname, "Cephalopoda"))%>%
  group_by(country)%>%
  summarise(catch = sum(catch))%>%
  arrange(desc(catch))
```

```
## # A tibble: 12 x 2
##    country                   catch
##    <fct>                     <dbl>
##  1 India                    429670
##  2 China                    268557
##  3 Cambodia                  15505
##  4 Madagascar                 7971
##  5 Mozambique                 6511
##  6 Taiwan Province of China   6123
##  7 Croatia                     647
##  8 Spain                       329
##  9 Mauritania                  197
## 10 Algeria                     162
## 11 France                      101
## 12 Italy                        66
```

###Top 5 are India, China, Cambodia, Madagascar, and Mozambique


15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?


```r
fisheries_tidy2%>%
  filter(country %in% c("India", "China", "Cambodia", "Madagascar", "Mozambique"))%>%
  group_by(ASFIS_sciname)%>%
  summarise(catch=sum(catch))%>%
  arrange(desc(catch))
```

```
## # A tibble: 130 x 2
##    ASFIS_sciname            catch
##    <fct>                    <dbl>
##  1 Osteichthyes         101995246
##  2 Trichiurus lepturus   28104645
##  3 Mollusca              17862471
##  4 Crustacea             15109357
##  5 Sardinella longiceps  12948657
##  6 Sciaenidae            11039403
##  7 Natantia              10281686
##  8 Acetes japonicus       9535681
##  9 Scomber japonicus      9012279
## 10 Decapterus spp         8773533
## # ... with 120 more rows
```

####Osteichthyes was the highest catch total and Tetrapturus pfluegeri was the lowest catch

16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.


```r
coastal_fish <- 
  fisheries_tidy2%>%
  filter(str_detect(ISSCAAP_spgroupname, "Miscellaneous coastal fishes"))

coastal_fish
```

```
## # A tibble: 63,236 x 6
##    country ISSCAAP_spgroupname          ASFIS_spcode ASFIS_sciname years catch
##    <fct>   <fct>                        <fct>        <fct>         <chr> <dbl>
##  1 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1983    559
##  2 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1984    392
##  3 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1985    406
##  4 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1986    499
##  5 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1987    564
##  6 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1988    724
##  7 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1989    583
##  8 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1990    754
##  9 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1991    283
## 10 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1992    196
## # ... with 63,226 more rows
```


17. Use the data to do at least one exploratory analysis of your choice. What can you learn?


```r
coastal_fish%>%
  filter(years>=2000)%>%
  filter(str_detect(ASFIS_sciname, "Boops boops"))%>%
  arrange(catch)
```

```
## # A tibble: 336 x 6
##    country  ISSCAAP_spgroupname          ASFIS_spcode ASFIS_sciname years catch
##    <fct>    <fct>                        <fct>        <fct>         <chr> <dbl>
##  1 Portugal Miscellaneous coastal fishes 1703926101   Boops boops   2008      1
##  2 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2002      1
##  3 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2003      1
##  4 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2005      1
##  5 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2010      1
##  6 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2012      1
##  7 Togo     Miscellaneous coastal fishes 1703926101   Boops boops   2003      1
##  8 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2001      2
##  9 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2007      2
## 10 Slovenia Miscellaneous coastal fishes 1703926101   Boops boops   2009      2
## # ... with 326 more rows
```




## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   






