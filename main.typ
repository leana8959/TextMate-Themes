#import "@preview/weave:0.2.0": compose_ as c_

#let with_number(
  light: true,
  it,
) = {
  let body = {
    show raw.line: it => {
      let greytext = text.with(black.lighten(70%))
      let line_number = context box(
        align(right, greytext[#it.number]),
        ..measure[#it.count],
      )

      [#line_number #it.body]
    }
    it
  }

  set block(radius: 5pt, inset: 5pt, width: 100%, breakable: true)
  if light {
    set block(fill: white.darken(2%), stroke: 1pt + white.darken(25%))
    body
  } else {
    set block(fill: black.lighten(2%), stroke: 1pt + black.lighten(25%))
    body
  }
}

#show ref: c_.with((underline, emph))
#show link: c_.with((text.with(rgb("#0000EE")), underline, emph))
#set text(font: "New Computer Modern")

#show raw.where(block: false): set text(font: "Iosevka Extended")
#show raw.where(block: true): it => {
  set text(font: "Iosevka")
  grid(
    columns: (auto, auto),
    with_number(light: true, it), with_number(light: false, it),
  )
}

#let me = link("github.com/leana8959")[me]

#set page(flipped: true, width/* flip height */: auto)

#set raw(theme: sys.inputs.theme)
= Theme: #sys.inputs.theme

== Haskell
source: https://play.haskell.org/
```haskell
main :: IO ()
main = putStr $ unlines $ hexagons 12 17

hexagons :: Int -> Int -> [String]
hexagons xRepeat yRepeat =
  yRepeat `times` [xRepeat `times` "/ \\_"
                  ,xRepeat `times` "\\_/ "]
  where
    n `times` l = concat (replicate n l)
```

== Rust
source: https://play.rust-lang.org/
```rust
#![allow(unused)]
fn main() {
    use std::process::{Command, Stdio};

    Command::new("ls")
        .stdout(Stdio::null())
        .spawn()
        .expect("ls command failed to start");
}
```

== Nix
source: #me
```nix
{
  mergeAttrsWith =
    f:
    xs: ys:
      builtins.foldl'
        ( acc: n: acc //
                    (if acc ? ${n}
                      then { ${n} = f xs.${n} ys.${n}; }
                      else { ${n} = ys.${n}; }))
        xs
        (builtins.attrNames ys);
}
```

== Typst
source: #me
```typst
#let conf(
  lang: "fr", // oui oui baguette
  font: "New Computer Modern",
  doc,
) = {
  set text(lang: lang, font: font, hyphenate: true)
  doc
}
```

== Go
source: https://go.dev/play/
```go
// You can edit this code!
// Click here and start typing.
package main

import "fmt"

func main() {
	fmt.Println("Hello, 世界")
}
```

== Scala
source: https://www.scala-lang.org/docu/files/ScalaByExample-fr_FR.pdf
```scala
def sort(xs: Array[Int]) {
  def swap(i: Int, j: Int) {
    val t = xs(i); xs(i) = xs(j); xs(j) = t
  }
  def sort1(l: Int, r: Int) {
    val pivot = xs((l + r) / 2)
      var i = l; var j = r
      while (i <= j) {
        while (xs(i) < pivot) i += 1
        while (xs(j) > pivot) j -= 1
        if (i <= j) {
          swap(i, j)
          i += 1
          j -= 1
        }
      }
    if (l < j) sort1(l, j)
    if (j < r) sort1(i, r)
  }
  sort1(0, xs.length - 1)
}
```
