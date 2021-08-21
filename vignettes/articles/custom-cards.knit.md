---
title: "Customising cards"
---




In this article I'll provide an overview of the various arguments to `cards()`, and how they can be used to customise the look and feel of a card grid, using the built in `galleries` data as an example:


```r
library(bs4cards)
galleries
#> # A tibble: 7 × 5
#>   long_name              short_name   date       blurb             paintbrushes 
#>   <chr>                  <chr>        <chr>      <chr>             <chr>        
#> 1 Ash Cloud and Blood    ash          2021-07-17 Simulated waterc… ggplot2      
#> 2 Ghosts on Marble Paper ghosts       2021-01-09 Abstract landsca… ambient      
#> 3 Ice Floes              ice-floes    2021-01-19 Abstract iceberg… ambient      
#> 4 Native Flora           native-flora 2021-02-10 Collections of s… ggplot2 flam…
#> 5 Silhouettes            silhouettes  2021-01-24 Trees generated … ggplot2 rcpp…
#> 6 Track Marks            track-marks  2020-09-20 Voronoi tessella… ggplot2 rcpp 
#> 7 Viewports              viewports    2021-02-28 Simple masks wit… ggplot2 flam…
```

Because I'll be using the data repeatedly, I'll define some helper functions, one that uses the `short_name` of a gallery to construct the `preview_url()` that links to the image file to be displayed, and another one that uses it to construct the `gallery_url()` that the card links to:


```r
preview_url <- function(x) {
  paste0("https://bs4cards.djnavarro.net/image/", x, ".jpg")
} 
gallery_url <- function(x) {
  paste0("https://art.djnavarro.net/gallery/", x)
}
```

## Anatomy of a card

A typical grid will define a `title`, `image`, and `link` associated with each card, which in the simplest case produces output like this:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url(short_name),
    image = preview_url(short_name)
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
</div>
</div>
```


### Links

Every card in this grid uses the link in two places: the title and the image both link to the target location. However, there is no need to specify any link. If you set `link = NULL` (the default), the cards will be displayed in exactly the same way but will not link to anything.

### Images

It is possible to create "image only" cards by specifying only the `image` argument:


```r
galleries %>% 
  cards(image = preview_url(short_name))
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;"></div>
</div>
</div>
```

### Text and titles

Alternatively, you can define "label-only" cards that contain no images, by specifying `title`, `text`, or both:


```r
galleries %>% 
  cards(title = long_name, text = blurb)
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 1rem 1rem ;">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
```

The only constraint imposed by `cards()` is that you must include one of the three main content types: a card must have a `title`, some `text`, or an `image`. 

### Headers and footers

The "body" of a card is comprised of the `image` and the label (i.e., `title` and/or `text`), which may or may not be associated with a `link`. Optionally, you can add a `header` and/or `footer` which appear above or below the body. These appear in muted text, and are intended for the inclusion of ancillary information:


```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    footer = paste("posted on", date)
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-07-17</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-09</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-19</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-10</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-24</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2020-09-20</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-28</div>
</div>
</div>
```



## Layout of a card

The bs4cards package supports two vertical-oriented card layouts, two horizontally-oriented card layouts, and two inset layouts that place the label as a transparent overlay on top of the image. This is controlled by the `layout` argument

### Vertical layouts

If you want vertically oriented cards, set `layout = "label-above"` or `layout = "label-below"` (the default) to create the cards:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    footer = paste("posted on", date),
    layout = "label-above"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-07-17</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-09</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-19</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-10</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-24</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2020-09-20</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-28</div>
</div>
</div>
```



```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    text = blurb,
    footer = paste("posted on", date),
    layout = "label-below"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-07-17</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-09</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-19</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-10</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-24</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2020-09-20</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-28</div>
</div>
</div>
```


### Horizontal layouts

To set horizontal layouts, set `layout = "label-left"` or `layout = "label-right"`:


```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "very-wide",
    layout = "label-left"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-lg-2 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 1rem 1rem ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="col-8" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 0 1px 1px ;  border-radius: 1rem 0 0 1rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
<div class="col-4" style="border-radius: 0 1rem 1rem 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 1rem 1rem 0 ;"/>
</a>
</div>
</div>
</div>
</div>
</div>
```



```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "very-wide",
    footer = paste("posted on", date),
    layout = "label-right",
    breakpoint = 7/12
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-lg-2 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-07-17</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-09</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-19</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-10</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-01-24</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2020-09-20</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">posted on 2021-02-28</div>
</div>
</div>
```



### Inset layouts

The inset layouts place the "label" part of the card as a floating overlay on top of the image. The overlay can appear at the top or the bottom, depending on whether `layout = "inset-top"` or `layout = "inset-bottom"`:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "wide",
    layout = "inset-top", 
    colour = "#ffffffcc"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 1rem 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 1rem 1rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
</div>
</div>
</div>
</div>
</div>
```



```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "wide",
    layout = "inset-bottom", 
    colour = "#ffffffcc", 
    rounding = 0
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 0 0 0 0 ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
</div>
</div>
</div>
</div>
</div>
```



```r
galleries %>% 
  cards(
    title = long_name,
    footer = blurb,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "wide",
    layout = "inset-bottom", 
    colour = "#ffffffcc"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Simulated watercolours in ggplot2 using the transparent polygon method</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Abstract landscapes generated using ambient</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Abstract icebergs generated using ambient</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Collections of small flametrees that resemble branching plants</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Trees generated in flametree with random walk backgrounds</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Voronoi tessellations with seed points sampled from an iterated function system</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 20%;position: absolute;top: 80%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">Simple masks with ggfx using flametree-generated textures</div>
</div>
</div>
```



```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    footer = date,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    width = "wide",
    layout = "inset-bottom", 
    breakpoint = .5,
    colour = "#ffffffcc"
  )
```

```{=html}
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-07-17</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-01-09</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-01-19</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-02-10</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-01-24</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2020-09-20</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show " style="border-radius: 1rem 1rem 1rem 1rem ;">
<div style="position: relative; border-radius: 0 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 1rem 0 0 ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="background-color: #ffffffcc;height: 50%;position: absolute;top: 50%;border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="my-auto">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">2021-02-28</div>
</div>
</div>
```


## Tags

The `tags` argument can be used to assign each card to a set of tags, and adds toggle buttons at the top of the card list that the user can do to display only those cards possessing the tag in question. The tags should be a single string, with spaces separating each tag. In the `galleries` data, the `paintbrushes` variable contains a list of some of the packages that were used in generating each generative art system. It's generally a good idea to have one tag that is possessed by all of the cards. The bs4cards package doesn't enforce this, but it's easy to do as illustrated below:


```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    link = gallery_url(short_name),
    image = preview_url(short_name),
    tags = paste("all", paintbrushes),
    width = "very-wide",
    footer = paintbrushes,
    layout = "label-right",
    breakpoint = 7/12
  )
```

```{=html}
<div>
<p>
<button class="btn btn-primary" type="button" onClick="$(&#39;.all&#39;).hide(400, &#39;swing&#39;);setTimeout(function() {$(&#39;.all&#39;).show(400, &#39;swing&#39;)}, 400);">all</button>
<button class="btn btn-primary" type="button" onClick="$(&#39;.all&#39;).hide(400, &#39;swing&#39;);setTimeout(function() {$(&#39;.ggplot2&#39;).show(400, &#39;swing&#39;)}, 400);">ggplot2</button>
<button class="btn btn-primary" type="button" onClick="$(&#39;.all&#39;).hide(400, &#39;swing&#39;);setTimeout(function() {$(&#39;.ambient&#39;).show(400, &#39;swing&#39;)}, 400);">ambient</button>
<button class="btn btn-primary" type="button" onClick="$(&#39;.all&#39;).hide(400, &#39;swing&#39;);setTimeout(function() {$(&#39;.flametree&#39;).show(400, &#39;swing&#39;)}, 400);">flametree</button>
<button class="btn btn-primary" type="button" onClick="$(&#39;.all&#39;).hide(400, &#39;swing&#39;);setTimeout(function() {$(&#39;.rcpp&#39;).show(400, &#39;swing&#39;)}, 400);">rcpp</button>
</p>
<div class="row p-0 row-cols-1 row-cols-lg-2 my-1 mx-n1">
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ggplot2" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ggplot2</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ambient" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ambient</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ambient" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ambient</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ggplot2 flametree" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ggplot2 flametree</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ggplot2 rcpp flametree" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ggplot2 rcpp flametree</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ggplot2 rcpp" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ggplot2 rcpp</div>
</div>
<div class="card bg-transparent m-0 p-1 border-0 collapse.show all ggplot2 flametree" style="border-radius: 1rem 1rem 1rem 1rem ;">
<div class="card-body border-0 m-0 p-0 col-12" style="visibility: visible; background-color: #ffffffaaborder-radius: 1rem 1rem 0 0 ;">
<div class="row no-gutters" style="border-radius: 1rem 1rem 0 0 ;">
<div class="col-5" style="border-radius: 1rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: 1rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7" style="background-color: #00000000 ; border-style: solid ;  border-color: #808080 ;  border-width: 1px 1px 1px 0 ;  border-radius: 0 1rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
<div class="card-footer small text-muted h-auto px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 1rem 1rem ;">ggplot2 flametree</div>
</div>
</div>
</div>
```

<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
