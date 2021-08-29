
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bs4cards

<!-- badges: start -->

[![R-CMD-check](https://github.com/djnavarro/bs4cards/workflows/R-CMD-check/badge.svg)](https://github.com/djnavarro/bs4cards/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/bs4cards)](https://CRAN.R-project.org/package=bs4cards)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/djnavarro/bs4cards/branch/master/graph/badge.svg)](https://codecov.io/gh/djnavarro/bs4cards?branch=master)
<!-- badges: end -->

When creating R markdown websites, I often find myself wanting to
organise content into a nice-looking grid of links with thumbnail images
and maybe a small amount of text. It’s a design pattern I use over and
over again in my own sites. Whether I’m creating previews for lectures,
profiles and bios for people, or links to galleries, I find myself
needing the ability to create content that looks something like this:

![](https://bs4cards.djnavarro.net/example-slides.png) In my ideal
world, I’d store the information in a data frame called `slides` (or
whatever) that has one row per card and columns specifying the relevant
information, and would then be able to build the card with a command
like this:

``` r
slides %>% 
  cards(
    title = messy_title,
    text = description,
    link = link_url,
    image = path_to_image
  )
```

where `title = messy_title` means that the card title should be set
using the `messy_title` variable in the `slides` data frame, and so on.

Of course, having made quite a few sites that need this kind of thing,
I’ve found that the specific layout I need for the cards varies from
case to case. Sometimes I want the text under the image (as in the
example above), other times I want the text to appear to one side, and
other times I want the text to float over the image. So I’d want to have
a `layout` argument that could switch between different layout formats,
and probably a lot of other customisation options too.

Realising that I’m certain to make many more sites that need this
functionality (and suspecting that I’m not the only one), I wrote
bs4cards to make this task a little easier inside. You can install the
development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("djnavarro/bs4cards")
```

The package exports a single function `cards()` which works as described
above. It takes a data frame as input and automatically generates the
HTML you need to create a card grid.

Awkwardly, it’s a little tricky to show all the functionality in the
README because this page displays on GitHub (as well as the package
website) and there’s no bootstrap library underneath the GitHub version…
so if you’d like to see some examples of how the package works, check
out the [get
started](https://bs4cards.djnavarro.net/articles/articles/bs4cards.html)
page!

<br><br>

![](https://bs4cards.djnavarro.net/bs4cards-logo.png)
