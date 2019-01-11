
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mtg

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/mtg.svg?branch=master)](https://travis-ci.org/tyluRp/mtg)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/mtg?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/mtg)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/mtg/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/mtg?branch=master)
<!-- badges: end -->

<img src="man/figures/dimitar-marinski-dimitar-marinski-unclaimed-territory.jpg" width="100%" />

Minimalistic client to access the [Magic: The Gathering
API](https://docs.magicthegathering.io/).

## Installation

You can install from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tyluRp/mtg")
```

## Examples

Use `mtg` to access all available endpoints:

``` r
library(mtg)

mtg("formats")
#> ✔ Request: https://api.magicthegathering.io/v1/formats
#> ✔ Status: 200
#> ✔ Content-Type: application/json; charset=utf-8
#> $formats
#>       [,1]       
#>  [1,] "1v1"      
#>  [2,] "Brawl"    
#>  [3,] "Commander"
#>  [4,] "Duel"     
#>  [5,] "Frontier" 
#>  [6,] "Future"   
#>  [7,] "Legacy"   
#>  [8,] "Modern"   
#>  [9,] "Pauper"   
#> [10,] "Penny"    
#> [11,] "Standard" 
#> [12,] "Vintage"

str(mtg("cards"), max.level = 2)
#> ✔ Request: https://api.magicthegathering.io/v1/cards
#> ✔ Status: 200
#> ✔ Content-Type: application/json; charset=utf-8
#> List of 1
#>  $ cards:'data.frame':   100 obs. of  30 variables:
#>   ..$ name         :List of 100
#>   ..$ manaCost     :List of 100
#>   ..$ cmc          :List of 100
#>   ..$ colors       :List of 100
#>   ..$ colorIdentity:List of 100
#>   ..$ type         :List of 100
#>   ..$ supertypes   :List of 100
#>   ..$ types        :List of 100
#>   ..$ subtypes     :List of 100
#>   ..$ rarity       :List of 100
#>   ..$ set          :List of 100
#>   ..$ setName      :List of 100
#>   ..$ text         :List of 100
#>   ..$ artist       :List of 100
#>   ..$ number       :List of 100
#>   ..$ power        :List of 100
#>   ..$ toughness    :List of 100
#>   ..$ layout       :List of 100
#>   ..$ multiverseid :List of 100
#>   ..$ imageUrl     :List of 100
#>   ..$ variations   :List of 100
#>   ..$ rulings      :List of 100
#>   ..$ foreignNames :List of 100
#>   ..$ printings    :List of 100
#>   ..$ originalText :List of 100
#>   ..$ originalType :List of 100
#>   ..$ legalities   :List of 100
#>   ..$ id           :List of 100
#>   ..$ flavor       :List of 100
#>   ..$ names        :List of 100
```

Additionally, we can print the response as JSON thanks to the
[jsonlite](https://github.com/jeroen/jsonlite) package:

``` r
mtg("formats", json = TRUE)
#> ✔ Request: https://api.magicthegathering.io/v1/formats
#> ✔ Status: 200
#> ✔ Content-Type: application/json; charset=utf-8
#> {
#>   "formats": [
#>     ["1v1"],
#>     ["Brawl"],
#>     ["Commander"],
#>     ["Duel"],
#>     ["Frontier"],
#>     ["Future"],
#>     ["Legacy"],
#>     ["Modern"],
#>     ["Pauper"],
#>     ["Penny"],
#>     ["Standard"],
#>     ["Vintage"]
#>   ]
#> }
```

Response information can be suppressed with `quiet = TRUE`:

``` r
mtg("formats", quiet = TRUE)
#> $formats
#>       [,1]       
#>  [1,] "1v1"      
#>  [2,] "Brawl"    
#>  [3,] "Commander"
#>  [4,] "Duel"     
#>  [5,] "Frontier" 
#>  [6,] "Future"   
#>  [7,] "Legacy"   
#>  [8,] "Modern"   
#>  [9,] "Pauper"   
#> [10,] "Penny"    
#> [11,] "Standard" 
#> [12,] "Vintage"
```

## Acknowledgements

  - Artwork: *Unclaimed Territory* by [Dimitar
    Marinski](https://www.artstation.com/dimarinski).
