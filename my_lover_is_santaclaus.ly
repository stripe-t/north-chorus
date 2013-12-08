% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.16.0"
\include "articulate.ly"


% The below, invented by Mats Bengtsson, creates left and right brackets vertically 
% spanning an entire staff. It is useful for offseting optional passages of music,
% as shown in the example

% The number next to "th" in (th 0.2) controls thickness of the brackets. 
#(define-markup-command (left-bracket layout props) ()
	 "Draw left hand bracket"
	 (let* ((th 0.2) ;; todo: take from GROB
			(width (* 2.5 th)) ;; todo: take from GROB
			(ext '(-2.8 . 2.8))) ;; todo: take line-count into account
		 (ly:bracket Y ext th width)))

leftBracket = {
	\once\override BreathingSign #'text = #(make-left-bracket-markup)
	\once\override BreathingSign #'break-visibility = #end-of-line-invisible
	\once\override BreathingSign #'Y-offset = ##f
	% Trick to print it after barlines and signatures:
	\once\override BreathingSign #'break-align-symbol = #'custos
	\breathe
}


#(define-markup-command (right-bracket layout props) ()
	 "Draw right hand bracket"
	 (let* ((th .2);;todo: take from GROB
			(width (* 2.5 th)) ;; todo: take from GROB
			(ext '(-2.8 . 2.8))) ;; todo: take line-count into account
		 (ly:bracket Y ext th (- width))))

rightBracket = {
	\once\override BreathingSign #'text = #(make-right-bracket-markup)
	\once\override BreathingSign #'Y-offset = ##f
	\breathe
}

\paper {
	page-count = #4
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 4"
				"2013/12/9"
			}
			\fill-line {
				\override #'(font-name . "IPAex明朝")
				\fontsize #5 "恋人がサンタクロース"
			}
			\fill-line {
				\null
				"Original by Yumi Matsutoya"
			}
			\fill-line {
				\null
				"Arranged by Tomohiro Tatejima, Sakumi Sugawara"
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
				\left-column {"This score is open-source." "The latest revision is available at : https://github.com/stripe-t/north-chorus/releases"}
				\right-column {"LilyPond - Music Notation for Everyone" #(string-append "Version " (lilypond-version) ", See www.lilypond.org")}
			}
		}
	}

	evenFooterMarkup = \oddFooterMarkup
}

chord = \chordmode {
	\set majorSevenSymbol = \markup { maj7 }
	\tempo 4=100
	d1:maj7 | s | a:maj9/cis | b:m7 |
	%a4 e fis:m9 a8:maj9/e b:m | s4 a:maj9/cis e:11/d cis8:7 fis:m |
	a | b2:m7 cis:m7 \bar "||"
	\tempo 4=150
	fis2..:m e8 | s d2..:maj7 | fis2..:m e8 | s d2..:maj7 |
	fis2..:m e8 | s d2..:maj7 | b4. cis4.:m d4 | s8 e s2. |
	%d1 | s | e | s |
	%d | s | e | s |
	%cis:m | fis:m | cis:m | fis:m |
	%b:m | d | g | e |
	d1 | s | e | s |
	d | s | e | s |
	cis:m | fis:m | cis:m | fis:m |
	b:m | g | cis | s |
	d | s | a/cis | b:m7 |
	a | b/a | gis:m | cis:7 |
	d | s | a/cis | b:m7 |
	a | b2:m7 cis:m7 | fis1:m | e2 a |
	d1:maj7 | e | a2 e/gis | g/d \set Score.tempoHideNote = ##t \tempo 4=125 fis:7/cis \bar "||"
	\unset Score.tempoHideNote \tempo 4=100 d1 | e | a:maj7 \bar "|."
}

fA = \relative c' {
	\key a \major
	cis'1^\markup {\italic"Freely"}( ~ | cis | b | a) |
	\leftBracket cis,4 e gis a8 b ~ | b4 a gis a8 a ~ |
	a4^\markup {\italic"Actively"} \rightBracket r r2 | R1 | a2. ~ a8 gis ~ | gis fis fis2. |
	r4 cis8 b b cis r4 | R1 | R1 | r8 e' r4 e8 e r d->-. |
	%R1 | R1 | r2 e'8-. e-. r4 | r2 e8-. e-. r4 |
	%R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	%R1 | R1 | R1 | R1 |
	%R1 | R1 | R1 | r4 e ~ e4. d8->-. |
	R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	cis4. cis8 ~ cis e gis-. fis ~ | fis4 r r2 | cis4. cis8 ~ cis e gis-. fis ~ | fis4 r r2 |
	R1 | b,4. d8 ~ d4  fis | f2. r8 cis ~ | cis cis dis e f4-. r |
	r4 \leftBracket a,8 a a a a a ~ | a gis fis4 r2 | r4 a8 a a a a a ~ | a e d4 r2 |
	cis4 e gis a8 b ~ | b4 a gis a8 b ~ | b4. b8 ~ b2 \rightBracket | R1 |
	fis'1 ~ | fis2 ~ fis8 e d cis ~ | cis2 cis8 b cis d ~ | d2 \times 2/3 { fis4 b, d } |
	cis2. ~ cis8 gis' ~ | gis4 fis eis4. fis8 ~ | fis1( | e) |
	cis1( | b) | cis4.^\markup {\italic"Bring to climax"} b8 ~ b4. b8 ~ | b4. cis8 ~ cis2^\markup {\italic"rit."} |
	d1\(^\markup {\italic"Slow, softly"} | e | e\)\fermata^\markup {\italic"Brilliantly"} |
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key a \major
	fis1( ~ | fis | e | d) |
	cis4 e e e8 fis ~ | fis4 e e f8 e |
	r4 cis'8 b b cis r4 | R1 | r4 cis8 b b cis r4 | R1 |
	a2. ~ a8 gis ~ | gis fis fis2. | R1 | r8 b r4 b8 b r a->-. |
	%R1 | R1 | R1 | R1 |
	%R1 | R1 | R1 | r2 r4 cis8 e |
	%e4 r r2 | fis4 gis8 fis ~ fis e cis e | e4 r r2  | fis4 gis8 fis ~ fis e cis e |
	%b2. r4 | cis4 b a8 b4 b8 ~ | b2 r2 | r4 r8 d' ~ d4. d8->-. |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | R1 |
	cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 | cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 |
	b,8 b d b fis' r r4 | b,8 b d b g' r r4 | r2 r4 r8 cis, ~ | cis cis dis e f4-. r |
	r4 d8 d d d d d ~ | d cis b4 r2 | r4 cis8 cis cis cis cis cis ~ | cis b a4 r4 gis8( a) |
	a4 cis e cis8 dis ~ | dis4 cis b cis8 dis ~ | dis4. dis8 ~ dis2 | R1 |
	R1 | r4 r8 e a e b' a ~ | a4 r r2 | r4 r8 cis ~ cis a e d |
	\leftBracket cis4 e gis a8 b ~ | b4 a gis a8 a ~ | a1( \rightBracket | gis2 a) |
	\leftBracket cis,4 e gis a8 b ~ | b4 a gis a8 a ~ | a8 e a b ~ b e, b' b ~ | b g b cis ~ cis2 \rightBracket |
	cis2\(( b) | a( gis) | gis1\)\fermata
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key a \major
	r4 \leftBracket a'8 a a a a a ~ | a gis fis4 r2 | r4 a8 a a a a a ~ | a e d4 \rightBracket r2 |
	cis4 cis cis cis8 d ~ | d4 cis e8( d) cis e ~ |
	e2. ~ e8 e8 ~ | e d d2. | e2. ~ e8 e8 ~ | e d d2. |
	e2. ~ e8 e8 ~ | e d d2. | b8 b r cis cis r d d | r e r4 e8 e r d->-. |
	%R1 | R1 | R1 | R1 |
	%R1 | R1 | R1 | R1 |
	%cis8-. cis-. e-. cis-. gis'-. r r4 | R1 | cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 |
	%b,8 b d b fis' r r4 | a,8 a d a fis' r r4 | b,8 b d b g' r g e ~ | e r r4 b'4. a8->-. |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r2 r4 \leftBracket cis8 e |
	e4 r r2 | fis4 gis8 fis ~ fis e cis e | e4 r r2  | fis4 gis8 fis ~ fis e cis e |
	b2. r4 | cis4 b a8 b4 cis8 ~ | cis2. \rightBracket r4 | R1 |
	R1 | r4 r8 e a e b' a ~ | a4 r r2 | r4 r8 cis ~ cis a e d |
	cis4 r r2 | R1 | r2 r4 r8 cis' ~ | cis cis dis e f4-. r |
	%fis,8( fis-.) r fis8( fis-.) r fis8( fis-.) | r fis8( fis-.) r fis8( fis-.) r e( ~ | e e-.) r e e r e e | r d d r d e b d |
	r4 fis,8 fis fis fis fis fis ~ | fis e d4 d8 e d cis ~ | cis4 e8 e e e e e ~ | e d d4 r2 |
	cis4 e e fis8 gis ~ | gis4 fis eis eis8 fis ~ | fis4 \leftBracket cis'8 b b cis r4 | r4 cis8 b b cis \rightBracket r4 |
	a1( | e) | a,4. b8 ~ b4. b8 ~ | b4. ais8 ~ ais2 |
	a'1\( b | cis\)\fermata
}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key a \major
	r4 d8 d d d d d ~ | d cis b4 r2 | r4 cis8 cis cis cis cis cis ~ | cis b a4 r4 gis8( a) |
	a4 cis cis b8 b ~ | b4 b b b8 cis ~ |
	cis2. ~ cis8 gis8 ~ | gis a a2. | cis2. ~ cis8 gis8 ~ | gis a a2. |
	\leftBracket b8 cis fis b, cis fis b, cis | fis b, cis fis b, cis fis b, \rightBracket | cis fis b, cis fis b, cis fis | r a r4 a8 a r fis->-. |
	%r8 d d d fis fis e e | d cis b a b cis4 b8 ~ | b4. gis16 fis e2 ~ | e4 r4 r2 |
	%r8 d' d d fis fis e e | d cis b a b cis8 r b8 ~ | b4 r r2 | R1 |
	%R1 | R1 | R1 | R1 |
	%R1 | R1 | R1 | r2 r8 a'4 d8->-. |
	R1 | R1 | e8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	R1 | R1 | e8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 r cis8 e |
	cis4 r r2 | cis4 e8 fis ~ fis e cis e | cis4 r r2 | cis4 e8 fis ~ fis e cis e |
	b2. r4 | g4 g a8 b4 cis8 ~ | cis2. r4 | R1 |
	R1 | r4 r8 e ~ e e d cis ~ | cis4 r r2 | r2 b8 cis d b( |
	cis4) r r2 | R1 | r2 r4 r8 cis ~ | cis cis dis e f4-. r |
	r4 d8 d d d d d ~ | d cis b4 r2 | r4 cis8 cis cis cis cis cis ~ | cis b a4 r4 gis8( a) |
	a4 cis e cis8 d ~ | d4 cis b cis8 cis ~ | cis1( | e) |
	a,4 cis e fis8 gis ~ | gis4 fis e d8 cis ~ | cis4. gis8 ~ gis4. g'8 ~ | g4. fis8 ~ fis2 |
	d1\( | e | e\)\fermata
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\key a \major
	a'1( ~ | a | gis | fis) |
	a4 gis a a8 fis ~ | fis4 a a gis8 \leftBracket b |
	cis fis b, cis fis b, cis fis | b, cis fis b, cis fis b, cis | fis b, cis fis b, cis fis b, | cis fis b, cis fis b, cis fis \rightBracket |
	cis2. ~ cis8 gis8 ~ | gis a a2. | fis8 fis r gis gis r a a | r b r4 b8 b r a->-. |
	%R1 | R1 | e'8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	%R1 | R1 | e8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	%R1 | R1 | R1 | R1 |
	%R1 | R1 | R1 | r2 r4 b8 a->-. |
	r8 \leftBracket d d d fis fis e e | d cis b a b cis4 b8 ~ | b4. gis16 fis e2 ~ | e4 r4 r2 |
	r8 d' d d fis fis e e | d cis b a b cis8 r b8 ~ | b4 \rightBracket r r2 | R1 |
	R1 | R1 | R1 | R1 |
	fis1( | g | gis2. ~ gis8) gis ~ | gis gis r gis cis4-. r |
	r4 fis,8 fis fis fis fis fis ~ | fis e fis4 r2 | r4 e8 e e e e e ~ | e e b'4 r2 |
	a1( | b2. a4 | gis4.) gis8 ~ gis dis' fis eis ~ | eis4. gis8 ~ gis4 r |
	r4 \leftBracket a,8 a a a a a ~ | a gis fis4 r2 | r4 a8 a a a a a ~ | a e d4 \rightBracket r2 |
	\leftBracket cis4 e gis a8 b ~ | b4 a gis a8 a ~ | a1( \rightBracket | b2 a) |
	a1( | b) | e,4. e8 ~ e4. \leftBracket d'8 ~ | d4. cis8 ~ cis d e4 \rightBracket |
	fis,1\( | b | a\)\fermata
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key a \major
	d1( ~ | d | cis | b) |
	a'4 gis fis e8 b ~ | b4 cis d cis8 fis ~ |
	fis2. ~ fis8 e ~ | e d d2. | fis2. ~ fis8 e ~ | e d d2. |
	fis2. ~ fis8 e ~ | e d d2. | b8 b r cis cis r d d | r e r4 e8 e r d |
	%d4-. d-. d-. d-. | d d d d | e e e e | e4 e e8 e e e |
	%d4 d d d | d d d d | e e e e | e4 e e8 e e16 e e e |
	%cis4. cis8 cis4 r | fis,4 cis'8 fis ~ fis fis cis fis | cis4. cis8 cis4 r | fis,4 cis'8 fis ~ fis fis cis fis |
	%b,4. b8 b4 r | d4. d8 d4 r | g,4 g8 d' g fis f e ~ | e e e e e e e d |
	r4 d d d | d d d d | e e e e | e4 e e8 e e e |
	d4 d d d | d d d d | e e e e | e4 e e8 e e16 e e e |
	cis4. gis'8 ~ gis4 cis, | fis,4 cis'8 fis ~ fis fis cis fis | cis4. gis'8 ~ gis4 cis, | fis,4 cis'8 fis ~ fis fis cis fis |
	b,4. fis'8 ~ fis4 b, | g4. d'8 g d g, cis ~ | cis4. cis8 ~ cis8 cis cis cis ~ | cis cis dis e f cis e d ~ |
	d d d4 d d | d d d8 a' d,-. cis ~ | cis4 cis cis cis | b b b8 fis' b, d |
	a4 a a a | a a a8 b a gis ~ | gis4 gis gis gis8-. cis ~ | cis cis dis e f cis e d ~ |
	d d d( a-.) d( a-.) d( a-.) | d a d a e' a, d a | cis a cis a cis d cis b ~ | b b fis b b fis' b, d |
	a4 a a a | b2 cis | fis1( | e2 a4) a,8 e' |
	d1( | e) | a,4. gis8 ~ gis4. d'8 ~ | d4. cis8 ~ cis2 |
	b1\( | e | a,\)\fermata
}
mBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

\book{
	\score {
		<<
			\new ChordNames {
				\set ChordNames.midiMaximumVolume = #0.0
				\set ChordNames.midiMinimumVolume = #0.0
				\chord
			}
			\new ChoirStaff <<
				\new Staff = "Female1" <<
					\set Staff.instrumentName = "Female I"
					\set Staff.midiInstrument = "flute"
					\clef treble
					\new Voice = "VoiceFemale1" \fA
				>>
				\new Lyrics = "LyricsFemale1"

				\new Staff = "Female2" <<
					\set Staff.instrumentName = "Female II"
					\set Staff.midiInstrument = "flute"
					\clef treble
					\new Voice = "VoiceFemale2" \fB
				>>
				\new Lyrics = "LyricsFemale2"

				\new Staff = "Female3" <<
					\set Staff.instrumentName = "Female III"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale3" \fC
				>>
				\new Lyrics = "LyricsFemale3"

				\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female IV"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				\new Lyrics = "LyricsFemale4"

				\new Staff = "Male1" <<
					\set Staff.instrumentName = "Male"
					\set Staff.midiInstrument = "oboe"
					\clef "treble_8"
					\new Voice = "VoiceMale1" \mA
				>>
				\new Lyrics = "LyricsMale1"

				\new Staff = "Male2" <<
					\set Staff.instrumentName = "Bass"
					\set Staff.midiInstrument = "bassoon"
					\clef "bass"
					\new Voice = "VoiceMale2" \mB
				>>
				\new Lyrics = "LyricsMale2"

				\context Lyrics = "LyricsFemale1" {
					\lyricsto "VoiceFemale1" {
						\fAlyric
					}
				}
				\context Lyrics = "LyricsFemale2" {
					\lyricsto "VoiceFemale2" {
						\fBlyric
					}
				}
				\context Lyrics = "LyricsFemale3" {
					\lyricsto "VoiceFemale3" {
						\fClyric
					}
				}
				\context Lyrics = "LyricsFemale4" {
					\lyricsto "VoiceFemale4" {
						\fDlyric
					}
				}
				\context Lyrics = "LyricsMale1" {
					\lyricsto "VoiceMale1" {
						\mAlyric
					}
				}
				\context Lyrics = "LyricsMale2" {
					\lyricsto "VoiceMale2" {
						\mBlyric
					}
				}
			>>
		>>
		\layout {}
		\midi {}
	}
}