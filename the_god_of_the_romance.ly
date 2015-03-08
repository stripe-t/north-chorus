% Template revision 3
%
% For Flescobaldi :
% -*- indent-width: 2; tab-width: 2; indent-tabs: false;

\version "2.18.0"

% showLastLength = R1*16

#(set-global-staff-size 18)

% The number next to "th" in (th 0.2) controls thickness of the brackets.
#(define-markup-command (left-bracket layout props) ()
"Draw left hand bracket"
(let* ((th 0.2) ;; todo: take from GROB
	(width (* 2.5 th)) ;; todo: take from GROB
	(ext '(-2.8 . 2.8))) ;; todo: take line-count into account
	(ly:bracket Y ext th width)))

leftBracket = {
  \once\override BreathingSign.text = #(make-left-bracket-markup)
  \once\override BreathingSign.break-visibility = #end-of-line-invisible
  \once\override BreathingSign.Y-offset = ##f
  % Trick to print it after barlines and signatures:
  \once\override BreathingSign.break-align-symbol = #'custos
  \breathe
}


#(define-markup-command (right-bracket layout props) ()
"Draw right hand bracket"
  (let* ((th .2);;todo: take from GROB
          (width (* 2.5 th)) ;; todo: take from GROB
          (ext '(-2.8 . 2.8))) ;; todo: take line-count into account
        (ly:bracket Y ext th (- width))))

rightBracket = {
  \once\override BreathingSign.text = #(make-right-bracket-markup)
  \once\override BreathingSign.Y-offset = ##f
  \breathe
}

\paper {
  page-count = 16
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        "Revision 2"
        "2015/3/8"
      }
      \fill-line {
        \override #'(font-name . "TakaoEx明朝")
        \fontsize #5 "ロマンスの神様"
      }
      \fill-line {
        \null
        \override #'(font-name . "TakaoEx明朝") "作詞/作曲  広瀬香美"
      }
      \fill-line {
        \null
        \override #'(font-name . "TakaoEx明朝") "編曲  立島智央"
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

  tagline = ""

  %{oddFooterMarkup = \markup {
    \on-the-fly #last-page \column{
      \fontsize #-2 \italic \fill-line {
        \left-column {"This score is open-source." "The latest revision is available at : https://github.com/stripe-t/north-chorus/releases"}
        \right-column {"LilyPond - Music Notation for Everyone" #(string-append "Version " (lilypond-version) ", See www.lilypond.org")}
      }
    }
  }

  evenFooterMarkup = \oddFooterMarkup%}
}

im = \set ignoreMelismata = ##t
noim = \set ignoreMelismata = ##f

soprano = \relative c' {
  \set Score.markFormatter = #format-mark-box-alphabet
  \key aes \major
  \set Score.tempoHideNote = ##t
  \tempo \markup {
      \concat {
        \smaller \note #"4" #1
        \normal-text
        " = ca. 100"
      }
    } 4=100
  \dynamicUp
  \mark #1
  r4 ees\p ees aes | f2. r4 | r des des aes' | fes1\espressivo ~ |
  \tempo \markup {
      \concat {
        \smaller \note #"4" #1
        \normal-text
        " = ca. 128"
      }
    } 4=128
  fes2.\> r4\! |
  \mark #2
  R1*4 |
  r4 ees\mp ees aes | f2. r4 | r des des aes' | ees2.\< r4\! | r2 r8 \mark #3 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r2 |
  fes2(\mp aes4 bes | c2 ees,) | f1_( | aes2 <<{\voiceTwo g | aes2)}\new Voice="VoiceSopranoDiv"{\mark #4 \voiceOne r8 c^\mp c c |
  des c des c}>> \oneVoice r c c c | des c des c r c c des | ees des ees des a bes des c | c bes c des r2 |
  des1(\mp | c2 ees4 c | bes1 | aes4) r \mark #5 r2 |
  \bar "||" \key b \major
  dis1\mp\( ~ | dis2 ~ dis8 e dis b | gis2\) b4\( cis | dis2\) r2 |
  r8 fis,\mf\cresc fis d fis4 gis8 b ~ | b a gis gis a4 e8\< f16 fis | a8->\! fis-> r b-> fis-> r \tuplet 3/2 {e\< fis a} | b cis( b) cis b2 ~ | b2. r4\! |
  \mark #6
  \bar "||" \key fis \major
  r2 r4 dis8\f cis ~ | cis cis b b ais4 gis8 fis | b8 r ais ais gis gis fis fis | ais\< b c cis ~ cis4 r\! |
  r2 r4 dis8 cis ~ | cis cis b b ais\> ais gis fis | ais\mf b c cis ais fis gis fis ~ | fis2.\> r4\! |
  \mark #7
  \bar "||" \key aes \major
  R1*4 | r2 r8 \mark #8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | r des ees des r2 |
  r8 des'\mp des des ees des ees des | r c c des c bes c aes | r4 des,\< f aes8 aes | g4 aes8 bes\! r8 \mark #9 c\mp c c |
  des c des c r c c c | des c des c r c c des | ees des ees des a bes des c | c bes c des r2 |
  des1\mp( | c2 ees4 c | bes1 | aes4) r \mark #10 \leftBracket gis,8\mf ais b cis |
  \bar "||" \key b \major
  dis4 cis b cis8[ \rightBracket dis] ~ | dis fis gis cis b4 r8 cis | dis4 cis b8 b fis' fis ~ | fis dis16 cis dis4 r2 |
  r4 cis(\mf\cresc b\< e-- ~ | e\! d\> cis\!) r | a8-> fis-> r b-> fis-> r r4 | r2 <<{\voiceTwo fis2(\< | gis2.)}\new Voice = "VoiceSopranoDiv" {\voiceOne r4 a( | e'2.)}>> \oneVoice r4\! |
  \bar "||" \key fis \major
  \mark #11
  r2 r4 dis8\f cis ~ | cis cis b b ais8 ais gis8 fis | b8 r ais ais gis gis fis fis | ais\< b c cis ~ cis4 r\! |
  r2 r4 dis8 cis ~ | cis cis b b ais ais gis fis | ais b c cis ais fis gis fis ~ | fis2.\< r4\! |
  \mark #12
  b4->\ff b-> cis-> r | r2 r8 gis8\( ais cis | dis2\< eis | fis e\) |
  dis4->\! dis-> eis-> dis8 cis ~ | cis cis b b ais\> ais gis fis | ais\mf b c cis ais fis gis fis ~ | fis2. r4 |
  \mark #13
  r8 dis\mp dis dis fisis gis ais cis | cis b b ais b4 r | R1 | R1 |
  r8 fisis\mf\< fisis fisis fisis gis ais cis | cis b b ais b4\! dis,8\cresc dis | cis cis dis dis eis eis fis fis | gis gis ais ais b b cis e | r e ~ e2.\< | eis4->\ff eis-> r2 |
  \mark #14
  R1*7 <<{R1}\new Voice{s2 s8 s4.^\markup{\italic "poco riten."}}>>

  \tempo \markup {
      \concat {
        "Un poco meno mosso ( "
        \smaller \note #"4" #1
        \normal-text
        " = ca. 120 )"
      }
    } 4=120
  \mark #15
  \bar "||"
  b4->\p b-> cis-> r | R1 | R | R |
  b4-> b-> cis-> r | R1 | R | <>^\markup {\italic "accel."} R |

  \tempo 4=128
  \mark #16
  \bar "||" \key g \major
  c4->\f^\markup{\italic "a tempo"} c-> d-> e8 d ~ | d d c c b4 a8 g\cresc | c c b b a a g g | b c cis d ~ d\< d->-- ~ d16 f8.->-- |
  e4->\ff e-> fis-> e8 d ~ | d d c c b b a g | b^\markup {\italic "unis."} c cis d b g a g ~ | g2. r4 |
  \bar "||" \key a \major
  \mark #17
  r e4\mf e a | fis2. r4 | r4 d d a' | e2. r4 |
  r e4 e a | fis2. r4 | r4 d d a' | e2.^\markup{\italic "poco"}\< r4\! |
  R1 | <e gis>1\p ~ | q\fermata\> <>\! \bar "|."
}
sopranolyric = \lyricmode {
  Wait -- ing for you I feel so good __
  Wait -- ing for you I feel so good
  \im
  ゆ う き と あ い が せ か い を す く う ぜ っ た い い つ か で あ え る は ず な の
  \noim
  B.O. __ B.O. __
  \im
  し か も フレ ッ ク ス あ い て は ど こ に で も い る ん だ か ら
  \noim
  B.O. __
  la __ la la la la la la la
  \im
  せ い か く よ け ー れ ば い い そん な の う そ だ と お も い ま せ ー ん か ー
  し あ ー わ せ の よ か ん きっ と だ れ か を か ん じ て る ー
  ロ マ ー ン ス の か み さ ま こ の ひ と で しょ う か ー

  ノ リ と は じ ら い ひ つ よ う な の よ しょ た い め ん の お と こ の ひ と っ て
  ね ん れ い じゅ う しょ しゅ み に しょ く ぎょ う チェ ッ ク し な く ちゃ
  ま っ て い ま し た ご う か く ラ イ ン は や く サ ン グ ラ ス と っ て み せ て よ
  \noim
  B.O. __
  \im し あ わ せ に な れ る も ー の な ら ば ゆ う じょ う よ り あ ー い じょ う
  \noim Ah __
  \im オッ ケー ちょっ と \noim Ah __
  \im こ い ー し て る しゅ ん か ん きっ と あ な た を か ん じ て る ー
  ロ マ ー ン ス の か み さ ま ね が い を か な え て ー
  \im Boy Meets Girl la la la la la la la
  Fall In Love ロ マ ー ン ス の か み さ ま ど う も あ り が と う ー
  よ く あ た る ほ し う ら な い に
  きょ う あ う ひ と と む す ば れ る こ ん しゅ う も ら い しゅ う も さ ら い しゅ う も ず ーっ と ー Oh Yeah!
  Boy Meets Girl Fall In Love
  Boy Meets Girl い つ ー ま で も ずっ と こ の き も ち を わ す れ た く な い ー \noim Ah __ Ah
  \im Fall In Love ロ マ ー ン ス の か み さ ま ど う も あ り が と う ー
  \noim Wait -- ing for you I feel so good
  Wait -- ing for you I feel so good
  U __
}
sopranodivlyric = \lyricmode {
  \im
  しゅ う きゅ う ふ つ か
  \noim
  Ah __
}

alto = \relative c'{
  \key aes \major
  \dynamicUp
  r4 aes\p ees' c | bes2. r4 | r aes aes <aes des> | <aes des>1\espressivo ~ | q2.\> r4\! |
  R1*4 |
  r4 aes\mp ees' ees | d2. r4 | r aes aes des | ees2.\< r4\! | r2 r8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r des des des |
  ees des ees des r des des ees | des c des c r c c des | c bes bes aes aes g g aes | bes2 r8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r2 |
  aes'2\mp( ges) | ges( f) | f( ees | ees4) r gis,8\mf ais b cis |
  \key b \major
  dis4 cis b cis8 dis ~ | dis fis gis dis fis4 r8 b, | dis4 cis b fis'8 fis ~ | fis cis dis4 r2 |
  r8 fis\mf\cresc fis d fis4 gis8 e ~ | e cis b b a4 e'8\< f16 fis | fis8->\! d-> r fis-> dis-> r r4 | r2 <<{\voiceTwo fis2\<( | e2.)}\new Voice = "VoiceAltoDiv" {\voiceOne r4 a( | gis2.)}>> \oneVoice r4\! |
  \key fis \major
  <dis b'>4->\f q-> <eis cis'>-> b'8 ais ~ | ais ais gis gis fis4 eis8 cis | b2\<( cis | fis e) |
  <dis b'>4->\! q-> <eis cis'>-> r4 | gis8 gis fis eis dis\> eis dis cis | dis2\mf fis( | dis\> cis4) r\! |
  \key aes \major
  R1*4 | r2 r8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | r des ees des r2 |
  r8 fes\mp fes fes ges fes ges fes | r aes aes bes aes g aes f | r4 bes,\< des f8 f | ees4 f8 ees\! r8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r2 |
  aes'2(\mp ges) | ges( f) | f( ees | ees4) r gis,8\mf ais b cis |
  \key b \major
  dis4 cis b cis8 dis ~ | dis fis gis dis fis4 r8 cis | dis4 cis b8 b fis' fis ~ | fis dis16 cis dis4 r2 |
  r4 a'\mf\cresc( gis\< e-- ~ | e\! gis\> fis\!) e8\< f16 fis | d8->\! a-> r dis-> b-> r \tuplet 3/2 {e8\< fis a} | b cis b cis b2 ~ | b2. r4\! |
  \key fis \major
  <dis, b'>4->\f q-> <eis cis'>-> b'8 ais ~ | ais ais gis gis fis fis eis8 cis | b2(\< cis | fis e) |
  <dis b'>4->\! q-> <eis cis'>-> r4 | gis8 gis fis eis dis eis dis cis | dis2 fis( | fis\< e2) |
  dis4->\ff dis-> eis-> fis8 eis ~ | eis eis dis dis cis4 b8 ais | dis4\< fis gis b | ais8 b c cis ~ cis4 r\! |
  b4-> b-> cis-> r | gis8 gis fis eis dis\> eis dis cis | dis2\mf fis( | dis cis2) |

  R1 | R1 | r8 cis\mp cis cis eis fis gis b | b4 ais gis fis |
  r8 ais,\mf\< ais ais ais dis eis fisis | gis gis gis fis dis4\! ais8\cresc ais | gis gis b b cis cis dis dis | eis eis fis fis gis gis gis b | r <a cis>8 ~ q2.\< | <gis cis>4->\ff q-> r2 |

  R1*8

  dis4->\p dis-> eis-> r | R1 | R | R |
  dis4-> dis-> eis-> r | R1 | R | R |
  \key g \major
  e4->\f e-> fis-> g8 fis ~ | fis fis e fis g4 d8 g\cresc | a a g g fis fis d d | g <fis a> <f ais> <g b> ~ q\< <gis b>->-- ~ q16 <gis d'>8.->-- |
  <e c'>4->\ff q-> <fis d'>-> g8 fis ~ | fis fis e fis g g fis g | b c cis d b g a g ~ | g2. r4 |
  \key a \major
  r4 a,\mf e' e | dis2. r4 | r a d d | b2. r4 |
  r4 a e' e | dis2. r4 | r a d d | e2.^\markup{\italic "poco"}\< r4\! |
  R1 | <b cis>1\p ~ | q\fermata\> <>\! |
}
altolyric = \lyricmode {
  Wait -- ing for you I feel so good __
  Wait -- ing for you I feel so good
  \im
  ゆ う き と あ い が せ か い を す く う ぜ っ た い い つ か で あ え る は ず な の
  し ず む ゆ う ひ に さ み し く ひ と り こ ぶ し に ぎ り し め る わ た し
  しゅ う きゅ う ふ つ か し か も フレ ッ ク ス あ い て は ど こ に で も い る ん だ か ら
  \noim
  B.O. __ B.O. __ B.O. __
  \im
  め だ つ に は ど う し た ー ら い い の い ち ば ん の な ー や み
  せ い か く よ け ー れ ば い い そん な の う そ だ と \noim Ah __
  \im
  Boy Meets Girl し あ ー わ せ の よ か ん \noim Ah __
  \im Fall In Love ロ マ ン ス の か み さ ま \noim Ah __
  \im
  ノ リ と は じ ら い ひ つ よ う な の よ しょ た い め ん の お と こ の ひ と っ て
  ね ん れ い じゅ う しょ しゅ み に しょ く ぎょ う チェ ッ ク し な く ちゃ
  ま っ て い ま し た ご う か く ラ イ ン は や く サ ン グ ラ ス と っ て み せ て よ
  \noim B.O. __ B.O. __ B.O. __
  \im し あ わ せ に な れ る も ー の な ら ば ゆ う じょ う よ り あ ー い じょ う
  \noim Ah __ \im さっ そ く オッ ケー ちょっ と し ん じ ら れ ー な い ー
  Boy Meets Girl こ い ー し て る しゅ ん か ん \noim Ah __
  \im Fall In Love ロ マ ン ス の か み さ ま \noim Ah __
  \im Boy Meets Girl こ い ー す る き も ち す て き な た か ら も の ー
  Fall In Love ロ マ ン ス の か み さ ま \noim Ah __
  \im そ う い え ば か い て あ ーっ た
  きょ う あ う ひ と と む す ば れ る こ ん しゅ う も ら い しゅ う も さ ら い しゅ う も ず ーっ と ー Oh Yeah!
  Boy Meets Girl Fall In Love
  Boy Meets Girl い つ ー ま で も ずっ と こ の き も ち を わ す れ た く な い ー \noim Ah __ Ah
  \im Fall In Love ロ マ ー ン ス の か み さ ま ど う も あ り が と う ー
  \noim Wait -- ing for you I feel so good
  Wait -- ing for you I feel so good
  U __
}
altodivlyric = \lyricmode {
  Ah __
}

tenor = \relative c {
  \key aes \major
  \dynamicUp
  r4 ees\p aes ees | d2. r4 | r des f f | fes1\espressivo ~ | fes2.\> r4\! |
  R1*4 |
  r4 ees\mp aes c | bes2. r4 | r4 des, f aes | bes2.\< r4\! | r2 r8 ees,\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r des' des des |
  ees des ees des r des des ees | des c des c r c c des | c bes bes aes aes g g aes | bes2 r2 |
  aes1\mf( | g | ges | f2) r8 des'\mf des des |
  ees des ees des r des des ees | des c des c r c4 des8 | c bes bes aes g aes bes aes ~ | aes4 r e8\mf fis gis ais |
  \key b \major
  b2( ais | cis b) | b( ais | b) r |
  r8 d\mf\cresc d a b4 e8 gis, ~ | gis a b b a4 e8\< f16 fis | a8->\! fis-> r b-> fis-> r r4 | r4 b2.\< ~ | b2. r4\! |
  \key fis \major
  fis4->\f fis-> gis-> r | gis-> gis-> ais-> r | r2 fis8\< r gis gis | ais b c cis ~ cis4 r\! |
  fis,4-> fis-> gis-> dis'8 cis ~ | cis cis b b ais\> ais gis fis | fis2\mf( gis | b\> ais4) r\! |
  \key aes \major
  R1*5
  R1*3 | r2 r8 des\mf des des |
  ees des ees des r des des ees | des c des c r c c des | c bes bes aes aes g g aes | bes2 r2 |
  aes1\mf( | g | ges | f2) r8 des'\mf des des |
  ees des ees des r des des ees | des c des c r c c des | c bes bes aes aes g aes bes | aes4 r e8\mf fis gis ais |
  \key b \major
  b4 ais fis b8 ais ~ | ais b ais fis dis4 r4 | b'2 cis4 e | dis2 r2 |
  r8 fis,\mf\cresc fis d fis4 gis8 b ~ | b a gis gis a4 e8\< f16 fis | r8\! a-> fis-> r b-> fis-> r4 | r4 <<{\voiceTwo b2.\< ~ | b2.}\new Voice = "VoiceTenorDiv" {\voiceOne r4 d2( | e2.)}>> \oneVoice r4\! |
  \key fis \major
  fis,4->\f fis-> gis-> r | gis-> gis-> ais-> r | r2 fis8\< r gis gis | ais b c cis ~ cis4 r\! |
  fis,4-> fis-> gis-> dis'8 cis ~ | cis cis b b ais ais gis fis | fis2(\< gis | b4 cis2.) |
  fis,4->\ff fis-> gis-> dis'8 cis ~ | cis cis b b ais4 gis8 fis | b\< b ais ais gis gis fis fis | ais b c cis ~ cis4 r\! |
  fis,4-> fis-> gis-> dis'8 cis ~ | cis cis b b ais\> ais gis fis | fis2(\mf gis8) gis ais b | b cis ais gis fis2 |

  r8 dis\mp dis dis fisis gis ais cis | cis b b ais b4 r | R1 | R1 |
  r8 fisis\mf\< fisis fisis fisis gis ais cis | cis b b ais b4\! fis8\cresc fis | gis gis gis b b b b b | cis cis dis dis <cis eis> q q e | r d ~ d2.\< | eis4->\ff eis-> r2 |

  R1*8

  fis,4->\p fis-> gis-> r | R1 | R | R |
  fis4-> fis-> gis-> r | R1 | R | R |
  \key g \major
  g4->\f g-> a-> c8 b ~ | b b a a b4 c8 d\cresc | e e e e c c ais ais | b c cis d ~ d\< e->-- ~ e16 d8.->-- |
  c4->\ff g-> a-> c8 d ~ | d d c d e d b g | b c cis d b g a g ~ | g2. r4 |
  \key a \major
  r4 e\mf a cis | b2. r4 | r d, fis a | a2. r4 |
  r4 e a cis | b2. r4 | r d, fis a | b2.^\markup{\italic "poco"}\< r4\! |
  R1 | e,1\p ~ | e\fermata\> <>\! |
}
tenorlyric = \lyricmode {
  Wait -- ing for you I feel so good __
  Wait -- ing for you I feel so good
  \im
  ゆ う き と あ い が せ か い を す く う ぜ っ た い い つ か で あ え る は ず な の
  し ず む ゆ う ひ に さ み し く ひ と り こ ぶ し に ぎ り し め る わ た し
  \noim
  Ah __
  \im
  こ ん や の み か い き た い し て い る と も だ ち の と も だ ち に ー
  め だ つ に \noim は(Ah) __  Ah __
  \im せ い か く よ け ー れ ば い い そん な の う そ だ と \noim Ah __
  \im
  Boy Meets Girl Boy Meets Girl きっ と か ん じ て る ー
  Fall In Love ロ マ ー ン ス の か み さ ま \noim Ah __
  \im
  ね ん れ い じゅ う しょ しゅ み に しょ く ぎょ う さ り げ な く チェ ッ ク し な く ちゃ
  \noim Ah __
  \im え が お が す て き ま が お も す て き お も わ ず み と れ て し ま う の
  し あ わ せ に な れ る も ー の な ら ば あ い じょ う
  か え り は お く ー ら せ て と さっ そ く オッ ケー ちょっ と
  \noim Ah __
  \im Boy Meets Girl Boy Meets Girl きっ と か ん じ て る ー
  Fall In Love ロ マ ー ン ス の か み さ ま \noim Ah __
  \im Boy Meets Girl こ い ー す る き も ち な に よ り す て き な た か ら も の ー
  Fall In Love ロ マ ー ン ス の か み さ ま \noim Ah __ \im ど う も あ り が と う
  \im よ く あ た る ほ し う ら な い に
  きょ う あ う ひ と と む す ば れ る こ ん しゅ う も ら い しゅ う も さ ら い しゅ う も ず ーっ と ー Oh Yeah!
  Boy Meets Girl Fall In Love
  Boy Meets Girl い つ ー ま で も ずっ と こ の き も ち を わ す れ た く な い ー \noim Ah __ Ah
  \im Fall In Love ロ マ ー ン ス の か み さ ま ど う も あ り が と う ー
  \noim Wait -- ing for you I feel so good
  Wait -- ing for you I feel so good
  U __
}
tenordivlyric = \lyricmode {
  Ah __
}

bass = \relative c {
  \key aes \major
  \dynamicUp
  r4 aes\p c aes | aes2. r4 | r aes des aes | aes1\espressivo ~ | aes2.\> r4\! |
  R1*4 |
  r4 aes\mp c aes | aes2. r4 | r aes aes des | ees2.\< r4\! | r2 r8 ees\mf ees ees |
  f ees f ees r ees ees ees | f ees f ees r ees ees f | ges f ges f b, c f ees | ees des ees des r2 |
  des1\mp( | c | bes | ees) |
  aes,\mf( ~ | aes ~ | aes | des2) r8 f\mf f f |
  ges fes ges fes r fes fes ges | f ees f ees r ees4 f8 | ees des des c bes c des c ~ | c4 r r2 |
   \key b \major
  e2\mp( fis | dis1) | e2( fis | b,) r2 |
  d4\mf\cresc a' gis e | cis gis' fis cis\< | d8->\! b-> r fis'-> b,-> r r4 | e1\< ~ | e2. r4\! |
  \key fis \major
  b4->\f b-> cis-> r | eis-> eis-> dis-> r | r2 cis8\< r cis cis | fis gis a ais ~ ais4 r\! |
  b,4-> b-> cis-> b8 ais ~ | ais ais cis gis' fis\> eis cis ais | b2\mf( cis | fis2.\>) r4\! |
  \key aes \major
  R1*5
  R1*3 | r2 r8 des\mf des des |
  ees des ees des r des des ees | des c des c r c c des | c bes bes aes aes g g aes | bes2 r2 |
  aes1\mf( ~ | aes ~ | aes | des2) r8 f\mf f f |
  ges fes ges fes r fes fes ges | f ees f ees r ees ees f | ees des des c c bes c des | c4 r r2 |
  \key b \major
  e2\mf fis4 e8 dis ~ | dis dis ais8 ais gis4 r | e'2 fis4 cis | b2 r2 |
  r8 fis'\mf\cresc fis d fis4 gis8 e ~ | e cis b b a4 e'8\< f16 fis | r8\! d-> a-> r dis-> b-> r4 | e1\< ~ | e2. r4\! |
  \key fis \major
  b4->\f b-> cis-> r | eis-> eis-> dis-> r | r2 cis8\< r cis cis | fis gis a ais ~ ais4\! r |
  b,4-> b-> cis-> b8 ais ~ | ais ais cis gis' fis eis cis ais | b2(\< cis | fis2.) fis4 |
  b,4->\ff b-> cis-> r | ais-> ais-> dis-> r | b8\< b dis dis cis cis cis cis | fis gis a ais ~ ais4 r\! |
  b,4-> b-> cis-> b8 ais ~ | ais ais cis gis' fis\> eis cis ais | b2\mf( cis4) cis8 dis | fis4 b ais2 |

  R1 | R1 | r8 cis,\mp cis cis eis fis gis b | b4 ais gis fis |
  r8 dis\mf\< dis dis dis dis fisis ais | gis dis dis cis dis4\! b8\cresc b | cis cis cis eis eis eis gis gis | eis eis gis gis gis gis b b | r a ~ a2.\< | <cis, gis'>4->\ff q-> r2 |

  R1*8

  b4->\p b-> cis-> r | R1 | R | R |
  b4-> b-> cis-> r | R1 | R | R |
  \key g \major
  c4->\f c-> d-> c8 b ~ | b b fis' fis e4 fis8 g\cresc | c, c e e d d fis fis | g fis f e ~ e\< e->-- ~ e16 b8.->-- |
  a4->\ff c-> d-> c8 b ~ | b b d a' g fis d g, | b c cis d b g a g ~ | g2. r4 |
  \key a \major
  r4 a\mf cis a | a2. r4 | r4 a a d | e2. r4 |
  r4 a, cis a | a2. r4 | r4 a a d | e2.^\markup{\italic "poco"}\< r4\! |
  R1 | a,1\p ~ | a\fermata\> <>\! |
}
basslyric = \lyricmode {
  Wait -- ing for you I feel so good __
  Wait -- ing for you I feel so good
  \im
  ゆ う き と あ い が せ か い を す く う ぜ っ た い い つ か で あ え る は ず な の
  \noim
  B.O. __
  Ah __
  \im
  こ ん や の み か い き た い し て い る と も だ ち の と も だ ち に ー
  \noim
  Ah __  Ah __
  \im せ い か く よ け れ ば う そ だ と \noim Ah __
  \im
  Boy Meets Girl Boy Meets Girl きっ と か ん じ て る ー
  Fall In Love ロ マ ー ン ス ロ マ ン ス の \noim Ah __
  \im
  ね ん れ い じゅ う しょ しゅ み に しょ く ぎょ う さ り げ な く チェ ッ ク し な く ちゃ
  \noim Ah __
  \im え が お が す て き ま が お も す て き お も わ ず み と れ て し ま う の
  し あ わ せ ー に な れ る あ い じょ う
  か え り は お く ー ら せ て と さっ そ く オッ ケー ちょっ と
  \noim Ah __
  \im Boy Meets Girl Boy Meets Girl きっ と か ん じ て る ー
  Fall In Love ロ マ ー ン ス ロ マ ン ス の \noim Ah __ Ah
  \im Boy Meets Girl Boy Meets Girl こ い す る き も ち た か ら も の ー
  Fall In Love ロ マ ー ン ス ロ マ ン ス の \noim Ah __ \im あ り が と う
  \im そ う い え ば か い て あ ーっ た
  きょ う あ う ひ と と む す ば れ る こ ん しゅ う も ら い しゅ う も さ ら い しゅ う も ず ーっ と ー Oh Yeah!
  Boy Meets Girl Fall In Love
  Boy Meets Girl い つ ー ま で も ずっ と こ の き も ち を わ す れ た く な い ー \noim Ah __ Ah
  \im Fall In Love ロ マ ー ン ス の か み さ ま ど う も あ り が と う ー
  \noim Wait -- ing for you I feel so good
  Wait -- ing for you I feel so good
  U __
}

rh = \change Staff = "PianoRH"
lh = \change Staff = "PianoLH"

pianorh = \relative c''' {
  \clef treble
  \key aes \major
  R1*4 | r8 des[\( \grace {c16( des} c8) bes] aes f ees des\) |

  r8 <aes c aes'> q4 q8 r16 q ~ q8 ees'16 f | r8 <d, f aes> aes' d,16 ees aes8 a16 bes16 ~ bes b c8 |
  r8 <aes des aes'> q4 q8 r16 q ~ q8 bes'16 c | r8 <des, des'> <c c'> <bes bes'> <aes aes'> <f f'> <ees ees'> <des des'> |
  r8 <aes' c aes'> q4 q8 r16 q ~ q8 ees'16 f | r8 <d, f aes> aes' d,16 ees aes8 a16 bes16 ~ bes b c8 |
  r8 <aes des aes'> q4 q8 r16 q ~ q8 bes'16 c |
  \override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket r8 <des, des'> <c c'> <bes bes'> <<{s4 r8 <des' des'>8-> | <c c'>-> <aes aes'>-> <f f'>-> <ees ees'>->}\\{<aes, aes'> <f f'> <ees ees'> <des des'>\arpeggio | c' aes f ees}\\{\hideNotes s s \once \override NoteColumn.ignore-collision = ##t ees\arpeggio \unHideNotes}>> r2 \revert PianoStaff.Arpeggio.stencil

  <aes, c f>8( ees'-.) r <aes, c> ~ q ees'4 ees8 | <g, c f>8( ees'-.) r <g, c> ~ q ees'4 f8 |
  <aes, c ges'>8( f'-.) r <aes, ces> ~ q c f8 ees | <f, aes ees'>8( des'-.) r <f, aes>8 ~ q <f' aes ees'>([ des' aes]) |

  <fes, aes ees'>8( des'-.) r <fes, aes des> ~ q <fes' aes>([ des' ees)] | <ees, aes des>( c'-.) r ees-> ~ <aes, ees' aes>4->-. des8( c |
  <<{<des, f aes>4) <des f bes> \voiceOne <des aes' des> <aes' des aes'>}\new Voice{\voiceTwo s2 r8 ees( aes ees')}>> \oneVoice | <<{<bes, ees bes'>4.}\\{aes'4 aes8}>> <bes, ees g>8->-. r8 ees ~ <ees ees'>4-> |

  <<{<des' f>8[( <c ees>-.])}\\{aes4}>> r8 <ees aes c>8 ~ q ees' <aes, c> ees' | <<{<des f>8[( <c ees>-.])}\\{g4}>> r8 <ees g c>8 ~ q ees' <g, c> f' |
  <<{<ees ges>8[( <des f>-.])}\\{ges,4}>> r8 <b, ees a b>8 ~ q <c c'> <f aes c f> <ees ges ees'> | <<{\voiceOne <ees ees'>8[( <des des'>) aes'}\new Voice{\voiceTwo <f aes>4}>> \oneVoice <aes, des f>8] ~ q des'16[ ees] aes8 aes, |
  <<{ees'8[( des-.])}\\{<fes, aes>4}>> r8 <des ees aes> ~ q <aes aes'> <des des'> <ees ees'> | <<{<des des'>[( <c c'>])}\\{<ees aes>4}>> r8 <ees ees'> <c ees aes>4 <<{des'8 c}\\{<f, aes>4}>> |
  <<{c'8( bes) bes( aes) g( aes) <g bes>( ees)}\\{<des f aes>2 <des ees>}>> | r8 <aes aes'>( <bes bes'> <c c'> <ees ees'> <f f'> <aes aes'> <bes bes'> \noBreak

  \key b \major
  <b dis fis b>2) s | s s4 <dis, fis b>8 cis'16 d |
  <gis, dis'>4 <e gis cis> <cis fis b> <e' fis ais cis>8 dis'16 e | <ais, dis fis>4-> <fis,, ais dis fis> \tuplet 3/2 {<fis b dis>4-> <g c e>-> <gis cis eis>->}
  <<{r8 a' d <a a'> \oneVoice <gis b d gis>4 \voiceOne gis'8 a16 b}\\{<a,, d fis>4-> fis' s <d' e>}>> | <gis, b e>4 <<{\tuplet 3/2 {b'8 e b}}\\{<e, gis>4}>> <a, cis fis a> e8 f16 fis |
  <d a'>8-> fis-> \lh b,,16([ fis' \rh b fis']) <b, dis a' b>8-> fis'-> \tuplet 3/2 {<b, b'>8 <fis' fis'> <f f'>} |
  <<{\lh \voiceOne \tuplet 3/2 {r8 b,( e} \tuplet 3/2{fis b, fis'} \rh \voiceTwo b16 fis b fis' \tuplet 5/4 {a[ b cis d dis]}}\new Voice{<e,, a e'>1}>> |
  <<{\voiceOne \repeat tremolo 8 {e''32)( e,} e'8-.)}\new Voice{\voiceTwo r8 <e,, gis b>->( q-> q-> q->) \revert Slur.positions }>> \oneVoice r <cis eis gis cis>4->

  \key fis \major
  <dis fis b dis>4 <b' dis fis ais> <gis cis eis gis> <dis fis b dis>8-> <cis eis ais cis>-> ~ | q4 \slurUp gis'8( fis <<{\voiceOne eis fis gis cis)}\new Voice{\voiceTwo <ais, cis>2}>> \oneVoice \slurNeutral
  <dis fis b>4 <dis eis ais> <dis eis gis> <cis fis> | <ais fis' ais>8 <b gis' b> <c a' c> <cis ais' cis>8 ~ <<{\voiceTwo q2}\new Voice{\voiceOne e'8 <gis gis'>-> fis'-> cis->}\new Voice{\voiceFour s4 <fis, ais cis>}>> \oneVoice |
  <b, dis fis b>4 <b dis fis ais> <gis cis eis gis> <dis' fis b dis>8-> <cis eis ais cis>-> ~ | q4 <b dis fis b> <<{<ais dis eis ais>4 <gis b cis gis'>8 <fis ais fis'>}\\{ais8 cis s4}>> |
  <fis, ais dis>2 <cis fis gis cis> | <cis fis b> <cis fis ais> |
  \key aes \major
  r8 <aes' c aes'> q4 q8 r16 q ~ q8 ees'16 f | r8 <d, f aes> aes' d,16 ees aes8 a16 bes16 ~ bes b c8 |
  r8 <aes des aes'> q4 q8 r16 q ~ q8 bes'16 c |
  r8 <des, des'> <c c'> <bes bes'> <<{s4 r8 <des' des'>8-> | <c c'>-> <aes aes'>-> <f f'>-> <ees ees'>->}\\{<aes, aes'> <f f'> <ees ees'> <des des'> | c' aes f ees}>> r2

  <aes, c f>8( ees'-.) r <aes, c> ~ q ees'4 ees8 | <g, c f>8( ees'-.) r <g, c> ~ q ees'4 f8 |
  <aes, c ges'>8( f'-.) r <aes, ces> ~ q c f8 ees | <f, aes ees'>8( des'-.) r <f, aes>8 ~ q <f' aes ees'>([ des' aes]) |

  <fes, aes ees'>8( des'-.) r <fes, aes des> ~ q <fes' aes>([ des' ees)] | <ees, aes des>( c'-.) r ees-> ~ <aes, ees' aes>4->-. des8( c |
  <<{<des, f aes>4) <des f bes> \voiceOne <des aes' des> <aes' des aes'>}\new Voice{\voiceTwo s2 r8 ees( aes ees')}>> \oneVoice | <<{<bes, ees bes'>4.}\\{aes'4 aes8}>> <bes, ees g>8->-. r8 ees ~ <ees ees'>4-> |

  <<{<des' f>8[ <c ees>]}\\{aes4}>> r8 <ees aes c>8 ~ q ees' <aes, c> ees' | <<{<des f>8[ <c ees>]}\\{g4}>> r8 <ees g c>8 ~ q ees' <g, c> f' |
  <<{<ees ges>8[ <des f>]}\\{ges,4}>> r8 <b, ees a b>8 ~ q <c c'> <f aes c f> <ees ges ees'> | <<{\voiceOne <ees ees'>8[ <des des'> aes'}\new Voice{\voiceTwo <f aes>4}>> \oneVoice <aes, des f>8] ~ q des'16[ ees] aes8 aes, |
  <<{ees'8[ des]}\\{<fes, aes>4}>> r8 <des ees aes> ~ q <aes aes'> <des des'> <ees ees'> | <<{<des des'>[ <c c'>]}\\{<ees aes>4}>> r8 <ees ees'> <c ees aes>4 <<{des'8 c}\\{<f, aes>4}>> |
  <<{c'8( bes) bes( aes) aes( g) aes( <ees bes'>)}\\{<des f aes>2 <des ees>}>> | r8 <aes aes'>( <bes bes'> <c c'> <ees ees'> <f f'> <aes aes'> <bes bes'> \noBreak

  \key b \major
  <b dis fis b>2) s | s s4 <dis, fis b>8 cis'16 d |
  <gis, dis'>4 <e gis cis> <cis fis b> <e' fis ais cis>8 dis'16 e | <ais, dis fis>4-> <fis,, ais dis fis> \tuplet 3/2 {<fis b dis>4-> <g c e>-> <gis cis eis>->}
  <<{r8 a' d <a a'> \oneVoice <gis b d gis>4 \voiceOne gis'8 a16 b}\\{<a,, d fis>4-> fis' s <d' e>}>> | <gis, b e>4 <<{\tuplet 3/2 {b'8 e b}}\\{<e, gis>4}>> <a, cis fis a> e8 f16 fis |
  <d a'>8-> fis-> \lh b,,16([ fis' \rh b fis']) <b, dis a' b>8-> fis'-> \tuplet 3/2 {<b, b'>8 <fis' fis'> <f f'>} |
  <<{\lh \voiceOne \tuplet 3/2 {r8 b,( e} \tuplet 3/2{fis b, fis'} \rh \voiceTwo b16 fis b fis' \tuplet 5/4 {a[ b cis d dis]}}\new Voice{<e,, a e'>1}>> |
  <<{\voiceOne \repeat tremolo 8 {e''32)( e,} e'8-.)}\new Voice{\voiceTwo r8 %{ TODO: ??? %}\override Slur.positions = #'(0 . 0) <e,, gis b>->( q-> q-> q->) \revert Slur.positions }>> \oneVoice r <cis eis gis cis>4->

  \key fis \major
  <dis fis b dis>4 <b' dis fis ais> <gis cis eis gis> <dis fis b dis>8-> <cis eis ais cis>-> ~ | q4 \slurUp gis'8( fis <<{\voiceOne eis fis gis cis)}\new Voice{\voiceTwo <ais, cis>2}>> \oneVoice \slurNeutral
  <dis fis b>4 <dis eis ais> <dis eis gis> <cis fis> | <ais fis' ais>8 <b gis' b> <c a' c> <cis ais' cis>8 ~ <<{\voiceTwo q2}\new Voice{\voiceOne e'8 <gis gis'> fis' cis}\new Voice{\voiceFour s4 <fis, ais cis>}>> \oneVoice |
  <b, dis fis b>4 <b dis fis ais> <gis cis eis gis> <dis' fis b dis>8-> <cis eis ais cis>-> ~ | q4 <b dis fis b> <<{<ais dis eis ais>4 <gis b cis gis'>8 <fis ais fis'>}\\{ais8 cis s4}>> |
  <fis, ais dis>2 <cis fis gis cis> | <<{b'4 ais16 b cis dis \mergeDifferentlyHeadedOn e8 \mergeDifferentlyHeadedOff fis, cis' fis}\\{<cis, fis>2 <fis b e>->\arpeggio}>>

  \key fis \major
  <dis fis b dis>4 <b' dis fis ais> <gis cis eis gis> <dis fis b dis>8-> <cis eis ais cis>-> ~ | q4 \slurUp <gis' b>8( <fis ais> <<{\voiceOne <eis gis> <fis ais> <gis b> <ais cis>)}\new Voice{\voiceTwo cis,2}>> \oneVoice \slurNeutral
  <dis fis b dis>4 <fis ais cis fis> <eis gis dis' eis> <cis eis gisis cis> | <<{<fis ais fis'>8 <gis b gis'> <a c a'> <ais cis ais'> ~ q <gis b gis'> <fis ais fis'> <e gis cis>}\\{cis'2 e}>> |
  <dis, fis b dis>4 <b' dis fis ais> <gis cis eis gis> <dis' fis b dis>8-> <cis eis ais cis>-> ~ | q4 <b dis fis b> <<{<ais dis eis ais>4 <gis b cis gis'>8 <fis ais fis'>}\\{ais8 cis s4}>> |
  <<{ais8 b c cis ais fis gis cis,}\\{<fis dis'>2 <cis gis' cis>}>> | r8 fis'16[ gis a ais] r8 fis16 gis a ais r4 |

  <ais,, dis fisis>1 | <b dis gis>2. b8 dis16 d | <eis, gis cis>1 | <eis ais cis>2 ~ q8 fis cis' fis |
  <fisis, ais dis fisis>4. <gis gis'>8 <ais dis fisis ais>4 ais'8 ais' | <b, dis fis b>4 <fis b dis fis> <b, dis fis b> <fis b dis fis> |
  <eis gis cis>4. <eis gis b dis>8 ~ q4 <gis b dis fis> ~ | q8 <gis cis eis gis>4. <b eis gis b>4 <cis eis gis cis> |
  <d fis a d>4. <a' cis fis a>8 ~ q4 <d fis a d> | <eis gis cis eis>4-> q-> cis,8. eis16 ~ eis8 gis |

  <<{\voiceOne cis8([ d cis}\new Voice{\voiceTwo <d, fis a>4.}>> \oneVoice <e fis a>8] ~ q4.) cis'16( d | <<{\voiceOne <fis a>2) s4}\new Voice{\voiceTwo r8 <fis a>4 q8 e d cis d}\new Voice{\voiceThree s2 \tuplet 3/2 {gis16([ a gis} fis8] e fis \oneVoice |
  <gis, cis e>4.) }>> \oneVoice <e gis b>8 ~ q4 cis'8 <gis b e> ~ | q2. \voiceOne r4 | \oneVoice
  fis8( b, fis') <b, fis'>8 ~ q4. e16 dis | <<{\voiceOne e8( dis b fis}\new Voice{\voiceTwo <fis b>2}>> \lh \voiceOne e8 dis b fis) \oneVoice \rh |
  a'[( d a']) <a d a'>8 ~ q4 gis8 <e gis e'> ~ | q <fis a fis'> <gis b gis'> <a cis a'> <b dis b'> <cis eis cis'>4.--\arpeggio^\markup{\italic "poco riten."} |
  <dis fis dis'>4 <fis, dis' fis> <eis gis eis'> <gis b gis'>8 <cis eis cis'> ~ | \voiceOne q4 b'8( ais <<{\voiceOne gis fis eis fis)}\new Voice{\voiceTwo <ais, dis>2}>> \oneVoice
  <fis b dis>4 \tuplet 3/2 {dis'8 eis fis} <b, dis gis>4 <eis, gis cis> | <<{b'( ais b\arpeggio cis)}\\{<cis, fis>2 q\arpeggio}>>
  <dis fis dis'>4 <ais dis fis> <gis cis eis> <gis b gis'>8 <cis eis cis'> ~ | \voiceOne q4 b'8( ais <<{\voiceOne gis fis eis fis)}\new Voice{\voiceTwo <ais, dis>2}>> \oneVoice
  <ais dis fis>2 <<{gis'4 ais}\\{<b, eis>2}>> | <cis fis b>4^\markup {\italic "accel."} <cis fis ais> <d g c> <g b d>

  \key g \major
  <e g c e>4^\markup{\italic "a tempo"} <c' e g b> <a d fis a> <e' g c e>8-> <d fis b d>-> ~ | q4 <c fis a c> <b d g b> <a c fis a>8 <g b e g> |
  r8 <c e g c>4-> <b e g b>8 <a d fis a>4 <g c d g> | <b g' b>8-> <c a' c>-> <cis ais' cis>-> <d g b d>-> ~ q <d gis b d>->-- ~ q16 <f aes d f>8.->-- |
  <e g c e>4-> <b e g b> <a d fis a> <e' g c e>8-> <d fis b d>-> ~ | q4 <c e g c> <<{<b e fis b>4 <a c d a'>8 <g b g'>}\\{b8 d s4}>> |
  <g, b e>2 <g a d> | <d a' c> <d g b> |

  \key a \major
  r8 <a' cis a'> q4 q8 r16 q ~ q8 e'16 fis | r8 <dis, fis a> a' dis,16 e a8 ais16 b16 ~ b bis cis8 |
  r8 <a d a'> q4 q8 r16 q ~ q8 b'16 cis | r8 <d, d'> <cis cis'> <b b'> <a a'> <fis fis'> <e e'> <d d'> |
  r8 <a' cis a'> q4 q8 r16 q ~ q8 e'16 fis | r8 <dis, fis a> a' dis,16 e a8 ais16 b16 ~ b bis cis8 |
  r8 <a d a'> q4 q8 r16 q ~ q8 b'16 cis |
  r8 <d, d'> <cis cis'> <b b'> <<{s4 r8 <d' d'>8-> | <cis cis'>-> <a a'>-> <fis fis'>-> <e e'>->}\\{<a, a'> <fis fis'> <e e'> <d d'> | cis' a fis e}>> \lh \voiceOne r8 e,-> e4-> |
  \rh \oneVoice
  \override NoteHead.font-size = #-2
  \override Accidental.font-size = #-2
  \set tieWaitForNote = ##t
  \omit TupletNumber
  \omit TupletBracket
  \stemDown \tuplet 10/8 {s32*3 gis32[ ~ cis ~ e ~] \stemUp a ~ [ b ~ ] \stemDown e _~ [ a ~ ]}
  \revert NoteHead.font-size
  \revert Accidental.font-size
  \stemUp <b cis e>2.^>^.~ |
  \hideNotes <gis,, cis e a b e a b cis e>1 |
}
pianolh = \relative c, {
  \clef bass
  \key aes \major
  R1*5 |

  <<{
    r4 r8 <bes'' c ees> ~ q4 <aes bes c ees> | r4 r8 <bes d f> ~ q4 <aes bes d f> | r4 r8 <bes des f> ~ q4 <aes bes des f> |
  }\\{
    <aes, aes'>1 | q | q |
  }>>
  r8 <ees ees'>8 q4 q8. q16 ~ q8 ees'16 ees, |

  <<{
    r8 ees' aes des <ees, aes c>8 r16 q ~ q4 | r8 f aes d <d, f bes>8 r16 <d f aes>16 ~ q4 | r8 f aes des <des, f bes>8 r16 q ~ q8 aes' |
  }\\{
    <aes,, aes'>2. ~ q8 aes16 aes' | <aes, aes'>2. ~ q8 aes16 aes' | <aes, aes'>2. ~ q8 <aes' aes'> |
  }>>

  <<{r8 bes des f aes bes des\arpeggio aes'\arpeggio}\\{<ees,, ees'>1}\\{\voiceFour s2 <ees' f aes>}>> | r2 r8 <ees, ees'>8-> q4-> |

  aes4 ees' ~ ees8 ees ees, ees' | aes,4 ees' ~ ees8 ees ees, ees' | aes,4 ges' ~ ges8 ees ees, ees' | des4 aes8 <des, des'>8 ~ q aes''([ des, aes)] |

  des,4 aes'8 des8 ~ des des, des' aes | c,4 aes'8 <c ees aes> ~ q <<{c( des aes')}\\{aes,4.}>> |
  <<{c'8( bes) bes( aes) aes( g) g( aes)}\\{f2 f}\\{\tweak X-offset #-1 bes,1}>> | ees4 ees8 ees,-> r4 <<{ees'4->}\\{ees8 ees,}>> |

  aes8 ees' bes' <ees, aes c> ~ q ees ees, ees' | aes, ees' g <ees aes c> ~ q ees ees, ees' |
  aes, ges' bes <aes, ges'> ~ q <ees' c'> aes aes, | des,8 des' aes8 <des, des'> ~ q f' <aes, des> f |
  des aes' des <fes aes> ~ q aes, des des, | <<{r aes' c ees r c ees aes}\\{<c,, c'>2 <f f'>}>> |
  <<{r8 f bes des r bes ees g}\\{<bes,, bes'>2 <ees ees'>}>> | <<{\voiceOne r8 ees' g ees \shape #'((0 . 0.0) (0 . 0.0) (0 . -10.0) (0 . -7.2)) PhrasingSlur aes\( bes ces des}\new Voice{\voiceTwo s2 <c, ees>}\new Voice{<aes, aes'>1}>>

  \key b \major
  <<{\voiceOne dis''4 cis \rh \oneVoice  b cis8 dis ~}\new Voice{<e, gis b>2 <fis, cis' fis>}>> | <<{dis''8 fis gis <dis cis'> <fis b>4\)}\new Voice{\lh \voiceOne <fis, ais>8 b ais fis dis2}\new Voice{\lh \voiceTwo <dis, dis'>2 <gis dis'>}>>
  \lh \oneVoice <e e'>2 <fis fis'> | <b, b'>4. fis'8 \tuplet 3/2 {<b, b'>4-> <c c'>-> <cis cis'>->} |
  <d d'>4-> q <e e'> q | <cis cis'> <<{cis'8 <e gis>}\\{<cis, cis'>4}>> <fis cis' fis> <e e'>16 cis' f fis |
  <b, b'>8-> q-> r fis <b, b'>8-> q-> r4 | <e e'>1 | <e e'>2 ~ q8 r <cis cis'>4-> |

  \key fis \major
  <<{r8 fis'( b ais gis8) gis, s4 | r8 cis eis ais, r ais eis' fis}\\{<b,, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2 <dis dis'>}>>
  <<{r8 dis' <fis b>4 r8 eis <gis b>4 | r8 cis, gis' cis,}\\{<gis, gis'>2 <cis cis'> | <fis fis'>}>> <fis, fis'>8-> q-> q-> r |
  <<{r8 fis''( b ais gis8) gis, s4 | r8 cis eis ais,}\\{<b, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2}>> <<{r8 ais' gis' fis}\\{dis,2}\\{\voiceFour s4 <ais' cis>}>>
  <b, b'>2 <cis cis'> | <<{r8 cis' gis' cis,}\\{fis,2}>> <fis cis' ais'>\arpeggio

  \key aes \major
  <<{
    r8 ees' aes des <ees, aes c>8 r16 q ~ q4 | r8 f aes d <d, f bes>8 r16 <d f aes>16 ~ q4 | r8 f aes des <des, f bes>8 r16 q ~ q8 aes' |
  }\\{
    <aes,, aes'>2. ~ q8 aes16 aes' | <aes, aes'>2. ~ q8 aes16 aes' | <aes, aes'>2. ~ q8 <aes' aes'> |
  }>>

  <<{r8 bes des f aes bes des aes'}\\{<ees,, ees'>1}\\{\voiceFour s2 <ees' f aes>}>> | r2 r8 <ees, ees'>8-> q4-> |

  aes4 ees' ~ ees8 ees ees, ees' | aes,4 ees' ~ ees8 ees ees, ees' | aes,4 ges' ~ ges8 ees ees, ees' | des4 aes8 <des, des'>8 ~ q aes''([ des, aes)] |

  des,4 aes'8 des8 ~ des des, des' aes | c,4 aes'8 <c ees aes> ~ q <<{c( des aes')}\\{aes,4.}>> |
  <<{c'8( bes) bes( aes) aes( g) g( aes)}\\{f2 f}\\{\tweak X-offset #-1 bes,1}>> | ees4 ees8 ees,-> r4 <<{ees'4->}\\{ees8 ees,}>> |

  aes8 ees' bes' <ees, aes c> ~ q ees ees, ees' | aes, ees' g <ees aes c> ~ q ees ees, ees' |
  aes, ges' bes <aes, ges'> ~ q <ees' c'> aes aes, | des,8 des' aes8 <des, des'> ~ q f' <aes, des> f |
  des aes' des <fes aes> ~ q aes, des des, | <<{r aes' c ees r c ees aes}\\{<c,, c'>2 <f f'>}>> |
  <<{r8 f bes des r bes ees g}\\{<bes,, bes'>2 <ees ees'>}>> | <<{\voiceOne r8 ees' g ees \shape #'((0 . 0.0) (0 . 0.0) (0 . -10.0) (0 . -7.2)) PhrasingSlur aes\( bes ces des}\new Voice{\voiceTwo s2 <c, ees>}\new Voice{<aes, aes'>1}>>

  \key b \major
  <<{\voiceOne dis''4 cis \rh \oneVoice  b cis8 dis ~}\new Voice{<e, gis b>2 <fis, cis' fis>}>> | <<{dis''8 fis gis <dis cis'> <fis b>4\)}\new Voice{\lh \voiceOne <fis, ais>8 b ais fis dis2}\new Voice{\lh \voiceTwo <dis, dis'>2 <gis dis'>}>>
  \lh \oneVoice <e e'>2 <fis fis'> | <b, b'>4. fis'8 \tuplet 3/2 {<b, b'>4-> <c c'>-> <cis cis'>->} |
  <d d'>4-> q <e e'> q | <cis cis'> <<{cis'8 <e gis>}\\{<cis, cis'>4}>> <fis cis' fis> <e e'>16 cis' f fis |
  <b, b'>8-> q-> r fis <b, b'>8-> q-> r4 | <e e'>1 | <e e'>2 ~ q8 r <cis cis'>4-> |

  \key fis \major
  <<{r8 fis'( b ais gis8) gis, s4 | r8 cis eis ais, r ais eis' fis}\\{<b,, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2 <dis dis'>}>>
  <<{r8 dis' <fis b>4 r8 eis <gis b>4 | r8 cis, gis' cis,}\\{<gis, gis'>2 <cis cis'> | <fis fis'>}>> <fis, fis'>8-> q-> q-> r |
  <<{r8 fis''( b ais gis8) gis, s4 | r8 cis eis ais,}\\{<b, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2}>> <<{r8 ais' gis' fis}\\{dis,2}\\{\voiceFour s4 <ais' cis>}>>
  <b, b'>2 <cis cis'> | <<{r8 cis' gis' fis r4 fis8 fis,}\\{fis2 <fis cis' e gis>->\arpeggio}>> |

  \key fis \major
  <<{r8 fis'( b ais gis8) gis, s4 | r8 cis eis ais, r ais eis' fis}\\{<b,, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2 <dis dis'>}>>
  <<{r8 dis' <fis b>4 r8 eis <gisis b>4 | r8 cis, gis' cis,}\\{<gis, gis'>2 <cis cis'> | <fis fis'>}>> <fis, fis'>8-> q-> q-> r |
  <<{r8 fis''( b ais gis8) gis, s4 | r8 cis gis'( fis eis fis gis cis)}\\{<b,, b'>2 <cis' gis'>4 \oneVoice <b, b'>8-> <ais ais'>-> ~ | \voiceTwo q2 <dis ais'>}>>
  <b b'>2 <cis cis'> | <<{r8 ais''16[ b c cis] r8 ais16 b c cis r4}\\{<fis,, fis'>1->}>>

  <dis dis'>1 | <gis, gis'> | <cis cis'> | <fis, fis'> |
  <<{r8 dis' ais' eis' \mergeDifferentlyHeadedOn fisis \mergeDifferentlyHeadedOff dis ais' dis}\\{<dis,,, dis'>1}\\\\{s2 <dis'' fisis>}>> | <<{r8 dis ais' cis}\\{<gis, gis'>2}>> <gis' b>4 <dis, dis'> |
  <<{\mergeDifferentlyDottedOn cis8 gis' dis' gis, eis' b cis fis | gis <gis, eis'> cis gis cis gis' eis <gis cis> | <d, d'> a' d <d fis> a' d <a d fis> d, \mergeDifferentlyDottedOff}\\{cis,4.-> gis'8-> ~ gis4 cis-> ~ | cis8 gis4.-> cis4-> eis-> | <d, d'>4.-> <d' fis>8-> ~ q4 <a' d fis>->}>> | <cis, gis'>4-> <cis, gis' cis>-> cis'8. eis16 ~ eis8 gis |

  <d, d'>4. <<{s8 \voiceTwo r8 \clef treble \oneVoice e''( d a'}\new Voice{<d,, a'>8 ~ q2}>> \oneVoice | <d' a' cis>4)\arpeggio \clef bass d8( a d,4) d, |
  <<{\mergeDifferentlyDottedOn \voiceOne cis8[( \mergeDifferentlyDottedOff gis' cis])}\new Voice{\voiceTwo cis,4.}>> \oneVoice <cis' gis' cis>8 ~ q4. <cis' e>8 ~ | <<{\voiceOne q2. r4}\new Voice{\voiceTwo r4 \slurUp cis,8( gis' \stemUp e' \rh \stemDown b' a gis)}>> \slurNeutral \lh \oneVoice \stemNeutral |
  <b,,, b'>4. <b' fis'>8 ~ q2 | <b, fis'>2. \voiceTwo r4 \oneVoice |
  e8[( b' e]) <e b'>8 ~ q4 b8 <e, b' e> ~ | q2 ~ q8 <cis' gis' eis'>4.--\arpeggio |
  <b, b'>4. b'8 <cis cis'>4 <b b'>8 <ais ais'> ~ | <<{\voiceTwo q2 <dis dis'>}\new Voice{\rh \voiceTwo r8 cis'_\markup{\italic "m.g."} <eis ais>4 \lh \voiceOne r8 ais, fis' cis}>> |
  <gis, gis'>4^- <dis' ais' b>^- <cis gis'>^- <cis, cis'>^- | <<{\voiceOne fis'4 e}\new Voice{\voiceTwo fis,2}>> \oneVoice <fis cis' gis'>2\arpeggio |
  <<{b4. b8}\\{b,2}>> <cis cis'>4 <b b'>8 <ais ais'> ~ | <<{\voiceTwo q2 <dis dis'>}\new Voice{\voiceOne r8 cis' <eis ais>4 r8 ais, fis' cis}>> |
  <b, b'>2 <cis cis'> | <<{\mergeDifferentlyHeadedOn fis8 \mergeDifferentlyHeadedOff cis' fis cis g d' a'-- g--}\\{fis,2 <g, g'>4 <b' d>--}>>
  \key g \major
  <<{r8 g'( c b a8) a, s4 | r8 fis' a g fis g d b}\\{<c, c'>2 <d' a'>4 \oneVoice <c, c'>8-> <b b'>-> ~ | \voiceTwo q2 <e b'>}>>
  <<{r8 e' <g c>4 r8 fis <ais c d>4 }\\{<a,, a'>2 <d d'> }>> <g g'>8-> <fis fis'>-> <f f'>-> <e e'>-> ~ q <e, e'>->-- ~ q16 <b' b'>8.->-- |
  <<{r8 g''( c b a8) a, s4 | r8 d a'( g fis g a d)}\\{<a,, a'>2-> <d' a'>4 \oneVoice <c, c'>8-> <b b'>-> ~ | \voiceTwo q2 <e b'>}>>
  <c c'>2 <d d'> | <<{r8 d' a' d,}\\{g,2}>> <g d' b'>\arpeggio

  \key a \major
  <<{
    r4 r8 <b' cis e> ~ q4 <a b cis e> | r4 r8 <b dis fis> ~ q4 <a b dis fis> | r4 r8 <b d fis> ~ q4 <a b d fis> |
  }\\{
    <a, a'>1 | q | q |
  }>>
  r8 <e e'>8 q4 q8. q16 ~ q8 e'16 e, |

  <<{
    r8 e' a d <e, a cis>8 r16 q ~ q4 | r8 fis a dis <dis, fis b>8 r16 <dis fis a>16 ~ q4 | r8 fis a d <d, fis b>8 r16 q ~ q8 a' |
  }\\{
    <a,, a'>2. ~ q8 a16 a' | <a, a'>2. ~ q8 a16 a' | <a, a'>2. ~ q8 <a' a'> |
  }>>

  <<{r8 b d fis a b d a'}\\{<e,, e'>1}\\{\voiceFour s2 <e' fis a>}>> | r2 \voiceTwo r8 <e,, e'>8-> q4-> |
  <<{
    \override NoteHead.font-size = #-2
    \override Accidental.font-size = #-2
    \set tieWaitForNote = ##t
    \omit TupletNumber
    \stemUp \tuplet 10/8 {a'32[ ~ e' ~ b' ~] s32*7} s2. |
    \revert NoteHead.font-size
    \revert Accidental.font-size
    \hideNotes <a, e' b'>1
    }\\{<a, a'>1-> ~ | \hideNotes q}
    \\{
    \shape #'((-2 . 2.0) (0 . 10.0) (-2 . 2.0) (-1.5 . 0.0)) Slur
    \hideNotes a'1*1/4 ( \rh e''''1*1/4)
  }>>
}
pianodyn = {
  \override DynamicTextSpanner.style = #'none
  s1*4 s8 s\p\< s2.
  s1\mp s1*2 s1\<
  s1\mf s1*2 s1\< s2 s\!
  s1\mf s1*3
  s1*2 s1\< s1\!
  s1*4
  s1*3 s1\<
  \once \override DynamicText.Y-offset = -3 s4\f \once \override DynamicText.Y-offset = -3 s\mp s2 s1*2 s2 s\<
  s1\cresc s2. s4\< s1\! s\< s\!
  s1\f s1*2 s2\< s\!
  s2. s4\> s1 s\mf s2\> s\! |
  s1\mf s1*2 s1\< s2 s\!
  s1\mf s1*3
  s1*2 s1\< s\!
  s1*4
  s1*3 s1\<
  \once \override DynamicText.Y-offset = -3 s4\f\once \override DynamicText.Y-offset = -3 s\mp s2 s1*2 s2 s\<
  s1\cresc s2. s4\< s1\! s\< s\!
  s1\f s1*2 s2\< s\!
  s1*3 s2 s\<
  s1\ff s1*2 s2\< s2\!
  s2. s4\> s1 s\mf s
  s\mp s1*2 s2 s8 s4.\<
  s1\mf s s\cresc s s\< s2\ff s\mp
  s1-\markup{\italic "dolce"} s1*3
  s1*2 s1\< s2 s8 s4.-\markup{\italic "sub."}\mp
  s1\p s1*2 s1\<
  s1\! s1*2 s1\<
  s1\f s s\cresc s2\< s-\markup{\italic "molto"}
  s2.\ff s4\sfz s1*3
  s1\mf s1*3
  s1*3 s1\< s2 s\!
  \once \override DynamicText.Y-offset = -2
  s1\fp\> s\!
}

\book{
  \score{
    <<
      \new Staff = "SoloWrap" \with {
        %\override Clef.stencil = ##f
        %override KeySignature.stencil = ##f
        %\override TimeSignature.stencil = ##f
        \override VerticalAxisGroup.remove-first = ##t
        \override VerticalAxisGroup.remove-empty = ##t
      }{
        \stopStaff s1*111
        \startStaff
        \new Staff = "Solo" \with {
          alignAboveContext = "SoloWrap"
          \override TimeSignature.stencil = ##f
        } {
          \set Staff.midiInstrument = "flute"
          \new Voice = "SoloVoice" \relative c''{
            \key fis \major
            r2^\markup {\bold Solo} r4 dis8\mp cis ~ | cis cis b b ais ais gis fis | b b ais ais gis gis fis8 fis | ais b c cis ~ cis4 r |
            r2 r4 dis8 cis ~ | cis cis b b ais ais gis fis | ais b c cis ais fis gis fis ~ | fis2^\markup {\italic "accel."} r2 \stopStaff |
          }
        }
      }
      \new Lyrics \lyricsto "SoloVoice" {
        \im
        ど よ ー う び ゆ う え ん ち い ち ね ん た っ た ら ハ ネ ム ー ーン
        ロ マ ー ン ス の か み さ ま か ん しゃ し て い ま す ー
      }
      \new ChoirStaff = "ChoirGroup" <<
        \new Lyrics = "LyricsSopranoDiv"
        \new Staff = "Soprano" <<
          \set Staff.instrumentName = "Sop."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceSoprano" \soprano
        >>
        \new Lyrics = "LyricsSoprano"

        \new Lyrics = "LyricsAltoDiv"
        \new Staff = "Alto" <<
          \set Staff.instrumentName = "Alt."
          \set Staff.midiInstrument = "flute"
          \clef treble
          \new Voice = "VoiceAlto" \alto
        >>
        \new Lyrics = "LyricsAlto"

        \new Lyrics = "LyricsTenorDiv"
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
        \context Lyrics = "LyricsSopranoDiv" {
          \lyricsto "VoiceSopranoDiv" {
            \sopranodivlyric
          }
        }
        \context Lyrics = "LyricsAlto" {
          \lyricsto "VoiceAlto" {
            \altolyric
          }
        }
        \context Lyrics = "LyricsAltoDiv" {
          \lyricsto "VoiceAltoDiv" {
            \altodivlyric
          }
        }
        \context Lyrics = "LyricsTenor" {
          \lyricsto "VoiceTenor" {
            \tenorlyric
          }
        }
        \context Lyrics = "LyricsTenorDiv" {
          \lyricsto "VoiceTenorDiv" {
            \tenordivlyric
          }
        }
        \context Lyrics = "LyricsBass" {
          \lyricsto "VoiceBass" {
            \basslyric
          }
        }
      >>

      \new PianoStaff = "Piano" \with {
        fontSize = #-1
        \override StaffSymbol #'staff-space = #(magstep -1)
      }<<
        \set PianoStaff.instrumentName = "Piano"
        \set PianoStaff.connectArpeggios = ##t
        \new Staff = "PianoRH" \pianorh
        \new Dynamics = "PianoDyn" \pianodyn
        \new Staff = "PianoLH" \pianolh
      >>
    >>
    \layout {
      \context{
        \Lyrics
        \override LyricText #'font-name = "TakaoEx明朝"
        \override LyricText #'font-size = #-1
      }
      \context {
        \Staff
        \override DynamicTextSpanner.style = #'none
      }
    }
    \midi {}
  }
}