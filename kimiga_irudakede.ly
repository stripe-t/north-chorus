% Template revision 3
%
% For Flescobaldi :
% -*- indent-width: 2; tab-width: 2; indent-tabs: false;

\version "2.18.0"

#(set-global-staff-size 18)

\paper {
  system-count = #20
  page-count = #6
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        "Revision 2"
        "2015/3/17"
      }
      \fill-line {
        \override #'(font-name . "TakaoEx明朝")
        \fontsize #5 "君がいるだけで"
      }
      \fill-line {
        \null
        \override #'(font-name . "TakaoEx明朝") "米米CLUB"
      }
    }
  }
  oddHeaderMarkup = \markup {
    \override #'(baseline-skip . 1) \column {
      \fill-line {
        \fontsize #-1 \fromproperty #'page:page-number-string \null
      }

      \draw-hline
    }

  }
  evenHeaderMarkup = \markup {
    \override #'(baseline-skip . 1) \column {
      \fill-line {
        \null \fontsize #-1 \fromproperty #'page:page-number-string
      }
      \draw-hline
    }
  }

  oddFooterMarkup = \markup {
    \on-the-fly #last-page \column{
      \fontsize #-2 \italic \fill-line {
        \left-column {""}
        \right-column {"LilyPond - Music Notation for Everyone" #(string-append "Version " (lilypond-version) ", See www.lilypond.org")}
      }
    }
  }

  evenFooterMarkup = \oddFooterMarkup
}

melody = \relative c' {
  \key des \major
  \tempo 4=121
  \set Score.markFormatter = #format-mark-box-alphabet

  %\set Score.skipTypesetting = ##t
  \mark #1
  \partial 4*2 {r8 as bes c}
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c c( | des2.) r4 |

  \mark #2
  R1*4

  \mark #3
  r4 r8 as f as as as | a8. a16 ~ a8 bes ~ bes c4 c8( | es4) des8 des ~ des bes4 as8 ~ | as bes r4 r as8 as |
  des bes4 des8 ~ des es4 bes8 ~ | bes bes( as4) r as8 as | bes( c4) des8 ~ des es4 bes8 ~ | bes bes( as4) r2 |

  \mark #4
  r4 r8 as f as as as | a8. a16 ~ a8 bes ~ bes c4 c8( | es4) des8 des ~ des bes4 as8 ~ | as bes r4 r as8 as |
  des bes4 des8 ~ des es4 bes8 ~ | bes bes( as4) r as8 as | bes4 c8 des ~ des bes4 des8( | es1) \bar "||"

  \mark #5
  \key as \major
  r4 r8 es es es4 es8 ~ | es4 f8 des ~ des as'4 g8 ~ | g bes, bes bes bes c des f( ~ | f es) es c ~ c bes4 c16 bes ~ |
  bes8 as r4 r8 f g as | \tuplet 3/2 {c( bes c} bes) bes r bes( c) c( | des1 ~ | des4) r bes ~ bes8 es ~ | es es ~ es2. ~ | es2 r8 as, bes c \bar "||"

  \mark #6
  \key des \major
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c c( | des2.) r4 |

  \mark #7
  R1*4

  \mark #8
  r4 r8 as f as as as | a8. a16 ~ a8 bes ~ bes c4 c8( | es4) des8 des ~ des bes4 as8 ~ | as bes r4 r as8 as |
  des bes4 des8 ~ des es4 bes8 ~ | bes bes( as4) r as8 as | bes c4 des8 ~ des es4 bes8 ~ | bes bes( as4) r2 |

  \mark #9
  \partcombine \relative c' {
    r4 r8 as f as as as | a8. a16 ~ a8 bes ~ bes c4. | es4 des8 des ~ des bes4 as8 ~ | as bes r4 r8 as as as |
    des( bes) bes des8 ~ des es4 bes8 ~ | bes bes( as4) r8 as as as | ges'4 f8 es ~ es des es des( | es1) \bar "||"
  } \relative c {
    r4 r8 f des f f f | f8. f16 ~ f8 f ~ f a4. | bes4 ges8 ges ~ ges ges4 f8 ~ | f f r4 r8 des des des |
    ges( des) des ges ~ ges as4 ges8( | f) ges( f4) r8 f f f | bes4 bes8 ges ~ ges ges ges as ~ | as1 |
  }

  \mark #10
  \key as \major
  \partcombine \relative c' {
    r4 r8 es es es4 es8 ~ | es4 f8 des ~ des as'4 g8 ~ | g bes, bes bes bes c des f ~ | f4 es c bes8 bes( ~ |
    bes8 as) r4 r8 f g as | \tuplet 3/2 {c( bes c} bes) bes r bes( c) c( | des1) ~ | des4 r bes4. es8 ~ | es es ~ es4 ~ es2 ~ | es r8 as, bes c \bar "||"
  } \relative c' {
    r4 r8 c c c4 c8 ~ | c4 des8 f, ~ bes des4 es8 ~ | es g, g g g as bes bes( | c4) bes as g8 g( ~ |
    g8 f) r4 r8 f g as | \tuplet 3/2 {as( g as} f) f r f( f) f( | ges1) ~ | ges4 r ges4. bes8 ~ | bes c ~ c4 ~ c2 ~ | c2 r8 f, es f |
  }

  \mark #11
  \key des \major
  \partcombine \relative c' {
    des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
    des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c c( | des2) r8 es des es |
  } \relative c' {
    ges4 r8 des' c bes as bes | c4. f8 des c as f | ges4 r8 des' c bes as ges | f4 c'8 bes r f es f |
    ges4 r8 des' c bes as bes | c4. f8 des c beses ges | es4 r8 des' c bes c c( | des2) r8
  }

  \mark #12
  r2 r4 r8 bes | des bes des bes des bes ~ bes4 | r2 r8 as' f as | r es( f2.) |
  r2 r4 r8 bes, | des bes des bes des des( es4) | r2 r8 as f as | r es( f2) des4

  \key cis \major
  \mark #13
  <cis e gis>1 ~ | q2 q4. <dis fis gis>8 | <cis eis gis>1 ~ | q2 cis2 |
  <cis e gis>1 ~ | q2 q4. <dis fis gis>8 | <cis eis gis>1 ~ | q2 r |

  R1 | r2 r8 a b cis \bar "||" \break

  \mark #14
  \key d \major
  d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r a b cis |
  d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r a^\markup {La} b cis |

%\set Score.skipTypesetting = ##f
  \mark #15
  d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r a b cis |
  d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r2

  R1*4 \bar "|."
}

melodylyric = \lyricmode {
}
melodylyricb = \lyricmode {
}

soprano = \relative c'' {
  \key des \major
  % A
  r2
  f4.^\markup {Fu} es8 ~ es2 | es4. des8 ~ des2 | f4. es8 ~ es2 | es4. des8 ~ des2 |
  f4. es8 ~ es2 | es4. des8 ~ des4 ges | f4. es8 ~ es2 | des4. des8 ~ des2 |

  % B
  <bes des>1^\markup {Lu} | <as c> | bes2 c | des es |

  % C
  des4.^\markup {Tu} des8 ~ des2 | c4. c8 ~ c2 | bes4. bes8 ~ bes2 | as4 des,-> f-> aes-> |
  des1^\markup {La} | r4 aes4 f des | g1 | des'4. c8 ~ c4 bes |

  % D
  as2.^\markup {Lu} des4 | c2 f | des2. es4 | f1 |
  ges1 | f2 es8 des4 as8 | bes2 f' | r8 es^\markup {Tu} r es ~ es2 |

  % E
  \key as \major
  c8^\markup {Tu} r r4 r8 c ~ c4 | des8 r r des ~ des2 | bes8 r r4 r8 bes ~ bes4 | c8 r r es as4^\markup {La} g |
  f2 r | r4 d f d | des1 ~ | des4 r bes4.^\markup {True Heart} es8 ~ | es es ~ es2. | r8 es^\markup {Tu} es4 f8 r r4 |

  % F
  \key des \major
  r4 f^\markup {La} es r | es8 es r des ~ des2 | r4 f es r | es8 es r des ~ des2 |
  r4 f es r | es8 es r des ~ des4 ges | r4 f es r | des4. des8 ~ des4 r |

  % G
  <bes des>1 | <as c> | bes2 c | des es |

  % H
  %des4. des8 ~ des2 | c4. c8 ~ c2 | bes4. bes8 ~ bes2 | as4 des,-> f-> aes-> |
  %des1 | r4 aes4 f des | g1 | des'4. c8 ~ c4 bes |
  <<{
    r4 r8^\markup {Pon} des ~ des2 | r4 r8 ees ~ ees2 | r4 r8 des ~ des2 | r4 r8 des ~ des2 |
    r4 r8 des ~ des2 | r4 r8 des ~ des2 | r4 r8 des ~ des2 |
  }\\{
    r4 aes2. | r4 a2. | r4 bes2. | r4 aes2. |
    r4 bes2. | r4 aes2. | r4 bes2. |
  }>>
  des4. c8 ~ c4 bes |

  % I
  as2. des4 | c2 f | des2. es4 | f1 |
  ges1 | f2 es8 des4 as8 | bes2^\markup {ha} f' | r8 es r es ~ es aes, bes b |

  % J
  \key as \major
  c8 r r4 r8 c ~ c4 | des8 r r des ~ des2 | bes8 r r4 r8 bes ~ bes4 | c8 r r es as4 g |
  f2 r | r4 d f d | des1 ~ | des4 r bes2 | es8 es r es es r es es | r8 es es4 f8 r r4 |

  % K
  \key des \major
  %r4 f es r | es8 es r des ~ des2 | r4 f es r | es8 es r des ~ des2 |
  bes,8 des f ees ~ ees2 | aes,8 c ees des ~ des2 | bes8 des f ees ~ ees2 | aes,8 c ees des ~ des2 |
  bes8 des f ees ~ ees2 | aes,8 c ees des ~ des4 ges | f4. es8 ~ ees4 aes, | des4. des8 ~ des4 des8 es |

  % L
  r4 f^\markup {True Heart} es r | c8^\markup {Tu} c r bes ~ bes2 | r4 f' es r | es8 es r des ~ des des^\markup {Lu} f as |
  r4 f es r | es8 es r des ~ des4 ges | <<{ f4.^\markup {La} es8 ~ es4 as }\\{ r4 f_\markup {True Heart} es r }>> | f2 r |

  % M
  \key cis \major
  e1^\markup {La} ~ | e2 fis | eis1 ~ | eis |
  e1 ~ | e2 fis | gis1 ~ | gis2 r |
  gis,4.^\markup {True} fis8^\markup {Heart} ~ fis4 b^\markup {Ah} ~ | b2 ~ b8-. r r4 |

  % N
  \key d \major
  b2.^\markup {Lu} cis4 | a4. fis8 ~ fis fis g a | b2. cis4 | a4. e'8 d cis b a |
  b2. cis4 | a4. a'8 g fis e d | b2. cis4 | a2 a' |

  % O
  <<{
    \tiny r4 r8 fis,_\markup {La (2年)} e d cis d | e4. a8 g fis e d | b4 r8 fis' e fis g gis | a4 e'8 d r a b cis |
    d4 r8 d cis b a b | cis4. cis8 d cis b a | g4 r8 fis' e d cis b | a4 e'8 d r
  }\\{
    r4 d^\markup {True Heart} cis r | e8^\markup {La/Tu} e r d ~ d2 | r4 d cis r | e8 e r d ~ d2 |
    r4 d cis r | e8 e r d ~ d2 | r4 d cis r | e8 e r d ~ d8
  }>>
  a^\markup {La} b cis | d1 | e^\markup {True} | fis^\markup {Heart} ~ | fis |
}

sopranolyric = \lyricmode {

}

alto = \relative c''{
  \key des \major
  % A
  r2
  ges4. bes8 ~ bes2 | as4. as8 ~ as2 | ges4. bes8 ~ bes2 | as4. as8 ~ as2 |
  ges4. bes8 ~ bes2 | as4. as8 ~ as4 ces | bes4. as8 ~ as2 | f4. f8 ~ f2 |

  % B
  r4 f8^\markup {Ta とか La とか} des es bes'4 as8 ~ | as es4 f8 ~ f c4 as8 ~ | as2 es'^\markup {Lu} | f ges |

  % C
  f4. f8 ~ f2 | f4. f8 ~ f2 | ges4. ges8 ~ ges2 | f4. f8 ~ f4 f |
  f4. bes8 ~ bes2 | f4. f8 ~ f2 | bes4. bes8 ~ bes2 | as4. as8 ~ as4 es |

  % D
  f2. bes4 | a2 bes4 c | bes2 des | des1 |
  des2 es | des f,8 ees des4 | g4 bes des2 | r8 des r c ~ c2 |

  % E
  \key as \major
  es,8 r r4 r8 es ~ es4 | f8 r r f ~ f2 | g8 r r4 r8 g ~ g4 | as8 r r as ~ \tuplet 3/2 { as4 c^\markup {La} bes } |
  as2 c | bes1 | <<{bes2 des8 c aes f | aes4}\\{bes1 ~ | bes4}>> r f4. bes8 ~ | bes c ~ c2. | r8 as as4 bes8 r r4 |

  % F
  \key des \major
  r4 bes c r | c8 c r bes ~ bes2 | r4 bes c r | c8 c r bes ~ bes2 |
  r4 bes c r | c8 c r bes ~ bes4 ces | r4 bes c r | ges4. f8 ~ f4 r |

  % G
  r4 f8 des es bes'4 as8 ~ | as es4 f8 ~ f c4 as8 ~ | as2 es' | f ges |

  % H
  r8 f^\markup {Pon} ~ f2. | r8 f ~ f2. | r8 ges ~ ges2. | r8 f ~ f2. |
  r8 ges ~ ges2. | r8 f ~ f2. | r8 ges ~ ges2. | aes4. aes8 ~ aes4 ees |

  % I
  f2. bes4 | a2 bes4 c | bes2 des | des1 |
  des2 es | des f,8 ees des4 | ges4 bes des2 | r8 des r c ~ c2 |

  % J
  \key as \major
  es,8 r r4 r8 es ~ es4 | f8 r r f ~ f2 | g8 r r4 r8 g ~ g4 | c,4 ees \tuplet 3/2 { bes'4 aes g } |
  <<{c4^\markup {すなおになれたなら} aes c ees}\\{as,2. r4}>> | d bes d f | <<{ges,2 des'8 c aes f | aes4}\\{des1 ~ | des4}>> r f,2 | aes8 aes r aes aes r aes aes | r8 as as4 bes8 r r4 |

  % K
  \key des \major
  ges4 des'8 c ~ c2 | f,4 c'8 bes ~ bes2 | ges4 des'8 c ~ c2 | f,4 c'8 bes ~ bes2 |
  ges4 des'8 c ~ c2 | f,4 c'8 bes ~ bes4 ces | bes4. c8 ~ c2 | ges4. f8 ~ f4 as |

  % L
  r4 bes c r | f,8 f r f ~ f2 | r4 bes c r | as8 as r bes ~ bes2 |
  r4 bes c r | c8 c r bes ~ bes4 ces | <<{ bes4. as8 ~ as4 es' }\\{ r4 bes c r }>> | des2 r |

  % M
  \key cis \major
  cis,1 ~ | \tuplet 3/2 { cis4 cis fis } \tuplet 3/2 { b ais a } | gis1 ~ | \tuplet 3/2 { gis4 dis eis } \tuplet 3/2 { gis ais cis }
  gis1 ~ | gis4 fis b2 | bis1 ~ | bis2 r8 cis, cis dis |
  e4. dis8 ~ dis4 fis^\markup {La ...} ~ | fis8 e4. e8-. r r4 |

  % N
  \key d \major
  g2. a4 | fis4. d8 ~ d d e fis | g2. a4 | fis4. cis'8 b a g fis |
  r8 g^\markup { いつでもいつでもおたがいをみつめてる } a b a4 cis | d a fis g8 a | b4 d cis cis8 b | a4 e'8 d <<{\tiny r8 a b cis}\\{r2}>> |

  % O
  <<{
    d4 r8 fis, e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r a b cis |
    d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 d' cis b a g | fis4 cis'8 b r
  }\\{
    r4 b a r | a8 a r fis ~  fis2 | r4 b a r | a8 a r fis ~ fis2
    r4 b a r | a8 a r fis ~  fis2 | r4 b a r | a8 a r fis ~ fis8
  }>>
  a8 b cis | b1 | a2 ais4. a16 gis | fis1 ~ | fis |
}
altolyric = \lyricmode {

}

tenor = \relative c' {
  \key des \major
  % A
  r2
  des4. c8 ~ c2 | c4. f,8 ~ f2 | des'4. c8 ~ c2 | c4. f,8 ~ f2 |
  des'4. c8 ~ c2 | c4. f,8 ~ f4 ases | ges4. c8 ~ c2 | as4. as8 ~ as2 |

  % B
  ges1^\markup {Lu} | as | ges2 as | bes c |

  % C
  as4. as8 ~ as2 | a4. a8 ~ a2 | bes4. bes8 ~ bes2 | as4. as8 ~ as4 as |
  bes4. bes8 ~ bes2 | as4. des8 ~ des2 | des4. bes8 ~ bes2 | as4. es'8 ~ es4 c |

  % D
  des1 | f4 c bes a | bes4 ges2 bes4 | as1 |
  bes1 | as4 f' des as | bes4 des2. | r8 as r as ~ as2 |

  % E
  \key as \major
  g8 r r4 r8 g ~ g4 | as8 r r as ~ as2 | bes8 r r4 r8 bes ~ bes4 | c4^\markup {La} bes \tuplet 3/2 { as g bes } |
  as1 | <f d'>^\markup {Ah} | <ges des'> ~ | q4 r des'4. ges8 ~ | ges <\parenthesize es as> ~ q2. | r8 c c4 d8 r r4 |

  % F
  \key des \major
  r4 des c r | as8 aes r f8 ~ f2 | r4 des' c r | as8 aes r f8 ~ f2 |
  r4 des' c bes | as4 as8 bes ~ bes4 ases | r4 as as r | as4. as8 ~ as4 r |

  % G
  <<{
    r4 des8 bes c des4 c8 ~ | c bes4 c8 ~ c es,4 as8 ~ | as2
  }\\{
    ges1 | as | ges2
  }>>
  as | bes c

  % H
  as4. as8 ~ as2 | a4. a8 ~ a2 | bes4. bes8 ~ bes2 | as4. as8 ~ as4 as |
  bes4. bes8 ~ bes2 | as4. des8 ~ des2 | des4. bes8 ~ bes2 | as4. es'8 ~ es4 c |

  % I
  des1 | f4 c bes a | bes4 ges2 bes4 | as1 |
  bes1 | as4 f' des as | bes4 des2. | r8 as r as ~ as2 |

  % J
  \key as \major
  g8 r r4 r8 g ~ g4 | as8 r r as ~ as2 | bes8 r r4 r8 bes ~ bes4 | c2 bes |
  aes4^\markup {すなおになれたなら} f aes c | bes f bes d | bes1 ~ | bes4 r des4. ges8 ~ | ges es ~ ees2. | r8 c c4 d8 r r4 |

  % K
  \key des \major
  des4. c8 ~ c2 | as4. f8 ~ f2 | des'4. c8 ~ c2 | as4. f8 ~ f2 |
  des'4. c8 ~ c4 bes | as4 as8 bes ~ bes4 ases | as4. as8 ~ as2 | as4. as8 ~ as4 as |

  % L
  r4 des es r | as,8 as r des ~ des2 | r4 des es r | f8 f r f ~ f2 |
  r4 des es r | as,8 as r as ~ as4 ases | r4 des es r | as,2 r |

  % M
  \key cis \major
  e1 ~ | \tuplet 3/2 { e4 fis gis } b fis' | eis1 ~ | \tuplet 3/2 { eis4 gis, dis' } cis gis |
  e1 ~ | \tuplet 3/2 { e4 fis gis } \tuplet 3/2 { b e fis } | eis1 ~ | eis2 r |
  cis4. b8 ~ b4 d ~ | d8 cis4. cis8-. r r4 |

  % N
  \key d \major
  r8 g^\markup{ たとえばきみがいるだけで(つよくなれる|La) } a b a4. cis8 | d4 a fis g8( a) | b2 cis | d4. g8 fis e d cis |
  b2. e,4 | fis4. cis'8 b a g fis | g2. a4 | fis2 <<{\tiny r8 a b cis}\\{fis2}>> |

  % O
  <<{
    d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r a b cis |
    d4 r8 fis e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r
  }\\{
    r4 g, a r | fis8 fis r b ~ b2 | r4 g a r | fis8 fis r b ~ b2
    r4 g a r | fis8 fis r b ~ b2 | r4 g a r | fis8 fis r b ~ b8
  }>>
  a8 b cis | <d fis>1 | <cis e> | cis( | dis) |
}
tenorlyric = \lyricmode {

}

bass = \relative c {
  \key des \major
  % A
  r2
  es4. as,8 ~ as2 | des4. bes8 ~ bes2 | es4. as,8 ~ as2 | des4. bes8 ~ bes2
  es4. as,8 ~ as2 | f'4. bes,8 ~ bes4 beses | as4. as8 ~ as2 | des4. des8 ~ des2 |

  % B
  as4^\markup {Dun} as as as | as as as as | as as as as | as as as as |

  % C
  des4.^\markup {Du とか Dun とか} des8 ~ des4. as8 | f4. f8 ~ f4. f8 | ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. as8 |
  ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. des8 | es4. es8 ~ es4. bes8 | as4. as8 ~ as4 as8 as |

  % D
  des4. des8 ~ des4. as8 | f4. f8 ~ f4. f8 | ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. as8 |
  ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. des8 | es4. es8 ~ es4. bes8 | as4 as8 as ~ as as^\markup {Du} bes b |

  % E
  \key as \major
  c8 r g c ~ c c4 es8 | des8 r as des ~ des des es f | es8 r bes es ~ es g, bes es | as, r r as g r r g |
  f4 f f f | bes bes bes bes8 as | ges4 ges ges ges | ges ges ges ges |
  as8 as r as as r as as | r as as4 bes8 r r4 |

  % F
  \key des \major
  es4 es as, as | des des bes bes | es es as, as | des des8 bes ~ bes bes des bes |
  es4 es8 as, ~ as4 ges | f4 c'8 bes ~ bes4 beses | as4 as as as | des4 as8 des ~ des4 r |

  % G
  as4 as as as | as as as as | as as as as | as as as as |

  % H
  des4. des8 ~ des4. as8 | f4. f8 ~ f4. f8 | ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. as8 |
  ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. des8 | es4. es8 ~ es4. bes8 | as4. as8 ~ as4 as8 as |

  % I
  des4. des8 ~ des4. as8 | f4. f8 ~ f4. f8 | ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. as8 |
  ges4. ges8 ~ ges4. as8 | des4. des8 ~ des4. des8 | es4. es8 ~ es4. bes8 | as4 as8 as ~ as as bes b |

  % J
  \key as \major
  c8 r g c ~ c c4 es8 | des8 r as des ~ des des es f | es8 r bes es ~ es g, bes es | as, r r as g r r g |
  f4 f f f | bes bes bes bes8 as | ges4 ges ges ges | ges ges ges ges |
  as8 as r as as r as as | r as as4 bes8 r r4 |

  % K
  \key des \major
  es4 es as, as | des des bes bes | es es as, as | des des8 bes ~ bes bes des bes |
  es4 es8 as, ~ as4 ges | f4 c'8 bes ~ bes4 beses | as4 as as as | des4 as8 des ~ des4 des |

  % L
  <<{ r4 ges as r }\\{ es4_\markup {Dun, Du} r8 es as,4 r8 as }>> | des4 r8 des bes4 r8 bes | <<{ r4 ges' as r }\\{ es4 r8 es as,4 r8 as }>> | des4 r8 des bes4 r8 bes |
  <<{ r4 ges' as r }\\{ es4 r8 es as,4 r8 as }>> | f'4 r8 f bes,4 beses | <<{ r4 ges' as r }\\{ as,4 r8 as as4 r8 as }>> | des4 as8 des ~ des4 r |

  % M
  \key cis \major
  a1 ~ | a | cis ~ | cis |
  a1 ~ | a | cis ~ | cis |
  a4. gis8 ~ gis4 g ~ | g8 fis4. a8-. r r4 |

  % N
  \key d \major
  e'4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d | e4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d |
  e4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d | e4 r8 e a,4 r8 a | d4 r8 d <<{\tiny r8 a' b cis}\\{b,4 cis8 d}>> |

  % O
  <<{
    d'4 r8 fis, e d cis d | e4. a8 g fis e d | b4 r8 fis' e d cis b | a4 e'8 d r d e fis |
    g4 r8 g a g fis g | a4. cis8 b8 a g fis | g4 r8 b a b cis d | e4 e8 d

  }\\{
    e,4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d | e4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d |
    e4 r8 e a,4 r8 a | d4 r8 d b4 cis8 d | e4 r8 e a,4 r8 a | d4 r8 d
  }>>
  r8 a b cis | g'1 | fis2 fis, | b1 ~ | b |
}
basslyric = \lyricmode {

}

\book{
  \score{
    <<
      \new Staff = "Melody" \with {
        %\remove Part_combine_engraver
        printPartCombineTexts = ##f
      }<<
          \set Staff.instrumentName = "Melo."
          \set Staff.midiInstrument = "flute"
          \clef "treble_8"
          \new Voice = "VoiceMelody" \melody
      >>
      %\new Lyrics = "LyricsMelody" \lyricsto "VoiceMelody" \melodylyric
      %\new Lyrics = "LyricsMelody2" \lyricsto "VoiceMelody" \melodylyricb

      \new ChoirStaff <<
        \new Staff = "Soprano" \with {
          %\remove Part_combine_engraver
          printPartCombineTexts = ##f
        } <<
          \set Staff.instrumentName = "Sop."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceSoprano" \soprano
        >>
        %\new Lyrics = "LyricsSoprano"

        \new Staff = "Alto" <<
          \set Staff.instrumentName = "Alt."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceAlto" \alto
        >>
        %\new Lyrics = "LyricsAlto"

        \new Staff = "Tenor" <<
          \set Staff.instrumentName = "Ten."
          \set Staff.midiInstrument = "oboe"
          \clef "treble_8"
          \new Voice = "VoiceTenor" \tenor
        >>
        %\new Lyrics = "LyricsTenor"

        \new Staff = "Bass" <<
          \set Staff.instrumentName = "Bas."
          \set Staff.midiInstrument = "oboe"
          \clef bass
          \new Voice = "VoiceBass" \bass
        >>
        %\new Lyrics = "LyricsBass"
        %{
        \context Lyrics = "LyricsSoprano" {
          \lyricsto "VoiceSoprano" {
            \sopranolyric
          }
        }
        \context Lyrics = "LyricsAlto" {
          \lyricsto "VoiceAlto" {
            \altolyric
          }
        }
        \context Lyrics = "LyricsTenor" {
          \lyricsto "VoiceTenor" {
            \tenorlyric
          }
        }
        \context Lyrics = "LyricsBass" {
          \lyricsto "VoiceBass" {
            \basslyric
          }
        }
        %}
      >>
    >>
    \layout {
      \context{
        \Lyrics
        \override LyricText #'font-name = "TakaoEx明朝"
        \override LyricText #'font-size = #-1
      }
    }
    \midi {}
  }
}