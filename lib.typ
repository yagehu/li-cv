#let conf(doc) = {
  set par(spacing: 0.5em)
  set text(size: 12pt)
  show title: set align(center)
  show heading: smallcaps
  show heading: set text(fill: rgb("#801010"))
  show heading.where(level: 1): it => grid(
    columns: (1fr),
    it,
    grid.hline(stroke: 1pt),
    inset: (bottom: 0.2em),
    row-gutter: 0.5em,
  )

  doc
}

#let date_fmt = "[month]/[year]"
#let headline_size = 1.2em

#let experience-item(e) = {
  let start = datetime(
    year: e.start.year,
    month: e.start.month,
    day: if "day" in e.start { e.start.day } else { 1 },
  )
  let end = if "end" in e {
    datetime(
      year: e.end.year,
      month: e.end.month,
      day: if "day" in e.end { e.end.day } else { 1 },
    ).display(date_fmt)
  } else { "Present" }

  [
    #grid(
      columns: (1fr, auto),
      strong(text(size: headline_size, e.title)),
      [
        #start.display(date_fmt)#sym.dash.en#end
      ]
    )
    #emph(e.org)

    #if "detail" in e {
      grid(
        columns: (1em, 1fr),
        [],
        list(
          ..e.detail.map(it => eval(it, mode: "markup"))
        )
      )
    }
  ]
}

#let edu-item(edu) = {
  let start = datetime(
    year: edu.date.year,
    month: edu.date.month,
    day: if "day" in edu.date { edu.date.day } else { 1 },
  )

  [
    #grid(
      columns: (1fr, auto),
      text(size: headline_size, [#strong(edu.degree), #edu.major]),
      [
        #start.display(date_fmt)
      ]
    )
    #emph(edu.institution)
  ]
}

