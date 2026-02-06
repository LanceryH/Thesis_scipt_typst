// The main color of the Paris-Saclay University visual identity
#let prune = rgb(99, 0, 60)

// Yellow background color for highlighting
#let yellow-highlighting = rgb("#fffd11a1") // default color of highlight() https://typst.app/docs/reference/text/highlight/#parameters-fill

// An highlighted empty rectangle for missing parameters
#let missing-field(width: 10em) = box(
  fill: yellow-highlighting,
  width: width,
  height: 1em,
  baseline: 0.2em
)


#let important(body, critical: false) = {
  set text(red) if critical
  [- #body]
}
// === LAYOUT HELPERS ===
#let unnumbered-chapter(body) = {
  heading(level: 1, numbering: none, outlined: false, body)
}

#let default-fonts = (
  body: "times new roman",
  sans: "Arial",
  mono: "0xProto Nerd font"
)

#let unnumbered-chapter = unnumbered-chapter

// An highlighted block for when the doctoral school logo is not selected
#let missing-doctoral-school-logo = block(
  height: 65pt,
  width: 200pt,
  fill: yellow-highlighting
)[
  #align(center+horizon)[
    Logo de l'école doctorale
  ]
]

// The function takes the whole document as `body` parameter
// and formats it for a Paris-Saclay University thesis
#let paris-saclay-thesis(
  candidate-name: highlight[Prénom Nom],
  title-fr: highlight[Titre de la thèse],
  title-en: highlight[Title of the thesis],
  keywords-fr: (highlight[Mot-clé 1], highlight[Mot-clé 2], highlight[Mot-clé 3]),
  keywords-en: (highlight[Keyword 1], highlight[Keyword 2], highlight[Keyword 3]),
  abstract-fr: highlight(lorem(200)),
  abstract-en: highlight(lorem(200)),
  NNT: highlight[XXXXXXXXXX],
  doctoral-school: [École doctorale n°#missing-field(width: 3em) : #missing-field()],
  doctoral-school-code: none,
  specialty: [Spécialité de doctorat : #missing-field()],
  graduate-school: [Graduate School : #missing-field()],
  university-component: [Référent : #missing-field()],
  language: "en",

  research-unit-and-advisors: [
    Thèse préparée dans l'unité de recherche #missing-field(),\ sous la direction de #missing-field(), #highlight[titre du directeur de thèse],\ 
    et l'encadrement de #missing-field(), #highlight[titre du co-endadrant].
  ],

  defense-date: [#missing-field()],

  thesis-examiners: (
    (
      name: missing-field(),
      title: missing-field(width: 25em),
      status: highlight[Président(e)]
    ),
    (
      name: missing-field(),
      title: missing-field(width: 25em),
      status: highlight[Rapporteur &\ Examinateur/trice]
    ),
    (
      name: missing-field(),
      title: missing-field(width: 25em),
      status: highlight[Rapporteur &\ Examinateur/trice]
    ),
    (
      name: missing-field(),
      title: missing-field(width: 25em),
      status: highlight[Examinateur/trice]
    ),
  ),

    // Pass your own fonts
  body-font: default-fonts.body,
  sans-font: default-fonts.sans,
  mono-font: default-fonts.mono,

  // Font sizes - individual parameters
  body-size: 11pt,
  mono-size: 8.5pt,
  footnote-size: 9pt,
  header-size: 9pt,

  // Heading sizes - individual parameters
  chapter-number-size: 100pt,
  chapter-title-size: 24pt,
  section-size: 14pt,
  subsection-size: 12pt,
  subsubsection-size: 12pt,

  // Font weights - new parameters
  chapter-number-weight: "bold",
  chapter-title-weight: "bold",
  section-weight: "bold",
  subsection-weight: "bold",
  subsubsection-weight: "bold",

  // Custom text styling functions - optional overrides
  // These allow complete control over text styling if provided
  body-text-style: none,           // Custom function for body text
  mono-text-style: none,           // Custom function for mono/code text
  chapter-number-style: none,      // Custom function for chapter numbers
  chapter-title-style: none,       // Custom function for chapter titles
  section-style: none,             // Custom function for sections
  subsection-style: none,          // Custom function for subsections
  subsubsection-style: none,       // Custom function for subsubsections

  logo: auto, // options: auto | none | path | image-element
  logo-width: 8cm,

  // compile mode
  draft: true,        // displays todos
  colored: false,      // Use colors for definitions, theorems, etc.

  // Spacings in the first page
  vertical-spacing-1: 10pt,
  vertical-spacing-2: 55pt,
  vertical-spacing-3: 40pt,
  vertical-spacing-4: 40pt,
  vertical-spacing-5: 40pt,
  horizontal-spacing-1: 50pt,
  horizontal-spacing-2: 100pt,

  // The thesis content
  // Content
  abstract: [],
  acknowledgments: none,
  introduction: [],
  chapters: (),
  appendices: (),
  bibliography-content: none,
  body

) = {

  show figure.caption: it => {
    set text(size: 0.85em, style: "italic")
    it
    linebreak()
  }

  set page(
    paper: "a4",
    margin: (
      left: 0pt,
      top: 0pt,
      bottom: 0pt,
      right: 2.5cm
    ),
    numbering: "1/1"
  )

  set text(
    font: body-font,
    size: 12pt,
    lang: "fr"
  )

  let rectangle_width = 16.4%*21cm // 16.4% of the page width

  grid(
    columns: (rectangle_width, 100%-rectangle_width),
    gutter: 25pt,
    [
      #rect(
        fill: prune,
        width: 100%,// 100% of rectangle_width,
        height: 100%
      )

      #place(
        bottom+left,
        dx: 0.1cm,
        dy: -3cm,
        rotate(
          -90deg,
          block[
            #text(
              fill: white,
              size: 16pt,
            )[
              THESE~DE~DOCTORAT
            ]
            #v(0.5pt)
            #text(
              fill: white,
            )[
              NNT~:~#NNT
            ]
          ]
        )
      )
    ],
    [ // right part of the grid

      #v(vertical-spacing-1)

      #image("img/PS.svg", width: 40%*20cm)

      #v(vertical-spacing-2)

      #align(right)[
        #text(
          size: 20pt,
          fill: prune,
        )[
          #title-fr
        ]\
        #v(2pt)
        #text(
          size: 13pt,
          fill: black,
          style: "italic"
        )[
          #title-en
        ]\

        #v(vertical-spacing-3)

        #text(
          size: 13pt,
          weight: 400,
        )[
          *Thèse de doctorat de l’université Paris-Saclay*
        ]
        #v(10pt)
        #text(
          size: 12pt,
        )[
          #doctoral-school\
          #specialty\
          #graduate-school\ 
          #university-component
          #v(10pt)
          #research-unit-and-advisors
        ]

        #v(vertical-spacing-4)

        #text(
          size: 11pt,
        )[
          *Thèse soutenue à Paris-Saclay, le #defense-date, par* \
        ]

        #text(
          size: 20pt,
          fill: prune,
          weight: 600,
        )[
          #candidate-name
        ]
      ]

      #v(vertical-spacing-5)

      #grid(
        columns: (horizontal-spacing-1, auto),
        row-gutter: 1em,
        stroke: (x,y) => if x == 1 and y == 1 { (left: (1pt + prune)) },
        [],
        [
          #text(size: 14pt, fill: prune)[*Composition du jury*]\
          #text(size: 11pt, fill: prune)[Membres du jury avec voix délibérative]
        ],
        [],
        [
          #set text(10pt)
          #grid(
            columns: (auto, auto),
            column-gutter: horizontal-spacing-2,
            inset: (x: 6pt, y: 3pt),
            align: horizon,
            ..for thesis-examiner in thesis-examiners {
              (thesis-examiner.name, grid.cell(rowspan: 2)[#thesis-examiner.status], text(size: 9pt)[#thesis-examiner.title])
              if thesis-examiner != thesis-examiners.last() {
                ([],[])
              }
            }
          )
        ],
      )
    ]
  ) // end grid

  // from the second page, default margins of the A4 paper size
  set page(
    margin: auto
  )

  pagebreak()

  if doctoral-school-code == none {
    missing-doctoral-school-logo
  }
  else {
    assert(type(doctoral-school-code) == str)
    image("img/" + doctoral-school-code + ".png", width: 60%)
  }

  v(10pt)

  grid(
    columns: (100%),
    rows: 2,
    gutter: 40pt,
    inset: 10pt,
    stroke: 1pt+prune,
    [
      #set text(10pt)
      *Titre :* #title-fr\
      *Mots-clés :* #for keyword in keywords-fr {
        (keyword)
        if keyword != keywords-fr.last() {
          (", ")
        }
      }\
      #v(5pt)
      *Résumé :* #abstract-fr
    ],
    [
      #set text(10pt)
      *Title :* #title-en\
      *Keywords :* #for keyword in keywords-en {
        (keyword)
        if keyword != keywords-en.last() {
          (", ")
        }
      }\
      #v(5pt)
      *Abstract :* #abstract-en
    ]
  )

  pagebreak(weak: true)

    // Typography - apply default settings first
  set text(
    font: body-font,
    size: body-size,
    lang: language
  )

  show raw: set text(
    font: mono-font,
    size: mono-size,
    lang: language
  )

  // Apply custom styling if provided (this will override the defaults)
  if body-text-style != none {
    show: body-text-style
  }

  if mono-text-style != none {
    show raw: mono-text-style
  }

  // Paragraph settings - matching LaTeX
  set par(
    justify: true,
    leading: 0.6em,  // 1.5 line spacing
    first-line-indent: 0pt,  // No indent as in LaTeX
  )

  // Footnote settings
  set footnote.entry(
    separator: line(length: 30%, stroke: 0.5pt),
    gap: 0.65em,
  )

  show footnote.entry: it => {
    set text(size: footnote-size)
    it
  }

  // Heading numbering - only up to level 3 (subsection)
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()
    if level == 1 {
      // Chapter: no dot
      numbering("1", ..nums)
    } else if level <= 3 {
      // Sections and subsections: with dots
      numbering("1.", ..nums)
    }
    // Level 4 and deeper: no numbering (returns none implicitly)
  })

  // Equation numbering
  set math.equation(numbering: "(1)")

  show heading.where(level:2): it => {
    linebreak()
    text(
      size: section-size,
      font: sans-font,
      weight: section-weight,
      counter(heading).display()
    )
    " "
    text(
      size: section-size,
      font: sans-font,
      weight: section-weight,
      it.body
    )
  body
  }

  show heading.where(level:3): it => {
    linebreak()
    text(
      size: subsection-size,
      font: sans-font,
      weight: subsection-weight,
      counter(heading).display()
    )
    " "
    text(
      size: subsection-size,
      font: sans-font,
      weight: subsection-weight,
      it.body
    )
  body
  }

  // Chapter style - large gray number as in LaTeX
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(0pt)

    align(right)[
      #grid(
        columns: 1,
        rows: (auto, auto),
        row-gutter: 20pt,
        align: right,
        
        // Chapter number
        if it.numbering != none [
          #if chapter-number-style != none {
            chapter-number-style(counter(heading).display())
          } else {
            text(
              size: chapter-number-size,
              font: sans-font,
              weight: chapter-number-weight,
              //fill: rgb(179, 179, 179),
              fill: rgb("#63003C"),
              hyphenate: false,
              counter(heading).display()
            )
          }
        ],

        // Chapter title
        if chapter-title-style != none {
          chapter-title-style(it.body)
        } else {
          text(
            size: chapter-title-size,
            font: sans-font,
            //fill:rgb("#63003c"),
            weight: chapter-title-weight,
            hyphenate: false,
            it.body
          )
        }
      )
    ]
  body
    v(30pt)
  }
    // Acknowledgments
  if acknowledgments != none {
    pagebreak()
    unnumbered-chapter[
      #if language == "en" [Acknowledgments] else [Remerciements]
    ]
    acknowledgments
  }

  // Table of contents
  pagebreak()
  unnumbered-chapter[
    #if language == "en" [Table of Contents] else [Sommaire]
  ]

  outline(depth: 3, indent: auto, title: none)

  // Introduction
  if introduction != none {
    pagebreak()
    unnumbered-chapter[
      #if language == "en" [Introduction] else [Introduction]
    ]
    introduction
  }

  // Main content chapters
  pagebreak()
  for chapter-content in chapters {
    chapter-content
  }

  // Additional body content
  body

  // Bibliography
  if bibliography-content != none {
    pagebreak()
    unnumbered-chapter[
      #if language == "en" [Bibliography] else [Literaturverzeichnis]
    ]
    bibliography-content
  }

  // Appendices
  if appendices.len() > 0 {
    pagebreak()
    set heading(numbering: (..nums) => {
      let level = nums.pos().len()
      if level == 1 {
        // Appendix chapters: no dot
        numbering("A", ..nums)
      } else if level <= 3 {
        // Appendix sections and subsections: with dots
        numbering("A.1", ..nums)
      }
      // Level 4 and deeper: no numbering
    })
    counter(heading).update(0)

    for appendix-content in appendices {
      appendix-content
    }
  }
}