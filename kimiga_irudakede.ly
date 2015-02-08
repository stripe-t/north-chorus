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

melody = \relative c'' {
  \key c \major
  \tempo 4=121
  \set Score.markFormatter = #format-mark-box-alphabet
  
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
  a8 g r4 r8 e fis g | \tuplet 3/2 {b( a b} a) a r a( b) b( | c1 ~ | c4) r a ~ a8 d ~ | d c( d4) ~ d2 ~ | d r8 g, a b \bar "||"
  
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
  r4 r8 g e g g g | gis8. gis16 ~ gis8 a ~ a b4. | d4 c8 c ~ c a4 g8 ~ | g a r4 r8 g g g |
  c( a) a c8 ~ c d4 a8 ~ | a a( g4) r8 g g g | f'4 e8 d ~ d c d c( | d1) \bar "||"
  
  \mark #10
  \key g \major
  r4 r8 d d d4 d8 ~ | d4 e8 c ~ c g'4 fis8 ~ | fis a, a a a b c e ~ | e4 d b a8 a( ~ |
  a8 g) r4 r8 e fis g | \tuplet 3/2 {b( a b} a) a r a( b) b( | c1) ~ | c4 r a ~ a8 d ~ | d c( d4) ~ d2 ~ | d r8 g, a b \bar "||"
  
  \mark #11
  \key c \major
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b a | g4 d'8 c r g a b |
  c4 r8 e d c b c | d4. g8 f e d c | a4 r8 e' d c b b( | c2) r8 d c d |
  
  \mark #12
  r4 e d r8 a | c a c a c a ~ a4 | r4 e' d8 g e g | r d( e2.) |
  r4 e d r8 a | c a c a c c( d4) | r4 e d8 g e g | r d( e2) c4
  
  \mark #13
  g'1 ~ | g2 g4. g8 | g1 ~ | g2. c,4 |
  g'1 ~ | g2 g4. g8 | g1 ~ | g2 r8 c, c d \bar "|.|"
  
  r2 r8 aes bes c \bar "||"
  
  \mark #14
  \key des \major
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  \mark #15
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c |
  des4 r8 f es des c des | es4. as8 ges f es des | bes4 r8 f' es des c bes | as4 es'8 des r as bes c \bar "|.|"
  
  R1 \bar "|."
}

melodylyric = \lyricmode {
}
melodylyricb = \lyricmode {
}

soprano = \relative c'' {
  \key c \major
  % A
  s4*2
  s1*8
  
  % B
  s1*4
  
  % C
  s1*8
  
  % D
  s1*8
  
  % E
  \key g \major
  s1*10
  
  % F
  \key c \major
  s1*8
  
  % G
  s1*4
  
  % H
  s1*8
  
  % I
  s1*8
  
  % J
  \key g \major
  s1*10
  
  % K
  \key c \major
  s1*8
  
  % L
  s1*8
  
  % M
  s1*8
  s1
  
  % N
  \key des \major
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
  s4*2
  s1*8
  
  % B
  s1*4
  
  % C
  s1*8
  
  % D
  s1*8
  
  % E
  \key g \major
  s1*10
  
  % F
  \key c \major
  s1*8
  
  % G
  s1*4
  
  % H
  s1*8
  
  % I
  s1*8
  
  % J
  \key g \major
  s1*10
  
  % K
  \key c \major
  s1*8
  
  % L
  s1*8
  
  % M
  s1*8
  s1
  
  % N
  \key des \major
  s1*8
  
  % O
  s1*8
  s1
}
altolyric = \lyricmode {

}

tenor = \relative c' {
  \key c \major
  % A
  s4*2
  s1*8
  
  % B
  s1*4
  
  % C
  s1*8
  
  % D
  s1*8
  
  % E
  \key g \major
  s1*10
  
  % F
  \key c \major
  s1*8
  
  % G
  s1*4
  
  % H
  s1*8
  
  % I
  s1*8
  
  % J
  \key g \major
  s1*10
  
  % K
  \key c \major
  s1*8
  
  % L
  s1*8
  
  % M
  s1*8
  s1
  
  % N
  \key des \major
  s1*8
  
  % O
  s1*8
  s1
}
tenorlyric = \lyricmode {
  
}

bass = \relative c {
  \key c \major
  % A
  s4*2
  s1*8
  
  % B
  s1*4
  
  % C
  s1*8
  
  % D
  s1*8
  
  % E
  \key g \major
  s1*10
  
  % F
  \key c \major
  s1*8
  
  % G
  s1*4
  
  % H
  s1*8
  
  % I
  s1*8
  
  % J
  \key g \major
  s1*10
  
  % K
  \key c \major
  s1*8
  
  % L
  s1*8
  
  % M
  s1*8
  s1
  
  % N
  \key des \major
  s1*8
  
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
          \clef treble
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