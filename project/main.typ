#import "src/lib.typ": paris-saclay-thesis, prune

#show: paris-saclay-thesis.with(
  candidate-name: "Hugo Lancery",
  title-fr: "Thesis title in english",
  title-en: "Titre de la thèse en français ou anglais",
  keywords-fr: ("Or", "montagne du Destin", "Magie occulte"),
  keywords-en: ("Gold","Mount Doom", "Occult magic"),
  abstract-fr: lorem(200),
  abstract-en: lorem(200),
  NNT: [1955UPASX000],
  doctoral-school: [École doctorale n°573 : INTERFACES - approches interdisciplinaires,\ fondements, applications et innovation],
  doctoral-school-code: "SEIF",
  specialty: [Spécialité de doctorat : Sciences des matériaux],
  graduate-school: [Graduate School : Physique],
  university-component: [Référent : Faculté des sciences d'Orsay],
  research-unit-and-advisors: [Thèse préparée dans l'unité de recherche *Fondcombe*,\ sous la direction d'*Elrond*, seigneur de Fondcombe,\ et l'encadrement de *Gandalf*, magicien de l'ordre des Istari.],
  defense-date: [20 octobre 2028],
  thesis-examiners: (
    (
      name: [*Aragorn*],
      title: [Roi du Gondort],
      status: [Président]
    ),
    (
      name: [*Legolas*],
      title: [Prince des Elfes Sylvains],
      status: [Rapporteur &\ Examinateur]
    ),
    (
      name: [*Gimli*],
      title: [Guerrier du royaume d'Erebor],
      status: [Rapporteur &\ Examinateur]
    ),
    (
      name: [*Faramir*],
      title: [Intendant du Gondor],
      status: [Examinateur]
    ),
  ),
    introduction: (
    include "template/content/introduction.typ"
  ),
    chapters: (
    include "template/content/chapter1.typ",
    include "template/content/chapter2.typ",
    include "template/content/background.typ",
    include "template/content/discussion.typ",
    include "template/content/conclusion.typ",
  ),

  appendices: (
    include "template/content/appendix.typ",
  ),

  bibliography-content: bibliography("./template/references.bib", style: "ieee", title: none),
)