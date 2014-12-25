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
        \fontsize #5 "ロビンソン"
      }
      \fill-line {
        \override #'(font-name . "TakaoEx明朝")
        \fontsize #0 "- ノリで作ったら音詰め込み過ぎたバージョン for クリパ -"
      }
      \fill-line {
        \null
        \override #'(font-name . "TakaoEx明朝") "スピッツ"
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

w = #(define-music-function
  (parser location note)(ly:music?)
#{
  \tweak font-size #-2 #note
#})

m = #(define-music-function
  (parser location note)(ly:music?)
  #{
    \magnifyMusic 0.75 #note
  #})

melody = \relative c' {
  \key fis \minor
  \tempo 4=111
  R1 * 4 |
  R1 * 4 |
  \repeat volta 2 {
    R1 * 4 |
    R1 * 4 |
    cis8 cis4 b8 cis4 e | <<{\voiceOne fis8 b,4 a16 b ~ b4} \new Voice = "VoiceMelody2" {\voiceTwo \tiny fis'8 b, b a16 b ~ b4}>> \oneVoice r | b8 b4 a8 b4 e | cis8 a a gis16 a ~ a4 r8 fis16 gis |
    a8 a a b16 cis ~ cis4 r4 | a8 a a b16 cis ~ cis4 r | a8 a a b16 cis ~ cis8 cis cis d | cis4. b8 b4 r |
    cis8 cis4 b8 cis4 e | <<{\voiceOne fis8 b,4 a16 b ~ b4} \new Voice = "VoiceMelody2" {\voiceTwo \tiny fis'8 b, b a16 b ~ b4}>> \oneVoice r | b8 b4 a8 b4 e | cis8 a a gis16 a ~ a4 r8 fis16 gis |
    a8 a a b16 cis ~ cis4 r4 | a8 a a b16 cis ~ cis4 r | a8 a a b16 cis ~ cis8 cis cis d | \slurDashed cis4.( b8) \slurSolid b4 r |
    
    r4 <cis e>8 q q <b d> <a cis> <gis b> | <gis b> <fis a>4 <gis b>8 ~ q <a cis>4 <b d>8 | r4 <b d>8 q q <a cis> <gis b> <fis a> | q <e gis>4 <fis a>8 ~ q <gis b>4 <cis e>8 |
    r4 <cis e>8 q q <b d> <a cis> <gis b> | <gis b> <fis ais>4 <gis b>8 ~ q <ais cis>4 q8( | <b d>2) r8 d e fis | a4 gis fis eis |
    
    fis2 ~ fis8 a, d fis | fis8. gis16 ~ gis8 a gis4 r | gis2 ~ gis8 cis, b' gis | gis8. a16 ~ a8 b a4 r |
    fis2 ~ fis8 a, d fis | gis4 a b8. gis16 ~ gis8 fis | fis4. cis8 e2 ~ | e r |
    <d fis>2 ~ q8 <fis, a> <a d> <d fis> | <d fis>8. <e gis>16 ~ q8 <fis a> <e gis>4 r | <e gis>2 ~ q8 cis <gis' b> <cis, gis'> | <e gis>8. <fis a>16 ~ q8 <gis b> <fis a>4 r |
    cis'4. fis,8 fis4 cis' | b4. e,8 e4 e8 d | cis8. fis16 ~ fis8 fis ~ fis2 ~ |
  }
  \alternative {
    { fis r }
    { fis\repeatTie r }
  }
  
  <d fis>2 ~ q8 <fis, a> <a d> <d fis> | <d fis>8. <e gis>16 ~ q8 <fis a> <e gis>4 r | <e gis>2 ~ q8 cis <gis' b> <cis, gis'> | <e gis>8. <fis a>16 ~ q8 <gis b> <fis a>4 r |
  <a cis>4. <d, fis>8 q4 <a' cis> | <gis b>4. <cis, e>8 q4 q8 <b d> | cis8. fis16 ~ fis8 fis ~ fis2 ~ | fis r |
  \tempo "Meno Mosso"
  cis'4. fis,8 fis4 cis' | b4. e,8 e4 e8 d | cis8. fis16 ~ fis8 fis ~ fis2 ~ | fis1\laissezVibrer \bar "|."
}

leftbrace = \set stanza = \markup {
  \hspace #1
  \translate #'(0 . 0) \left-brace #15 }

rightbrace = \set stanza = \markup {
  \hspace #1
  \translate #'(0 . 0) \right-brace #15 }

dropLyrics = {
  \override LyricText.extra-offset = #'(0 . -1.5)
  \override LyricHyphen.extra-offset = #'(0 . -1.5)
  \override LyricExtender.extra-offset = #'(0 . -1.5)
  \override StanzaNumber.extra-offset = #'(0 . -1.5)
}

raiseLyrics = {
  \revert LyricText.extra-offset
  \revert LyricHyphen.extra-offset
  \revert LyricExtender.extra-offset
  \revert StanzaNumber.extra-offset
}

melodylyric = \lyricmode {
  \set ignoreMelismata = ##t
  \set stanza = "1. "
  あ た ら し い き せ つ は ー な ぜ か せ つ な い ひ び で ー
  か わ ら の み ち を ー じ て ん しゃ で ー は し る き み ー を お い か け た
  お も い で の レ コー ド と ー お お げ さ な エピ ソ ー ド を ー
  つ か れ た か た に ー ぶ ら さ げ て ー し か め つ ら ー ま ぶ し そ う に
  お な じ せ り ふ お な じ ー と き お も わ ず く ち に す る ー よう な
  あ り ふ れ た こ の ま ほ ー う で ー つ く り あ げ た よ \dropLyrics
  だ ー れ も さ わ れ ー な い ふ ー た り だ け の ー く に \raiseLyrics
  き ー み の て を は な さ ー ぬ よ う に ー \dropLyrics
  お ー お き な ち か ー ら で \raiseLyrics
  そ ー ら に う か べ ー た ら
  ル ラ ラ う ちゅ う の か ぜ に の ー る ー ー
  ー
  お ー お き な ち か ー ら で そ ー ら に う か べ ー た ら
  ル ラ ラ う ちゅ う の か ぜ に の ー る ー ー
  ル ラ ラ う ちゅ う の か ぜ に の ー る ー ー
}
melodylyricb = \lyricmode {
  \set ignoreMelismata = ##t
  \set stanza = "2. "
  か た す み \set associatedVoice = "VoiceMelody2" に す て ら れ て \set associatedVoice = "VoiceMelody" ー こ きゅう を や め な い ね こ も ー
  ど こ か に て い る ー だ き あ げ て ー む り や り に ー ほ ほ よ せ る よ
  い つ も の \set associatedVoice = "VoiceMelody2" こ う さ て ん で \set associatedVoice = "VoiceMelody" ー み あ げ た ま る い ま ど は ー
  う す よ ご れ て る ー ぎ り ぎ り の ー み か づ き も ー ぼ く を み て た
  ま ち ぶ せ た ゆ め の ほ ー と り お ど ろ い た き み の ひ と ー み
  そ し て ぼ く ら い ま こ ー こ で ー う ま れ か わ る よ
  \repeat unfold 20 {\skip 1} お ー わ ら な い う た ば ー ら ま い て ー
}

soprano = \relative c'' {
  \key fis \minor
  r8 e4. d4 cis | r8 cis4. b4 cis | r8 b4. cis8 b e, gis | fis4 gis a gis |
  r8 e'4. d4 cis | r8 cis4. b4 cis | r8 b4. cis8 b e, gis | fis4 gis a gis |
  <<{
    e'1 ~ | e2 ~ e8 d cis d | cis1 | cis4 d cis e |
    a1 ~ | a2 gis | gis e ~ | e1 |
    }\\{
    r8 e4. d4 cis | r8 cis4. b4 cis | r8 b4. cis8 b e, gis | fis4 gis a gis |
    r8 e'4. d4 cis | r8 cis4. b4 cis | r8 b4. cis8 b e, gis | fis4 gis8 a8 ~ a4 r |
  }>>
  a1 ~ | a | gis | a |
  fis4. fis8 ~ fis4 r | e4. e8 ~ e4 r | fis4. fis8 ~ fis4 fis | a2 <<{b4 e ~ }\\ {b2}>> |
  <<{
    e1 | fis2 a | gis1 ~ | gis2 e |
    fis f | e fis ~ | fis fis | <\w e, e'>1 |
    }\\ {
    cis'1 | d2 d8 cis b a16 gis ~ | gis2 b | e cis8 a a gis16 fis ~ |
    fis2 f | e dis | d2 <\w d a'> | a'2 gis |
  }>>
  <<{
    r4 cis e8 fis gis fis~ | fis4 e cis e | d2 d8 e fis e ~ | e4 d b d |
    cis2 e8 fis gis fis~ | fis4 e cis4 e | d2 r8 d e fis | a4 gis fis eis |
    }\\{
    gis,1 | a | a | b |
    gis | ais | b | b2 cis |
  }>>
  <<{fis2 r}\\{r8 e4. d4 cis}>> | r8 b4. cis4 b | r8 cis4. b4 cis | r8 gis4. a4 gis |
  r8 e'4. d4 cis | r8 b4. cis4 b | r8 cis4. b4 cis | cis2 <cis gis'> |
  <<{
    a'1 ~ | a2 \times 2/3 {a4 gis fis} | e2 cis4 gis' | gis a e b |
    cis1 | b | b |
    }\\{
    r8 e4. d4 cis | r8 b4. cis4 b | r8 cis4. b4 cis | r8 gis4. a4 gis |
    r8 e'4. d4 cis | r8 b4. a4 gis | r8 b4. cis8 b e, gis |
  }>>
  <fis a>2 a8 b cis d |
  <fis, a>4 <gis b> <a cis> <gis b> |
  r8 <\w cis e>4. <\w b d>4 <\w a cis> | r8 <\w gis b>4. cis4 <\w gis b> | r8 <\w gis cis>4. <\w e b'>4 <\w gis cis> | r8 <\w e gis>4. <\w fis a>4 gis |
  r8 <\w cis e>4. <\w b d>4 <\w a cis> | r8 <\w gis b>4. <\w fis a>4 <\w e gis> | r8 <\w gis b>4. <\w a cis>8 <\w gis b> cis, <\w e gis> | <\w cis fis>4 <\w e gis> <\w fis a> <\w gis b> |
  <a \w cis>1 | <gis \w b> | <\w gis b>( | <\w fis ais>)\laissezVibrer |
}
sopranolyric = \lyricmode {
  
}

alto = \relative c'{
  \key fis \minor
  <fis a>2 q4 q | <e gis>2 q4 q | <e gis>2 q4 q | <cis e>4. q8 ~ q4 q |
  <fis a>2 q4 q | <e gis>2 q4 q | <e gis>2 q4 q | <cis e>4. q8 ~ q4 q |
  <<\m {
    r8 cis'4. b4 a | r8 a4. gis4 a | r8 gis4. a8 gis cis, gis' | fis4 e fis fis |
    r8 cis'4. b4 a | r8 a4. gis4 a | r8 gis4. a8 gis cis, gis' | fis4 e8 fis ~ fis4 gis |
    }\\{
    <fis a>2 q4 q | <e gis>2 q4 q | <cis e>2 q4 q | <cis e>4. q8 ~ q4 q |
    <fis a>2 q4 q | <e gis>2 q4 q | <cis e>2 q4 q | <cis e>4. q8 ~ q4 <b e>4 |
  }>>
  e1 | d | b | cis |
  d4. d8 ~ d4 r | cis4. cis8 ~ cis4 r | d4. d8 ~ d4 d | <<\m {e4 a gis gis}\\{e2. gis4}>> |
  <e \w a>1 | <<\m {b'2 a}\\{fis1}>> | <e \w b'>1 | <\w fis a> |
  <d a'>2 <\w d a'>8 q q <\w e b'>16 <\w e cis'> ~ | q2 <\w fis a>8 q q <\w gis b>16 <\w a cis> ~ | <\w a cis>2 <fis \w a> | <e \w b'>1
  <\w b e>4. q8 ~ q4 r | <\w cis fis>4. q8 ~ q4 r | <\w d fis>4. q8 ~ q4 r | <\w b e>4. q8 ~ q4 r |
  <\w b e>4. q8 ~ q4 r | <\w cis fis>4. q8 ~ q4 q | <\w d a'>1 | <<\m {b'1}\\{e,2( cis)}>> |
  <\w fis a>2 q4 q | <e \w gis>2 q4 q | <e \w gis>2 q4 q | <cis \w fis>2 q4 q |
  <\w fis a>2 q4 q | <e \w gis>2 q4 q | <e \w gis>2 q4 q | <\w cis gis'>4. <e \w gis>8 ~ q b' a gis |
  <<{\m {
    r8 cis4. b4 a | r8 gis4. cis4 gis | r8 gis4. e4 gis | r8 e4. fis4 gis |
    r8 cis4. b4 a | r8 gis4. fis4 e | r8 gis4. a8 gis cis, gis'} | fis4 gis8 a ~ a4 gis |
    }\\{
    <\w fis a>2 q4 q | <e \w gis>2 q4 q | <\w cis e>2 q4 q | <cis \w fis>2 q4 q |
    <fis \w a>2 q4 q | <\w e gis>2 <\w e fis>4 <\w e gis> | <\w cis e>2 q4 q | \m {<cis fis>4 e8 fis ~ fis4 e} |
  }>>
  <cis \w fis>4 <e \w gis> <fis \w a> <e \w gis> |
  <<{
    d'2. cis4 | b1 | cis1 ~ | cis |
    a | b | a ~ | a |
  }\\{
    <fis \w a>2 q4 q | <\w e gis>2 q4 q | <\w cis e>2 q4 q | <\w cis fis>2 q4 q |
    <fis \w a>2 q4 q | <\w e gis>2 <\w e fis>4 <\w e gis> | <\w cis e>2 q4 q | <\w cis fis>4 e8 fis ~ fis4 e |
  }>>
  <\w d fis>1 | <e \w gis> | <\w cis e>( | <\w cis fis>)\laissezVibrer |
}
altolyric = \lyricmode {

}

tenor = \relative c' {
  \key fis \minor
  a4. a8 ~ a2 | b4. b8 ~ b2 | e,4. e8 ~ e2 | a4 gis fis e |
  a4. a8 ~ a2 | b4. b8 ~ b2 | e,4. e8 ~ e2 | a4 gis fis e |
  a4. a8 ~ a4 a | b4. b8 ~ b4 b | e,4. e8 ~ e4 e | <\w e a>4 <\w e gis> <\w cis fis> e |
  a4. a8 ~ a4 a | b4. b8 ~ b4 b | e,4. e8 ~ e4 e | <\w e a>4 <\w e gis> <\w cis fis> e |
  e1 | fis1 | e~ | e |
  a4. a8 ~ a4 r | e4. e8 ~ e4 r | a4. a8 ~ a4 a | a2 gis |
  a2 e | b' d8 cis b a16 gis ~ | gis2 b | e cis8 a a gis16 fis ~ |
  fis2 a | e a | fis8 fis fis gis16 a ~ a8 a a b | a4. gis8 gis4 r |
  gis4. gis8 ~ gis4 r | a4. a8 ~ a4 r | fis4. fis8 ~ fis4 r | gis4. gis8 ~ gis4 r |
  gis4. gis8 ~ gis4 r | gis4. ais8 ~ ais4 ais | b2 r8 b cis d | e2 <gis, cis> |
  a4. a8 ~ a4 a | b4. b8 ~ b4 b | gis4. gis8 ~ gis4 gis4 | fis4. fis8 ~ fis4 fis |
  a4. a8 ~ a4 a | b4. b8 ~ b4 b | gis4. gis8 ~ gis4 gis4 | cis4 gis8 cis ~ cis b a gis |
  a4. e'8 ~ e4 a, | b4. e8 ~ e4 b | gis4. e'8 ~ e4 b | cis4. a8 ~ a4 e |
  a4. a8 ~ a4 cis | b4. b8 ~ b4 gis | a4. a8 ~ a4 b | a4 gis8 a ~ a4 gis |
  a4 gis8 a ~ a4 gis |
  a4. e'8 ~ e4 a, | b4. e8 ~ e4 b | gis4. e'8 ~ e4 b | cis4. a8 ~ a4 e |
  a4. a8 ~ a4 cis | b4. b8 ~ b4 gis | a4. a8 ~ a4 b | a4 gis8 a ~ a4 b |
  cis1 | b | b( | ais)\laissezVibrer |
}
tenorlyric = \lyricmode {
  
}

bass = \relative c {
  \key fis \minor
  d4. d8 ~ d2 | cis4. cis8 ~ cis2 | fis,4. fis8 ~ fis2 | fis4. fis8 ~ fis4 cis' |
  d4. d8 ~ d2 | cis4. cis8 ~ cis2 | fis,4. fis8 ~ fis2 | fis4. fis8 ~ fis4 cis' |
  d4. d8 ~ d4 d | cis4. cis8 ~ cis4 cis | fis,4. fis8 ~ fis4 fis | fis4. fis8 ~ fis4 cis' |
  d4. d8 ~ d4 d | cis4. cis8 ~ cis4 cis | fis,4. fis8 ~ fis4 fis | fis4. fis8 ~ fis4 e' |
  a,4 a8 a ~ a4 cis | b4 b8 b ~ b4 fis | e4 e8 e ~ e4 gis | fis4 fis8 fis ~ fis4 fis8 a |
  d4. d8 ~ d4 r | a4. a8 ~ a4 r | d4. d8 ~ d4 d | e e, fis gis |
  a4. a8 a4 cis | b4. b8 b4 a | gis4. gis8 gis4 gis | fis4. fis8 fis4 e' |
  d2 d | cis fis, | b4. b8 d4 d | e4. e,8 e4 e |
  cis'4 gis'8 cis, ~ cis4 gis | fis cis'8 fis ~ fis fis cis fis | b,4 fis'8 b, ~ b4 fis | e4 b'8 e ~ e e b d |
  cis4 gis'8 cis, ~ cis4 gis | fis cis'8 fis, ~ fis fis gis ais | b4. b8 ~ b4 fis' | e2 cis |
  d4 d d d | d d d d | cis cis cis cis | fis, fis fis a |
  d4 d d d | e e e e | cis cis cis cis | cis gis8 cis ~ cis b a gis |
  d'4 d d d | d d d d | cis cis cis e | fis, fis fis a |
  d4. d8 ~ d4 d | e4. e8 ~ e4 e | fis4. fis8 ~ fis4 fis | fis4. fis8 ~ fis4 e |
  fis4. fis8 ~ fis4 cis |
  d4 d d d | d d d d | cis cis cis e | fis, fis fis a |
  d4. d8 ~ d4 d | e4. e8 ~ e4 e | fis4. fis8 ~ fis4 fis | fis4. fis8 ~ fis4 fis, |
  b1 | cis | <fis, cis'> ~ | q\laissezVibrer |

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
      \new Lyrics = "LyricsMelody" \lyricsto "VoiceMelody" \melodylyric
      \new Lyrics = "LyricsMelody2" \lyricsto "VoiceMelody" \melodylyricb
      %{\context Lyrics = "LyricsMelody" {
        \lyricsto "VoiceMelody" {
          \melodylyric
        }
      }%}
      
      \new ChoirStaff <<
        \new Staff = "Soprano" <<
          \set Staff.instrumentName = "Sop."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceSoprano" \soprano
        >>
        \new Lyrics = "LyricsSoprano"

        \new Staff = "Alto" <<
          \set Staff.instrumentName = "Alt."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceAlto" \alto
        >>
        \new Lyrics = "LyricsAlto"

        \new Staff = "Tenor" <<
          \set Staff.instrumentName = "Ten."
          \set Staff.midiInstrument = "oboe"
          \clef "treble_8"
          \new Voice = "VoiceTenor" \tenor
        >>
        \new Lyrics = "LyricsTenor"

        \new Staff = "Bass" <<
          \set Staff.instrumentName = "Bas."
          \set Staff.midiInstrument = "oboe"
          \clef bass
          \new Voice = "VoiceBass" \bass
        >>
        \new Lyrics = "LyricsBass"

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