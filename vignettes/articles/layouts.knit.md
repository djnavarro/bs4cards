---
title: "Card layouts"
---




```r
library(bs4cards)
```


The bs4cards package supports a total eight different `layout` formats. First, there are two vertical layouts and two horizontal layouts:

- Setting `layout = "label-below"` places the label below the image (the default)
- Setting `layout = "label-above"` places the label above the image
- Setting `layout = "label-left"` places the label to the left of the image
- Setting `layout = "label-right"` places the label to the right of the image

In addition there are two "singleton" layouts:

- Setting `layout = "label-only"` includes a label but no image
- Setting `layout = "image-only"` includes an image but no label

Finally there are two "inset" layouts" 

- Setting `layout = "inset-top"` places the label at the top of the image
- Setting `layout = "inset-bottom"` places the label at the bottom of the image


## Vertical layouts

The vertical `label-below` layout is the default for bs4cards. Images are placed above the label, with the label title above text. Footers (if present) appear under the label, and the header (if present) is shown above:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url,
    image = image_url,
    layout = "label-below"
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-top" style="border-style:solid; border-color:#808080; border-width:1px 1px 0 1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: 0 0 .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
</div>
</div>
</div>
```

The `label-above` layout reverses the positions of label and image:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url,
    image = image_url,
    layout = "label-above"
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ash Cloud and Blood</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ghosts on Marble Paper</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Ice Floes</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Native Flora</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Silhouettes</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Track Marks</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-3">Viewports</h5>
</a>
</div>
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img-bottom" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;"/>
</a>
</div>
</div>
</div>
```


## Horizontal layouts

Horizontal card layouts are also supported in bs4cards, by setting `layout = "label-left"` or `layout = "label-right"`. Here's an example:


```r
galleries %>% 
  cards(
    title = long_name,
    link = gallery_url,
    image = image_url,
    text = blurb,
    footer = date,
    layout = "label-right",
    width = 4
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-lg-2" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-07-17</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-09</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-19</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-02-10</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-24</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2020-09-20</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-02-28</div>
</div>
</div>
</div>
```

Notice that I set `width = 4` for the horizontal card. Horizontal layouts tend to need more horizontal space, especially when the label includes text as well as a title. When text overflows, the lower border shifts downward. This behaviour ensures that the image does not get cropped or the aspect ratio altered, but can lead to very cramped looking cards if they are not given sufficient space:


```r
galleries[1:6, ] %>% 
  cards(
    title = long_name,
    link = gallery_url,
    image = image_url,
    text = blurb,
    footer = date,
    layout = "label-right",
    width = 2
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-07-17</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-09</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-19</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-02-10</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2021-01-24</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body m-0 p-0 col-12" style="visibility: visible; border-style:solid; border-color:#808080; border-width:1px; background-color: #ffffffaa;border-radius: .3rem .3rem 0 0 ;">
<div class="row no-gutters h-100 border-0" style="border-radius: .3rem .3rem 0 0 ;">
<div class="col-5" style="border-radius: .3rem 0 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; margin-left: -1px;margin-right: -1px;margin-top: -1px;margin-bottom: -1px;border-radius: .3rem 0 0 0 ;"/>
</a>
</div>
<div class="col-7 h-100">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">2020-09-20</div>
</div>
</div>
</div>
```


## Image-only layout

In some cases there is no label to accompany the image, in which case setting `layout = "image-only"` is appropriate:


```r
galleries[1:3, ] %>% 
  cards(
    link = gallery_url,
    image = image_url,
    layout = "image-only"
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
</div>
</div>
</div>
```

It is still possible to add headers and footers, however:


```r
galleries[1:3, ] %>% 
  cards(
    link = gallery_url,
    image = image_url,
    footer = long_name,
    layout = "image-only"
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">Ash Cloud and Blood</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">Ghosts on Marble Paper</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;"/>
</a>
<div class="card-footer small text-muted px-3 py-auto" style="border-style:solid; border-color:#808080; border-width:0 1px 1px 1px; border-radius: 0 0 .3rem .3rem ;">Ice Floes</div>
</div>
</div>
</div>
```


## Text-only layout

As a convenience, the `cards()` function will detect when the user has not specified a label (or image) and will choose the appropriate layout automatically:


```r
galleries %>% 
  cards(
    link = gallery_url,
    text = blurb
  )
#> using 'label-only' layout
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ash"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ghosts"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/ice-floes"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/native-flora"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/silhouettes"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/track-marks"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div class="card-body justify-content-end m-0 p-0" style="visibility: visible; background-color: #ffffffaa; border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;">
<a href="https://art.djnavarro.net/gallery/viewports"></a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
</div>
```



## Inset layouts

Finally there are two "inset" layouts, in which the label is displayed as an overlay on top of the image. These two layouts are experimental, and I wouldn't advise using them just yet. But if you want to try...


```r
galleries %>% 
  cards(
    title = long_name,
    text = blurb,
    link = gallery_url,
    image = image_url,
    layout = "inset-top"
  )
```

```{=html}
<div>
<div class="row p-0 row-cols-1 row-cols-md-2 row-cols-lg-3" style="margin-left: -.2rem; margin-right: -.2rem; margin-top: 1rem; margin-bottom: 1rem; ">
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ash">
<img src="https://bs4cards.djnavarro.net/image/ash.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/ash">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ash Cloud and Blood</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simulated watercolours in ggplot2 using the transparent polygon method</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ghosts">
<img src="https://bs4cards.djnavarro.net/image/ghosts.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/ghosts">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ghosts on Marble Paper</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract landscapes generated using ambient</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<img src="https://bs4cards.djnavarro.net/image/ice-floes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/ice-floes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Ice Floes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Abstract icebergs generated using ambient</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/native-flora">
<img src="https://bs4cards.djnavarro.net/image/native-flora.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/native-flora">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Native Flora</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Collections of small flametrees that resemble branching plants</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<img src="https://bs4cards.djnavarro.net/image/silhouettes.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/silhouettes">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Silhouettes</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Trees generated in flametree with random walk backgrounds</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/track-marks">
<img src="https://bs4cards.djnavarro.net/image/track-marks.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/track-marks">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Track Marks</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Voronoi tessellations with seed points sampled from an iterated function system</p>
</div>
</div>
</div>
</div>
</div>
<div class="card bg-transparent m-0 border-0 collapse.show NA" style="padding: .2rem ; border-radius: .3rem .3rem .3rem .3rem ;">
<div style="position: relative; border-radius: .3rem .3rem 0 0 ;">
<a href="https://art.djnavarro.net/gallery/viewports">
<img src="https://bs4cards.djnavarro.net/image/viewports.jpg" class="card-img" style="border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem .3rem .3rem ;"/>
</a>
<div class="card-img-overlay p-0 m-0" style="overflow: hidden;background-color: #ffffffaa;height: 50%;position: absolute;top: 0%;border-style:solid; border-color:#808080; border-width:1px; border-radius: .3rem .3rem 0 0 ;">
<div class="d-flex flex-column h-100">
<div class="mb-auto">
<a href="https://art.djnavarro.net/gallery/viewports">
<h5 class="card-title my-auto px-3 pt-3 pb-1">Viewports</h5>
</a>
<p class="card-text my-auto px-3 pb-3 pt-1">Simple masks with ggfx using flametree-generated textures</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
```
