#set page(
  paper: "us-letter",
  margin: 1in,
)
#set document(title: [Di Li])

#set par(spacing: 0.5em)
#set text(size: 12pt)
#show title: set align(center)
#show heading: smallcaps
#show heading: set text(fill: rgb("#801010"))
#show heading.where(level: 1): it => grid(
  columns: (1fr),
  it,
  grid.hline(stroke: 1pt),
  inset: (bottom: 0.2em),
  row-gutter: 0.5em,
)

#title()
#align(center, [
  #link("itdili65@gmail.com") | 650-513-9295
])

#let date_fmt = "[month]/[year]"

#let work-item(work) = {
  let start = datetime(
    year: work.start.year,
    month: work.start.month,
    day: if "day" in work.start { work.start.day } else { 1 },
  )
  let end = if "end" in work {
    datetime(
      year: work.end.year,
      month: work.end.month,
      day: if "day" in work.end { work.end.day } else { 1 },
    ).display(date_fmt)
  } else { "Present" }

  [
    #grid(
      columns: (1fr, auto),
      strong(work.title),
      [
        #start.display(date_fmt)#sym.dash.en#end
      ]
    )
    #emph(work.org)

    #if "detail" in work {
      grid(
        columns: (1em, 1fr),
        [],
        list(
          ..work.detail
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
      [#strong(edu.degree), #edu.major],
      [
        #start.display(date_fmt)#sym.dash.en#end
      ]
    )
    #emph(edu.institution)
  ]
}

= Work

#yaml("work.yaml").filter(it => it.resume).map(work-item).join(v(0.5em))

= Education

#yaml("education.yaml").map(edu-item).join(v(0.5em))
