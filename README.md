<!-- README.md is generated from README.Rmd. Please edit that file -->
velo\_apps
==========

`velo_apps` provides functions of the [velo](https://github.com/jannes-m/velo)-package as RShiny Apps. This way people unfamiliar with R can now easily use `velo`-functions.

-   `spoke_length` calculates spoke lengths.
-   `fixie_teeth` calculates for a given gear ratio the optimal combination of cog ring teeth and chainring teeth in terms of skid patches.

To run `velo`-apps locally, use function `runGithub`. Taking spoke\_app as an example, you can run:

``` r
if (packageVersion("devtools") < 1.6) {
    install.packages("devtools")    
    }
if (!"lazyeval" %in% installed.packages()[, "Package"]) {
devtools::install_github("hadley/lazyeval")  
}

# install velo-package
devtools::install_github("jannes-m/velo")
# run App
shiny::runGitHub("velo_apps", "jannes-m", subdir = "spoke_length")
```

You can also clone the velo\_apps-repository to your local computer, then use `shiny::runApp("spoke_length")` to run the app.

Finally, the apps are also available on the RStudio Shiny Server:

-   App to calculate spoke lengths: <https://jannes-m.shinyapps.io/spoke_app/>
-   App to calculate the optimal teeth combination for a fixie bike: <https://jannes-m.shinyapps.io/fixie_teeth/>

Still to do
===========

1.  `spoke_length`: add source to the (visual) descriptions of the measures to take (e.g., ERD, hub to left flange, etc.) or create your own figures
