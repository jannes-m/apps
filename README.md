<!-- README.md is generated from README.Rmd. Please edit that file -->
velo\_apps
==========

`velo_apps` provides functions of the [velo](https://github.com/jannes-m/velo)-package as RShiny Apps. This way people unfamiliar with R can now easily use `velo`-functions.

-   `spoke_app` calculates spoke lengths.
-   `fixie_teeth` calculates for a given gear ratio the optimal combination of cog ring teeth and chainring teeth in terms of skid patches.

To run `velo`-apps locally, use function `runGithub`. Taking spoke\_app as an example, you can run:

``` r
shiny::runGitHub("velo_apps", "jannes-m", subdir = "spoke_app")
```

Another possibility is to clone the velo\_apps-repository to your local computer. Use `shiny::runApp("spoke_app")` to run the app.

Still to do
===========

1.  `spoke_app`: (visual) description of the measures to take (e.g., ERD, hub to left flange, etc.)
2.  write `fixie_app` for Olli
3.  write `trail_app` together with Dirk
