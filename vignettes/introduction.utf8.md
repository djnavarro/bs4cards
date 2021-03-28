---
title: "Introduction"
---



When creating R markdown websites, I often find myself wanting to organise content into a nice-looking grid of links. For example, in a recent project I wanted something like this:


```{=html}
<div class="container">
<div class="row">
<div class="card-group m-0 mb-2 mt-2 p-0">
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://slides.djnavarro.net/index_img/starting-rmarkdown.png"/>
<div class="card-body">
<h5 class="card-title">Starting R markdown</h5>
<p class="card-text">An introduction to R markdown. The target audience is a novice R user with no previous experience with markdown.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://slides.djnavarro.net/index_img/starting-ggplot2.png"/>
<div class="card-body">
<h5 class="card-title">Starting ggplot2</h5>
<p class="card-text">An introduction to ggplot2. The target audience is a novice user with no previous experience with R or ggplot2.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://slides.djnavarro.net/index_img/starting-programming.png"/>
<div class="card-body">
<h5 class="card-title">Starting programming</h5>
<p class="card-text">This is primarily a tutorial on making generative art in R, but in doing so introduces core programming constructs and data structures. It is assumed the user has some previous experience with ggplot2.</p>
</div>
</div>
</div>
</div>
</div>
</div>
```

The goal of bs4cards is to his task a little easier inside an R markdown document or website. 


## Enabling bootstrap 4

The `bs4cards` package takes its name from the "cards" system introduced in bootstrap version 4, and the package does not work for R markdown documents that rely on bootstrap version 3. To ensure that you are using bootstrap 4, you need to edit the YAML header for your document to specify which version of bootstrap you want to use. For example, here is the relevant section of YAML you might use in a simple R markdown site 

```
output:
  html_document:
    theme:
      version: 4
```

This overrides the R markdown defaults to ensure that the output is built using [boostrap 4.5](https://getbootstrap.com/docs/4.5/getting-started/introduction/) rather than an older version (boostrap 3.4) that doesn't support cards.

To enable bootstrap 4 in a pkgdown site (such as this one), edit the `_pkgdown.yml` file to include the following

```
template:
  bootstrap: 4
```

(You may need to update to the development version of pkgdown to make this work!)


## Basic cards



```r
library(bs4cards)
card(
  title = "My First Card",
  image = "https://placekitten.com/300/200",
  text = "The image above is from placekitten.com. It is extremely cute."
)
```

```{=html}
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/300/200"/>
<div class="card-body">
<h5 class="card-title">My First Card</h5>
<p class="card-text">The image above is from placekitten.com. It is extremely cute.</p>
</div>
</div>
</div>
```


```r
card(
  title = "My First Card",
  image = "https://placekitten.com/300/200",
  text = "The image below is from placekitten.com. It is extremely cute.",
  image_align = "bottom"
)
```

```{=html}
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<div class="card-body">
<h5 class="card-title">My First Card</h5>
<p class="card-text">The image below is from placekitten.com. It is extremely cute.</p>
</div>
<img class="card-img-bottom p-0" src="https://placekitten.com/300/200"/>
</div>
</div>
```


## Card grids



```r
kitty <- function( ...) {
  card(
    title = "A kitten card",
    image = sample_kitten(),
    text = sample_lorem(),
    ...
  )
}

kitty_list <- list(kitty(), kitty(), kitty(), 
                   kitty(), kitty(), kitty())

card_group(kitty_list)
```

```{=html}
<div class="container">
<div class="row">
<div class="card-group m-0 mb-2 mt-2 p-0">
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/298/155"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Dolere malum est: in crucem qui agitur, beatus esse non potest. Graece donan, Latine voluptatem vocant. Quae fere omnia appellantur uno ingenii nomine, easque virtutes qui habent, ingeniosi vocantur.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/296/230"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Si quicquam extra virtutem habeatur in bonis. Eam si varietatem diceres, intellegerem, ut etiam non dicente te intellego; Honesta oratio, Socratica, Platonis etiam.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/349/187"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Itaque hic ipse iam pridem est reiectus; Haec para/doca illi, nos admirabilia dicamus. Qui ita affectus, beatum esse numquam probabis;</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/265/205"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Satis est tibi in te, satis in legibus, satis in mediocribus amicitiis praesidii. Facile pateremur, qui etiam nunc agendi aliquid discendique causa prope contra naturam vígillas suscipere soleamus.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/307/215"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Sed ea mala virtuti magnitudine obruebantur. Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? Et nemo nimium beatus est; Ita ne hoc quidem modo paria peccata sunt.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/275/202"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Praeclare enim Plato: Beatum, cui etiam in senectute contigerit, ut sapientiam verasque opiniones assequi possit. Nobis aliter videtur, recte secusne, postea; Non semper, inquam; Eam tum adesse, cum dolor omnis absit;</p>
</div>
</div>
</div>
</div>
</div>
</div>
```


## Headers and footers



```r
list(kitty(footer = "Kitten A"), 
     kitty(footer = "Kitten B"), 
     kitty(footer = "Kitten C")) %>% 
  card_group()
```

```{=html}
<div class="container">
<div class="row">
<div class="card-group m-0 mb-2 mt-2 p-0">
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/261/194"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Dempta enim aeternitate nihilo beatior Iuppiter quam Epicurus; Nosti, credo, illud: Nemo pius est, qui pietatem-; Scaevola tribunus plebis ferret ad plebem vellentne de ea re quaeri.</p>
</div>
<div class="card-footer">Kitten A</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/285/239"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Omnia contraria, quos etiam insanos esse vultis. Et nemo nimium beatus est; Ita ne hoc quidem modo paria peccata sunt. Beatus sibi videtur esse moriens.</p>
</div>
<div class="card-footer">Kitten B</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/309/238"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Tria genera bonorum; At quicum ioca seria, ut dicitur, quicum arcana, quicum occulta omnia? Itaque hic ipse iam pridem est reiectus; Eam si varietatem diceres, intellegerem, ut etiam non dicente te intellego;</p>
</div>
<div class="card-footer">Kitten C</div>
</div>
</div>
</div>
</div>
</div>
```



```r
list(kitty(header = "Kitten A"), 
     kitty(header = "Kitten B"), 
     kitty(header = "Kitten C")) %>% 
  card_group()
```

```{=html}
<div class="container">
<div class="row">
<div class="card-group m-0 mb-2 mt-2 p-0">
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<div class="card-header">Kitten A</div>
<img class="card-img-top p-0" src="https://placekitten.com/314/198"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Quae fere omnia appellantur uno ingenii nomine, easque virtutes qui habent, ingeniosi vocantur. Quam ob rem tandem, inquit, non satisfacit? Contemnit enim disserendi elegantiam, confuse loquitur.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<div class="card-header">Kitten B</div>
<img class="card-img-top p-0" src="https://placekitten.com/286/188"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Praeclare enim Plato: Beatum, cui etiam in senectute contigerit, ut sapientiam verasque opiniones assequi possit. Haec para/doca illi, nos admirabilia dicamus. Facillimum id quidem est, inquam. Paria sunt igitur.</p>
</div>
</div>
</div>
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<div class="card-header">Kitten C</div>
<img class="card-img-top p-0" src="https://placekitten.com/258/226"/>
<div class="card-body">
<h5 class="card-title">A kitten card</h5>
<p class="card-text">Facillimum id quidem est, inquam. Paria sunt igitur. Et nemo nimium beatus est; Ita ne hoc quidem modo paria peccata sunt. Omnis est enim de virtutis dignitate contentio.</p>
</div>
</div>
</div>
</div>
</div>
</div>
```


## Customising card width



```r
card(
  title = "My First Card",
  image = "https://placekitten.com/300/200",
  text = "The image above is from placekitten.com. It is extremely cute.",
  width = bs_col(medium = 4) 
)
```

```{=html}
<div class="col-12 col-md-4 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/300/200"/>
<div class="card-body">
<h5 class="card-title">My First Card</h5>
<p class="card-text">The image above is from placekitten.com. It is extremely cute.</p>
</div>
</div>
</div>

card(
  title = "My First Card",
  image = "https://placekitten.com/300/200",
  text = "The image above is from placekitten.com. It is extremely cute.",
  width = bs_col(medium = 6) 
)
```

```{=html}
<div class="col-12 col-md-6 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/300/200"/>
<div class="card-body">
<h5 class="card-title">My First Card</h5>
<p class="card-text">The image above is from placekitten.com. It is extremely cute.</p>
</div>
</div>
</div>

card(
  title = "My First Card",
  image = "https://placekitten.com/300/200",
  text = "The image above is from placekitten.com. It is extremely cute.",
  width = bs_col(large = 6) 
)
```

```{=html}
<div class="col-12 col-lg-6 m-0 p-2 d-flex">
<div class="card">
<img class="card-img-top p-0" src="https://placekitten.com/300/200"/>
<div class="card-body">
<h5 class="card-title">My First Card</h5>
<p class="card-text">The image above is from placekitten.com. It is extremely cute.</p>
</div>
</div>
</div>
```



