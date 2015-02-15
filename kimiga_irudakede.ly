% Template revision 3
%
% For Flescobaldi :
% -*- indent-width: 2; tab-width: 2; indent-tabs: false;

\version "2.18.0"

#(set-global-staff-size 18)

\paper {
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        "Revision 1"
        "2014/12/07"
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
  \key c \major
  \tempo 4=121
  \set Score.markFormatter = #format-mark-box-alphabet

%  \set Score.skipTypesetting = ##t
  \mark #1
  \partial 4*2 {r8 g a b}
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b a | g4 d'8 c r g a b |
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b b( | c2.) r4 |

  \mark #2
  R1*4

  \mark #3
  r4 r8 g e g g g | gis8. gis16 ~ gis8 a ~ a b4 b8( | d4) c8 c ~ c a4 g8 ~ | g a r4 r g8 g |
  c a4 c8 ~ c d4 a8 ~ | a a( g4) r g8 g | a( b4) c8 ~ c d4 a8 ~ | a a( g4) r2 |

  \mark #4
  r4 r8 g e g g g | gis8. gis16 ~ gis8 a ~ a b4 b8( | d4) c8 c ~ c a4 g8 ~ | g a r4 r g8 g |
  c a4 c8 ~ c d4 a8 ~ | a a( g4) r g8 g | a4 b8 c ~ c a4 c8( | d1) \bar "||"

  \mark #5
  \key g \major
  r4 r8 d d d4 d8 ~ | d4 e8 c ~ c g'4 fis8 ~ | fis a, a a a b c e( ~ | e d) d b ~ b a4 b16 a ~ |
  a8 g r4 r8 e fis g | \tuplet 3/2 {b( a b} a) a r a( b) b( | c1 ~ | c4) r a ~ a8 d ~ | d d ~ d2. ~ | d2 r8 g, a b \bar "||"

  \mark #6
  \key c \major
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b a | g4 d'8 c r g a b |
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b b( | c2.) r4 |

  \mark #7
  R1*4

  \mark #8
  r4 r8 g e g g g | gis8. gis16 ~ gis8 a ~ a b4 b8( | d4) c8 c ~ c a4 g8 ~ | g a r4 r g8 g |
  c a4 c8 ~ c d4 a8 ~ | a a( g4) r g8 g | a b4 c8 ~ c d4 a8 ~ | a a( g4) r2 |

  \mark #9
  \partcombine \relative c' {
    r4 r8 g e g g g | gis8. gis16 ~ gis8 a ~ a b4. | d4 c8 c ~ c a4 g8 ~ | g a r4 r8 g g g |
    c( a) a c8 ~ c d4 a8 ~ | a a( g4) r8 g g g | f'4 e8 d ~ d c d c( | d1) \bar "||"
  } \relative c {
    r4 r8 e c e e e | e8. e16 ~ e8 e ~ e gis4. | a4 f8 f ~ f f4 e8 ~ | e e r4 r8 c c c |
    f( c) c f ~ f g4 f8( | e) f( e4) r8 e e e | a4 a8 f ~ f f f g ~ | g1 |
  }

  \mark #10
  \key g \major
  \partcombine \relative c' {
    r4 r8 d d d4 d8 ~ | d4 e8 c ~ c g'4 fis8 ~ | fis a, a a a b c e ~ | e4 d b a8 a( ~ |
    a8 g) r4 r8 e fis g | \tuplet 3/2 {b( a b} a) a r a( b) b( | c1) ~ | c4 r a4. d8 ~ | d d ~ d4 ~ d2 ~ | d r8 g, a b \bar "||"
  } \relative c' {
    r4 r8 b b b4 b8 ~ | b4 c8 e, ~ a c4 d8 ~ | d fis, fis fis fis g a a( | b4) a g fis8 fis( ~ |
    fis8 e) r4 r8 e fis g | \tuplet 3/2 {g( fis g} e) e r e( e) e( | f1) ~ | f4 r f4. a8 ~ | a b ~ b4 ~ b2 ~ | b2 r8 e, d e |
  }

  \mark #11
  \key c \major
  \partcombine \relative c' {
    c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b a | g4 d'8 c r g a b |
    c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b b( | c2) r8 d c d |
  } \relative c {
    f4 r8 c' b a g a | b4. e8 c b g e | f4 r8 c' b a g f | e4 b'8 a r e d e |
    f4 r8 c' b a g a | b4. e8 c b aes aes | f4 r8 c' b a b b( | c2) r8
  }

  \mark #12
  r2 r4 r8 a | c a c a c a ~ a4 | r2 r8 g' e g | r d( e2.) |
  r2 r4 r8 a, | c a c a c c( d4) | r2 r8 g e g | r d( e2) c4

  \mark #13
  <c ees g>1 ~ | q2 q4. <d f g>8 | <c e g>1 ~ | q2 c2 |
  <c ees g>1 ~ | q2 q4. <d f g>8 | <c e g>1 ~ | q2 r8 c c d \bar "|.|"

  r2 r8 aes bes c \bar "||"
 % \set Score.skipTypesetting = ##f
  \mark #14
  \key des \major
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |

  \mark #15
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r2

  R1*4
%  \set Score.skipTypesetting = ##t
}

melodylyric = \lyricmode {
}
melodylyricb = \lyricmode {
}

soprano = \relative c'' {
  \key c \major
  % A
  r2
  e4. d8 ~ d2 | d4. c8 ~ c2 | e4. d8 ~ d2 | d4. c8 ~ c2 |
  e4. d8 ~ d2 | d4. c8 ~ c4 f | e4. d8 ~ d2 | c4. c8 ~ c2 |

  % B
  <a c>1 | <g b> | a2 b | c d |

  % C
  c4. c8 ~ c2 | b4. b8 ~ b2 | a4. a8 ~ a2 | g4. g8 ~ g4 g |
  a4. c8 ~ c2 | c4. g8 ~ g2 | a4. c8 ~ c2 | c4. b8 ~ b4 a |

  % D
  g2. c4 | b2 e | c2. d4 | e1 |
  f1 | e2 d8 c4 g8 | a2 e' | r8 d r d ~ d2 |

  % E
  \key g \major
  b8 r r4 r8 b ~ b4 | c8 r r c ~ c2 | a8 r r4 r8 a ~ a4 | b8 r r d g4 fis |
  e2 r | r4 cis e cis | c1 ~ | c4 r a4. d8 ~ | d d ~ d2. | r8 d d4 e8 r r4 |

  % F
  \key c \major
  r4 e d r | d8 d r c ~ c2 | r4 e d r | d8 d r c ~ c2 |
  r4 e d r | d8 d r c ~ c4 f | r4 e d r | c4. c8 ~ c4 r |

  % G
  <a c>1 | <g b> | a2 b | c d |

  % H
  c4. c8 ~ c2 | b4. b8 ~ b2 | a4. a8 ~ a2 | g4. g8 ~ g4 g |
  a4. c8 ~ c2 | c4. g8 ~ g2 | a4. c8 ~ c2 | c4. b8 ~ b4 a |

  % I
  g2. c4 | b2 e | c2. d4 | e1 |
  f1 | e2 d8 c4 g8 | a2 e' | r8 d r d ~ d2 |

  % J
  \key g \major
  b8 r r4 r8 b ~ b4 | c8 r r c ~ c2 | a8 r r4 r8 a ~ a4 | b8 r r d g4 fis |
  e2 r | r4 cis e cis | c1 ~ | c4 r a4. d8 ~ | d d ~ d2. | r8 d d4 e8 r r4 |

  % K
  \key c \major
  r4 e d r | d8 d r c ~ c2 | r4 e d r | d8 d r c ~ c2 |
  r4 e d r | d8 d r c ~ c4 f | r4 e d r | c4. c8 ~ c4 r |

  % L
  r4 e d r | b8 b r a ~ a2 | r4 e' d r | d8 d r c ~ c c e g |
  r4 e d r | d8 d r c ~ c4 f | <<{ e4. d8 ~ d4 g }\\{ r4 e d r }>> | e2 r |

  % M
  ees1 ~ | ees2 f | e1 ~ | e |
  ees1 ~ | ees2 f | g1 ~ | g2 r |
  s1

  % N
  \key des \major
  bes,2. c4 | aes4. f8 ~ f f ges aes | bes2. c4 | aes4. ees'8 des c bes aes |
  bes2. c4 | aes4. aes'8 ges f ees des | bes2. c4 | aes2 aes' |
  s1*8

  % O
  s1*8
  s1
}

sopranolyric = \lyricmode {

}

alto = \relative c'{
  \key c \major
  % A
  r2
  f4. a8 ~ a2 | g4. g8 ~ g2 | f4. a8 ~ a2 | g4. g8 ~ g2 |
  f4. a8 ~ a2 | g4. g8 ~ g4 bes | a4. g8 ~ g2 | e4. e8 ~ e2 |

  % B
  r4 e8 c d a'4 g8 ~ | g d4 e8 ~ e b4 g8 ~ | g2 d' | e f |

  % C
  e4. e8 ~ e2 | e4. e8 ~ e2 | f4. f8 ~ f2 | e4. e8 ~ e4 e |
  e4. a8 ~ a2 | e4. e8 ~ e2 | f4. f8 ~ f2 | g4. g8 ~ g4 d |

  % D
  e2. a4 | gis2 a4 b | a2 c | c1 |
  c2 d | c g | f4 a c2 | r8 c r b ~ b2 |

  % E
  \key g \major
  d,8 r r4 r8 d ~ d4 | e8 r r e ~ e2 | fis8 r r4 r8 fis ~ fis4 | g8 r r g ~ \tuplet 3/2 { g4 b a } |
  g2 b | a1 | a ~ | a4 r e4. a8 ~ | a b ~ b2. | r8 g g4 a8 r r4 |

  % F
  \key c \major
  r4 a b r | b8 b r a ~ a2 | r4 a b r | b8 b r a ~ a2 |
  r4 a b r | b8 b r a ~ a4 bes | r4 a b r | f4. e8 ~ e4 r |

  % G
  r4 e8 c d a'4 g8 ~ | g d4 e8 ~ e b4 g8 ~ | g2 d' | e f |

  % H
  e4. e8 ~ e2 | e4. e8 ~ e2 | f4. f8 ~ f2 | e4. e8 ~ e4 e |
  e4. a8 ~ a2 | e4. e8 ~ e2 | f4. f8 ~ f2 | g4. g8 ~ g4 d |

  % I
  e2. a4 | gis2 a4 b | a2 c | c1 |
  c2 d | c g | f4 a c2 | r8 c r b ~ b2 |

  % J
  \key g \major
  d,8 r r4 r8 d ~ d4 | e8 r r e ~ e2 | fis8 r r4 r8 fis ~ fis4 | g8 r r g ~ \tuplet 3/2 { g4 b a } |
  g2 b | a1 | a ~ | a4 r e4. a8 ~ | a b ~ b2. | r8 g g4 a8 r r4 |

  % K
  \key c \major
  r4 a b r | b8 b r a ~ a2 | r4 a b r | b8 b r a ~ a2 |
  r4 a b r | b8 b r a ~ a4 bes | r4 a b r | f4. e8 ~ e4 r |

  % L
  r4 a b r | e,8 e r e ~ e2 | r4 a b r | g8 g r a ~ a2 |
  r4 a b r | b8 b r a ~ a4 bes | <<{ a4. g8 ~ g4 d' }\\{ r4 a b r }>> | c2 r |

  % M
  c,1 ~ | \tuplet 3/2 { c4 c f } \tuplet 3/2 { bes a aes } | g1 ~ | \tuplet 3/2 { g4 d e } \tuplet 3/2 { g a c }
  g1 ~ | g4 f bes2 | b1 ~ | b2 r
  s1

  % N
  \key des \major
  ges2. aes4 | f4. des8 ~ des des ees f | ges2. aes4 | f4. c'8 bes aes ges f |

  % O
  s1*8
  s1
}
altolyric = \lyricmode {

}

tenor = \relative c' {
  \key c \major
  % A
  r2
  c4. b8 ~ b2 | b4. e,8 ~ e2 | c'4. b8 ~ b2 | b4. e,8 ~ e2 |
  c'4. b8 ~ b2 | b4. e,8 ~ e4 ges | f4. b8 ~ b2 | g4. g8 ~ g2 |

  % B
  f1 | g | f2 g | a b |

  % C
  g4. g8 ~ g2 | gis4. gis8 ~ gis2 | a4. a8 ~ a2 | g4. g8 ~ g4 g |
  a4. a8 ~ a2 | g4. c8 ~ c2 | c4. a8 ~ a2 | g4. d'8 ~ d4 b |

  % D
  c1 | e4 b a gis | a4 f2 a4 | g1 |
  a1 | g4 e' c g | a4 c2. | r8 g r g ~ g2 |

  % E
  \key g \major
  fis8 r r4 r8 fis ~ fis4 | g8 r r g ~ g2 | a8 r r4 r8 a ~ a4 | b4 a \tuplet 3/2 { g fis a } |
  g1 | <e cis'> | <f c'> ~ | q4 r c'4. f8 ~ | f <\parenthesize d g> ~ q2. | r8 b b4 cis8 r r4 |

  % F
  \key c \major
  c4. b8 ~ b2 | g4. e8 ~ e2 | c'4. b8 ~ b2 | g4. e8 ~ e2 |
  c'4. b8 ~ b4 a | g4 g8 a ~ a4 ges | g4. g8 ~ g2 | g4. g8 ~ g4 r |

  % G
  <<{
    r4 c8 a b c4 b8 ~ | b a4 b8 ~ b d,4 g8 ~ | g2
  }\\{
    f1 | g | f2
  }>>
  g | a b

  % H
  g4. g8 ~ g2 | gis4. gis8 ~ gis2 | a4. a8 ~ a2 | g4. g8 ~ g4 g |
  a4. a8 ~ a2 | g4. c8 ~ c2 | c4. a8 ~ a2 | g4. d'8 ~ d4 b |

  % I
  c1 | e4 b a gis | a4 f2 a4 | g1 |
  a1 | g4 e' c g | a4 c2. | r8 g r g ~ g2 |

  % J
  \key g \major
  fis8 r r4 r8 fis ~ fis4 | g8 r r g ~ g2 | a8 r r4 r8 a ~ a4 | b4 a \tuplet 3/2 { g fis a } |
  g1 | <e cis'> | <f c'> ~ | q4 r c'4. f8 ~ | f <\parenthesize d g> ~ q2. | r8 b b4 cis8 r r4 |

  % K
  \key c \major
  c4. b8 ~ b2 | g4. e8 ~ e2 | c'4. b8 ~ b2 | g4. e8 ~ e2 |
  c'4. b8 ~ b4 a | g4 g8 a ~ a4 ges | g4. g8 ~ g2 | g4. g8 ~ g4 r |

  % L
  r4 c d r | g,8 g r c ~ c2 | r4 c d r | e8 e r e ~ e2 |
  r4 c d r | g,8 g r g ~ g4 ges | r4 c d r | g,2 r |

  % M
  ees1 ~ | \tuplet 3/2 { ees4 f g } bes f' | e1 ~ | \tuplet 3/2 { e4 g, d' } c g |
  ees1 ~ | \tuplet 3/2 { ees4 f g } \tuplet 3/2 { bes ees f } | e1 ~ | e2 r |
  s1

  % N
  \key des \major
  r8 ges,^\markup{ Ten: たとえばきみがいるだけでつよくなれる } aes bes aes4. c8 | des4 aes f ges8( aes) | ges2 aes | des4. ges8 f ees des c |

  % O
  s1*8
  s1
}
tenorlyric = \lyricmode {

}

bass = \relative c {
  \key c \major
  % A
  r2
  d4. g,8 ~ g2 | c4. a8 ~ a2 | d4. g,8 ~ g2 | c4. a8 ~ a2
  d4. g,8 ~ g2 | e'4. a,8 ~ a4 aes | g4. g8 ~ g2 | c4. c8 ~ c2 |

  % B
  g4 g g g | g g g g | g g g g | g g g g |

  % C
  c4. c8 ~ c4. g8 | e4. e8 ~ e4. e8 | f4. f8 ~ f4. g8 | c4. c8 ~ c4. g8 |
  f4. f8 ~ f4. g8 | c4. c8 ~ c4. c8 | d4. d8 ~ d4. a8 | g4. g8 ~ g4 g8 g |

  % D
  c4. c8 ~ c4. g8 | e4. e8 ~ e4. e8 | f4. f8 ~ f4. g8 | c4. c8 ~ c4. g8 |
  f4. f8 ~ f4. g8 | c4. c8 ~ c4. c8 | d4. d8 ~ d4. a8 | g4 g8 g ~ g g a ais |

  % E
  \key g \major
  b8 r fis b ~ b b4 d8 | c8 r g c ~ c c d e | d8 r a d ~ d fis, a d | g, r r g fis r r fis |
  e4 e e e | a a a a8 g | f4 f f f | f f f f |
  g8 g r g g r g g | r g g4 a8 r r4 |

  % F
  \key c \major
  d4 d g, g | c c a a | d d g, g | c c8 a ~ a a c a |
  d4 d8 g, ~ g4 f | e4 b'8 a ~ a4 aes | g4 g g g | c4 g8 c ~ c4 r |

  % G
  g4 g g g | g g g g | g g g g | g g g g |

  % H
  c4. c8 ~ c4. g8 | e4. e8 ~ e4. e8 | f4. f8 ~ f4. g8 | c4. c8 ~ c4. g8 |
  f4. f8 ~ f4. g8 | c4. c8 ~ c4. c8 | d4. d8 ~ d4. a8 | g4. g8 ~ g4 g8 g |

  % I
  c4. c8 ~ c4. g8 | e4. e8 ~ e4. e8 | f4. f8 ~ f4. g8 | c4. c8 ~ c4. g8 |
  f4. f8 ~ f4. g8 | c4. c8 ~ c4. c8 | d4. d8 ~ d4. a8 | g4 g8 g ~ g g a ais |

  % J
  \key g \major
  b8 r fis b ~ b b4 d8 | c8 r g c ~ c c d e | d8 r a d ~ d fis, a d | g, r r g fis r r fis |
  e4 e e e | a a a a8 g | f4 f f f | f f f f |
  g8 g r g g r g g | r g g4 a8 r r4 |

  % K
  \key c \major
  d4 d g, g | c c a a | d d g, g | c c8 a ~ a a c a |
  d4 d8 g, ~ g4 f | e4 b'8 a ~ a4 aes | g4 g g g | c4 g8 c ~ c4 r |

  % L
  <<{ r4 f g r }\\{ d4 r8 d g,4 r8 g }>> | c4 r8 c a4 r8 a | <<{ r4 f' g r }\\{ d4 r8 d g,4 r8 g }>> | c4 r8 c a4 r8 a |
  <<{ r4 f' g r }\\{ d4 r8 d g,4 r8 g }>> | e'4 r8 e a,4 aes | <<{ r4 f' g r }\\{ g,4 r8 g g4 r8 g }>> | c4 g8 c ~ c4 r |

  % M
  aes4 aes aes aes | aes aes aes aes | c c c c | c c c c |
  aes4 aes aes aes | aes aes aes aes | c c c c | c c c c |
  s1

  % N
  \key des \major
  ees4 r8 ees aes,4 r8 aes | des4 r8 des bes4 c8 des | ees4 r8 ees aes,4 r8 aes | des4 r8 des bes4 c8 des |
  ees4 r8 ees aes,4 r8 aes | des4 r8 des bes4 c8 des | ees4 r8 ees aes,4 r8 aes | des4 r8 des bes4 c8 des |

  % O
  s1*8
  s1
}
basslyric = \lyricmode {

}

\book{
  \score{
    <<
      \new Staff = "Melody" <<
          \set Staff.instrumentName = "Melo."
          \set Staff.midiInstrument = "flute"
          \clef "treble_8"
          \new Voice = "VoiceMelody" \melody
      >>
      %\new Lyrics = "LyricsMelody" \lyricsto "VoiceMelody" \melodylyric
      %\new Lyrics = "LyricsMelody2" \lyricsto "VoiceMelody" \melodylyricb

      \new ChoirStaff <<
        \new Staff = "Soprano" <<
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