
#' Generate a random kitten card
#'
#' @param ... Arguments to be passed to `card()`
#'
#' @return Specification for a bootstrap card
#' @export
sample_card <- function(...) {
  card(
    title = "A kitten card",
    image = sample_kitten(),
    text = sample_lorem(),
    ...
  )
}


#' Generate a placekitten image URL
#'
#' @return A string containing the URL
#' @export
#'
sample_kitten <- function() {
  pixels_wide <- sample(250:350, 1)
  pixels_high <- sample(150:250, 1)
  kitten <- paste("https://placekitten.com", pixels_wide, pixels_high, sep = "/")
  return(kitten)
}


#' Generate lorem ipsum text
#'
#' @param use_cache Sample from cached lorem ipusm text? (default = TRUE)
#'
#' @return A string containing the text
#' @export
#'
sample_lorem <- function(use_cache = TRUE) {
  if(use_cache) {

    cache <- c(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "Nescio quo modo praetervolavit oratio.",
      "Sed quanta sit alias, nunc tantum possitne esse tanta.",
      "Scaevola tribunus plebis ferret ad plebem vellentne de ea re quaeri.",
      "Equidem e Cn. Duo Reges: constructio interrete.",
      "Beatus sibi videtur esse moriens.",
      "Nosti, credo, illud: Nemo pius est, qui pietatem-;",
      "Et certamen honestum et disputatio splendida!",
      "Omnis est enim de virtutis dignitate contentio.",
      "Dolere malum est: in crucem qui agitur, beatus esse non potest.",
      "Eadem nunc mea adversum te oratio est.",
      "Quid est, quod ab ea absolvi et perfici debeat?",
      "Eam si varietatem diceres, intellegerem, ut etiam non dicente te intellego;",
      "Honesta oratio, Socratica, Platonis etiam.",
      "Sed erat aequius Triarium aliquid de dissensione nostra iudicare.",
      "Quorum sine causa fieri nihil putandum est.",
      "Nobis aliter videtur, recte secusne, postea;",
      "Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit?",
      "Quid igitur dubitamus in tota eius natura quaerere quid sit effectum?",
      "Sed ea mala virtuti magnitudine obruebantur.",
      "Omnia contraria, quos etiam insanos esse vultis.",
      "Sed emolumenta communia esse dicuntur, recte autem facta et peccata non habentur communia.",
      "Ut non sine causa ex iis memoriae ducta sit disciplina.",
      "Facile pateremur, qui etiam nunc agendi aliquid discendique causa prope contra naturam vígillas suscipere soleamus.",
      "Facillimum id quidem est, inquam. Paria sunt igitur.",
      "Quae fere omnia appellantur uno ingenii nomine, easque virtutes qui habent, ingeniosi vocantur.",
      "Satis est tibi in te, satis in legibus, satis in mediocribus amicitiis praesidii.",
      "Vos autem cum perspicuis dubia debeatis illustrare, dubiis perspicua conamini tollere.",
      "Ita ne hoc quidem modo paria peccata sunt.",
      "Neque solum ea communia, verum etiam paria esse dixerunt.",
      "Non semper, inquam; Eam tum adesse, cum dolor omnis absit;",
      "Dempta enim aeternitate nihilo beatior Iuppiter quam Epicurus;",
      "Qui ita affectus, beatum esse numquam probabis;",
      "Sic igitur in homine perfectio ista in eo potissimum, quod est optimum, id est in virtute, laudatur.",
      "Gracchum patrem non beatiorem fuisse quam fillum, cum alter stabilire rem publicam studuerit, alter evertere.",
      "Quae fere omnia appellantur uno ingenii nomine, easque virtutes qui habent, ingeniosi vocantur.",
      "Eaedem res maneant alio modo.",
      "Si quicquam extra virtutem habeatur in bonis.",
      "Praeclare enim Plato: Beatum, cui etiam in senectute contigerit, ut sapientiam verasque opiniones assequi possit.",
      "Eiuro, inquit adridens, iniquum, hac quidem de re; Apparet statim, quae sint officia, quae actiones.",
      "Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare;",
      "An me, inquam, nisi te audire vellem, censes haec dicturum fuisse?",
      "Ergo ita: non posse honeste vivi, nisi honeste vivatur?",
      "Quasi vero, inquit, perpetua oratio rhetorum solum, non etiam philosophorum sit.",
      "Quam ob rem tandem, inquit, non satisfacit?",
      "Qua ex cognitione facilior facta est investigatio rerum occultissimarum.",
      "Nam cui proposito sit conservatio sui, necesse est huic partes quoque sui caras suo genere laudabiles.",
      "His enim rebus detractis negat se reperire in asotorum vita quod reprehendat.",
      "Tria genera bonorum; At quicum ioca seria, ut dicitur, quicum arcana, quicum occulta omnia?",
      "Si alia sentit, inquam, alia loquitur, numquam intellegam quid sentiat;",
      "Nec vero hoc oratione solum, sed multo magis vita et factis et moribus comprobavit.",
      "Quicquid enim a sapientia proficiscitur, id continuo debet expletum esse omnibus suis partibus;",
      "Graece donan, Latine voluptatem vocant.",
      "Quid de Platone aut de Democrito loquar?",
      "Et quod est munus, quod opus sapientiae?",
      "Longum est enim ad omnia respondere, quae a te dicta sunt.",
      "Et nemo nimium beatus est; Ita ne hoc quidem modo paria peccata sunt.",
      "Haec para/doca illi, nos admirabilia dicamus.",
      "Itaque hic ipse iam pridem est reiectus;",
      "Sin dicit obscurari quaedam nec apparere, quia valde parva sint, nos quoque concedimus;",
      "Sequitur disserendi ratio cognitioque naturae;",
      "Eodem modo is enim tibi nemo dabit, quod, expetendum sit, id esse laudabile.",
      "Contemnit enim disserendi elegantiam, confuse loquitur."
    )

    text <- sample(cache, size = 3) %>%
      paste(collapse= " ")
    return(text)
  }

  # If the cache is not used, retrieve from loripsum.net API
  con <- url("https://loripsum.net/api/short/plaintext/1")
  text <- readLines(con) %>%
    paste(collapse = "") %>%
    gsub(pattern = " *$", replacement = "", x = .)
  close(con)
  return(text)
}
