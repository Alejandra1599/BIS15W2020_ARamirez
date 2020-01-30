---
title: "Lab 3 HW"
output: 
  html_document: 
    keep_md: yes
---


## R Markdown

---
title: "Lab 3 Homework"
author: "Alejandra Ramirez"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run.  

## Load the tidyverse

```r
library(tidyverse)
```

```
## Warning: package 'tidyverse' was built under R version 3.6.2
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.2.1     v purrr   0.3.3
## v tibble  2.1.3     v dplyr   0.8.3
## v tidyr   1.0.0     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## Warning: package 'ggplot2' was built under R version 3.6.1
```

```
## Warning: package 'tibble' was built under R version 3.6.1
```

```
## Warning: package 'tidyr' was built under R version 3.6.1
```

```
## Warning: package 'readr' was built under R version 3.6.1
```

```
## Warning: package 'purrr' was built under R version 3.6.1
```

```
## Warning: package 'dplyr' was built under R version 3.6.1
```

```
## Warning: package 'stringr' was built under R version 3.6.2
```

```
## Warning: package 'forcats' was built under R version 3.6.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

1. Load the data into a new object called `homerange`.  


```r
homerange <- readr::read_csv("data/Tamburelloetal_HomerangeDatabase.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double()
## )
```

```
## See spec(...) for full column specifications.
```


2. Use `spec()` to see the full details of the columns.  


```r
spec(homerange)
```

```
## cols(
##   taxon = col_character(),
##   common.name = col_character(),
##   class = col_character(),
##   order = col_character(),
##   family = col_character(),
##   genus = col_character(),
##   species = col_character(),
##   primarymethod = col_character(),
##   N = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   alternative.mass.reference = col_character(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   hra.reference = col_character(),
##   realm = col_character(),
##   thermoregulation = col_character(),
##   locomotion = col_character(),
##   trophic.guild = col_character(),
##   dimension = col_character(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double(),
##   prey.size.reference = col_character()
## )
```


3. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks. 


```r
dim(homerange)
```

```
## [1] 569  24
```


```r
names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```


```r
variable.names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```


```r
summary(homerange)
```

```
##     taxon           common.name           class          
##  Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character  
##                                                          
##                                                          
##                                                          
##                                                          
##     order              family             genus          
##  Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character  
##                                                          
##                                                          
##                                                          
##                                                          
##    species          primarymethod           N            
##  Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character  
##                                                          
##                                                          
##                                                          
##                                                          
##   mean.mass.g        log10.mass      alternative.mass.reference
##  Min.   :      0   Min.   :-0.6576   Length:569                
##  1st Qu.:     50   1st Qu.: 1.6990   Class :character          
##  Median :    330   Median : 2.5185   Mode  :character          
##  Mean   :  34602   Mean   : 2.5947                             
##  3rd Qu.:   2150   3rd Qu.: 3.3324                             
##  Max.   :4000000   Max.   : 6.6021                             
##                                                                
##   mean.hra.m2          log10.hra      hra.reference     
##  Min.   :0.000e+00   Min.   :-1.523   Length:569        
##  1st Qu.:4.500e+03   1st Qu.: 3.653   Class :character  
##  Median :3.934e+04   Median : 4.595   Mode  :character  
##  Mean   :2.146e+07   Mean   : 4.709                     
##  3rd Qu.:1.038e+06   3rd Qu.: 6.016                     
##  Max.   :3.551e+09   Max.   : 9.550                     
##                                                         
##     realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character  
##                                                          
##                                                          
##                                                          
##                                                          
##  trophic.guild       dimension            preymass        
##  Length:569         Length:569         Min.   :     0.67  
##  Class :character   Class :character   1st Qu.:    20.02  
##  Mode  :character   Mode  :character   Median :    53.75  
##                                        Mean   :  3989.88  
##                                        3rd Qu.:   363.35  
##                                        Max.   :130233.20  
##                                        NA's   :502        
##  log10.preymass         PPMR         prey.size.reference
##  Min.   :-0.1739   Min.   :  0.380   Length:569         
##  1st Qu.: 1.3014   1st Qu.:  3.315   Class :character   
##  Median : 1.7304   Median :  7.190   Mode  :character   
##  Mean   : 2.0188   Mean   : 31.752                      
##  3rd Qu.: 2.5603   3rd Qu.: 15.966                      
##  Max.   : 5.1147   Max.   :530.000                      
##  NA's   :502       NA's   :502
```




4. Are there NA's in your data? Show the code that you would use to verify this, please.  


```r
anyNA(homerange)
```

```
## [1] TRUE
```


5. Change the class of the variables `taxon` and `order` to factors and display their levels.  


```r
t<- class(homerange$taxon)
f<- class(homerange$order)

tf<- as.factor(t) 
ff<- as.factor(f)

levels(tf)
```

```
## [1] "character"
```

```r
levels(ff)
```

```
## [1] "character"
```


6. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer?  


```r
mean_mass <-homerange$mean.mass.g
log10_mass <-homerange$log10.mass
family <- homerange$family
genus <- homerange$genus
species <- homerange$genus

deer <- data.frame(mean_mass, log10_mass, family, genus, species)%>%
  filter(family == "cervidae")%>%
  arrange(desc(log10_mass))
deer
```

```
##    mean_mass log10_mass   family      genus    species
## 1  307227.44    5.48746 cervidae      alces      alces
## 2  234757.78    5.37062 cervidae     cervus     cervus
## 3  102058.69    5.00885 cervidae   rangifer   rangifer
## 4   87884.04    4.94391 cervidae odocoileus odocoileus
## 5   71449.63    4.85400 cervidae       dama       dama
## 6   62823.19    4.79812 cervidae       axis       axis
## 7   53864.17    4.73130 cervidae odocoileus odocoileus
## 8   35000.16    4.54407 cervidae ozotoceros ozotoceros
## 9   29450.32    4.46909 cervidae     cervus     cervus
## 10  24050.27    4.38112 cervidae  capreolus  capreolus
## 11  13499.88    4.13033 cervidae  muntiacus  muntiacus
## 12   7499.98    3.87506 cervidae       pudu       pudu
```

##largest deer is alces

7. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!  


```r
homerange %>%
  select(mean.hra.m2, species, taxon) %>%
  filter(taxon=="snakes")%>%
  arrange(mean.hra.m2)
```

```
## # A tibble: 41 x 3
##    mean.hra.m2 species      taxon 
##          <dbl> <chr>        <chr> 
##  1        200  schneideri   snakes
##  2        253  viridis      snakes
##  3        600  butleri      snakes
##  4        700  vermis       snakes
##  5       2400  latastei     snakes
##  6       2614. shedaoensis  snakes
##  7       6476  punctatus    snakes
##  8      10655  piscivorous  snakes
##  9      15400  rufodorsatus snakes
## 10      17400  catenifer    snakes
## # ... with 31 more rows
```
## schneideri has the smallest homerange and is the world's smallest viper

8. You suspect that homerange and mass are correlated in birds. We need a ratio that facilitates exploration of this prediction. First, build a new dataframe called `hra_ratio` that is limited to genus, species, mean.mass.g, log10.mass, log10.hra. Arrange it in ascending order by mean mass in grams.  


```r
hra_ratio <-
  homerange%>%
  filter(taxon == "birds")%>%
  select(genus, species, mean.mass.g, log10.mass, log10.hra)%>%
  arrange(mean.mass.g)
hra_ratio
```

```
## # A tibble: 140 x 5
##    genus        species      mean.mass.g log10.mass log10.hra
##    <chr>        <chr>              <dbl>      <dbl>     <dbl>
##  1 regulus      regulus             5.15      0.712      4.30
##  2 regulus      ignicapillus        5.3       0.724      4.22
##  3 phylloscopus bonelli             7.5       0.875      4.54
##  4 aegithalos   caudatus            8         0.903      4.62
##  5 vireo        atricapillus        8.5       0.929      4.18
##  6 setophaga    magnolia            8.6       0.934      3.86
##  7 certhia      familiaris          8.77      0.943      4.67
##  8 sylvia       undata              8.8       0.944      3.45
##  9 setophaga    ruticilla           9         0.954      3.29
## 10 setophaga    virens              9         0.954      3.81
## # ... with 130 more rows
```


9. Replace the existing `hra_ratio` dataframe with a new dataframe that adds a column calculating the ratio of log 10 hra to log 10 mass. Call it `hra.mass.ratio`. Arrange it in descending order by mean mass in grams.


```r
hra_ratio <-
  hra_ratio%>%
  mutate(hra.mass.ratio = log10.hra/log10.mass)%>%
  arrange(desc(mean.mass.g))
hra_ratio
```

```
## # A tibble: 140 x 6
##    genus      species      mean.mass.g log10.mass log10.hra hra.mass.ratio
##    <chr>      <chr>              <dbl>      <dbl>     <dbl>          <dbl>
##  1 struthio   camelus            88250       4.95      7.93           1.60
##  2 rhea       americana          25000       4.40      6.39           1.45
##  3 rhea       pennata            15000       4.18      7.38           1.77
##  4 aquila     chrysaetos          3000       3.48      7.44           2.14
##  5 tetrao     urogallus           2936       3.47      6.74           1.94
##  6 apteryx    australis           2320       3.37      5.67           1.68
##  7 neophron   percnopterus        2203       3.34      7.80           2.33
##  8 bubo       bubo                2191       3.34      7.20           2.16
##  9 hieraaetus fasciatus           2049       3.31      7.29           2.20
## 10 strigops   habroptilus         1941       3.29      5.29           1.61
## # ... with 130 more rows
```



10. What is the lowest mass for birds with a `hra.mass.ratio` greater than or equal to 4.0?


```r
hra_ratio%>%
  filter(hra.mass.ratio >= 4)%>%
  arrange(mean.mass.g)
```

```
## # A tibble: 17 x 6
##    genus        species     mean.mass.g log10.mass log10.hra hra.mass.ratio
##    <chr>        <chr>             <dbl>      <dbl>     <dbl>          <dbl>
##  1 regulus      regulus            5.15      0.712      4.30           6.04
##  2 regulus      ignicapill~        5.3       0.724      4.22           5.82
##  3 phylloscopus bonelli            7.5       0.875      4.54           5.19
##  4 aegithalos   caudatus           8         0.903      4.62           5.12
##  5 vireo        atricapill~        8.5       0.929      4.18           4.49
##  6 setophaga    magnolia           8.6       0.934      3.86           4.13
##  7 certhia      familiaris         8.77      0.943      4.67           4.95
##  8 wilsonia     canadensis         9.3       0.968      4.01           4.14
##  9 troglodytes  troglodytes        9.5       0.978      4.01           4.10
## 10 cisticola    juncidis           9.8       0.991      4.16           4.20
## 11 vireo        belli             10         1          4.07           4.07
## 12 parus        carolinens~       10.1       1.00       4.18           4.16
## 13 hippolais    polyglotta        11         1.04       4.48           4.30
## 14 parus        palustris         11         1.04       4.36           4.18
## 15 spizella     passerina         12.2       1.09       4.49           4.13
## 16 contopus     virens            13.8       1.14       4.64           4.07
## 17 motacilla    alba              21.2       1.33       5.89           4.44
```

##lowest mass for birds is 5.15g

11. Do a search online; what is the common name of the bird from #8 above? Place a link in your markdown file that takes us to a webpage with information on its biology.  


[linked phrase] (https://en.wikipedia.org/wiki/Kinglet)


12. What is the `hra.mass.ratio` for an ostrich? Show your work, please.





```r
Ostrich<-
  homerange %>%
  filter(common.name == "ostrich") %>%
  mutate(hra.ostrich = log10.hra/log10.mass) %>%
  select(hra.ostrich)
Ostrich
```

```
## # A tibble: 1 x 1
##   hra.ostrich
##         <dbl>
## 1        1.60
```


## Push your final code to GitHub!
Please be sure that you have check the `keep md` file in the knit preferences.  
