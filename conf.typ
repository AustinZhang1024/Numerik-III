#let info = (
  ("Bai", "Haotian", "haotiab00@zedat.fu-berlin.de"),
  ("Ning", "Luheng", "ningl02@zedat.fu-berlin.de"),
  ("Wu", "Ruoxi", "wur00@zedat.fu-berlin.de"),
  ("Zhang", "Aoxing", "aoxiz00@zedat.fu-berlin.de"),
)

#let conf(exercise_num: none, doc) = {
  set math.equation(numbering: "(1)")
  set heading(numbering: (first, ..other) => if other.pos().len() == 0 {
    return str(first) + "."
  })
  align(center)[
    #set par(spacing: 7pt)
    #text(size: 24pt, weight: "bold")[Numerical Mathematics III]

    #text(size: 18pt)[Exercise Problems #exercise_num]

    Exercise Group 03

    #for (first, last, email) in info [
      #box(width: 7em)[#align(left)[#first, #last]] #box(width: 12em)[#align(
          right,
        )[#link("mailto:" + email)]] \
    ]
  ]
  doc
}
