// template/components/callout.typ
#import "../core/tokens.typ": *

// Generic Callout Function
#let callout(body, title: "Note", color: clr-note, icon: "i") = {
  block(
    fill: color.lighten(90%),
    stroke: (left: 4pt + color),
    radius: ui-radius,
    inset: 1em,
    width: 100%,
    below: 1em,
  )[
    #stack(
      dir: ltr,
      spacing: 0.5em,
      text(weight: "semibold", fill: color)[#title],
    )
    #body
  ]
}

// Semantic Callouts
#let co-note(body, title: "Note") = callout(body, title: title, color: clr-note, icon: "n")
#let co-info(body, title: "Info") = callout(body, title: title, color: clr-info, icon: "i")
#let co-warn(body, title: "Warning") = callout(body, title: title, color: clr-warn, icon: "w")
#let co-erro(body, title: "Error") = callout(body, title: title, color: clr-erro, icon: "e")
#let co-succ(body, title: "Success") = callout(body, title: title, color: clr-succ, icon: "s")
