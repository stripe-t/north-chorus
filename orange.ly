% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.18.0"
\include "articulate.ly"

perc = #(define-music-function
         (parser location note)
         (ly:music?)
         #{
         	\new DrumVoice \with {\consists "Staff_performer"} {
         		\clef percussion
         		\set DrumVoice.midiInstrument = "standard kit"
         		#note
         	}
         	\clef "treble_8"
         	\set Voice.midiInstrument = "oboe"
         #})

#(define-markup-command (annotation layout props text) (markup?)
  "Annotation"
  (interpret-markup layout props
    #{
    	\markup { \override #'(font-name . "IPAex明朝") #text }
    #}))


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
	% page-count = #4
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1 (WIP)"
				"2014/1/17"
			}
			\fill-line {
				\override #'(font-name . "IPAex明朝")
				\fontsize #5 "オレンジ"
			}
			\fill-line {
				\null
				"Original by GReeeeN"
			}
			\fill-line {
				\null
				"Arranged by Tomohiro Tatejima, Ayu Terada"
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
	\override ChordName #'font-size = #0
	\set majorSevenSymbol = \markup { maj7 }
	\set Score.markFormatter = #format-mark-box-alphabet
	\mark \markup{\bold \box C}
	\tempo 4=91
	\partial 4*1
	s4 |
	e2:m7 fis:m | g a | g1 | d |

	\bar "||"
	\mark \markup{\bold \box A}
	\tempo 4=182
	d1 | g | a | fis:7/ais |
	b:m | e1 %{e4 e/fis e/gis e/d%} | g1 | a |
	
	\bar "||"
	\mark \markup{\bold \box B}
	b:m | fis:m | g2 a | d2. d4/cis |
	b1:m | fis:m | g | e:7/gis |
	a | fis:7/ais |
	
	\bar "||"
	\mark \markup{\bold \box M}
	e | a | b2 b/a | gis1:m7 |
	cis:m | gis:m %{e/gis%} | a | b |
	e/gis | a | b | gis:7/bis |
	cis:m | fis %{fis:m%} | a | s |
	c | b |
	s | s |	% TODO: うまくつなげる
	
	\bar "||"
	\mark \markup{\bold \box C'}
	g | a | d/fis | b2:m b:m/a |
	g1 | a | d | fis2 d/fis %{fis1%} |
	g1 | a | fis:7/ais | b2:m d/a |
	e1:m7 | fis:m | g | a |
	b |
	
	\bar "||"
	\mark \markup{\bold \box M'}
	e | a | b2 b/a | gis1:m7 |
	cis:m | gis:m %{e/gis%} | a | b |
	e/gis | a | b | gis:7/bis |
	cis:m | fis %{fis:m%} | a | s |
	c | b | e | s |
	
	\bar "|."
	\mark \markup { \musicglyph #"scripts.ufermata" }
}

fA = \relative c' {
	\key d \major
	\partial 4*1
	%\dynamicUp
	% C
	d8\mp^\markup \annotation {"しっとり歌い上げる"} fis |
	e16 d r a d8 fis e16 d r a d8 a' | \acciaccatura d, e4 r8 fis16 fis e8 d cis d | d1 | R1 |
	
	% A
	r4^\markup \annotation {"ノリノリで"} fis8 fis fis a, d fis | fis4 g8 e ~ e d4 d8( | e4) e8 e e b d fis | g4 a8 e ~ e %{fis~fis ?%} e4 e8( |
	d4) d8 d d cis d e | fis4 e8 d e4 b8 cis | d4 e fis g | a e8 e e2 |
	
	% B
	R1 | R | R | R |
	R | r4 fis, fis a | b2. r8 fis | b4 b8 b ~ b cis d4 |
	e4. cis8 cis4 r | fis g8 fis ~ fis e e4 |
	
	% M
	\key e \major
	e4 b8 b b e e e( | fis4) r8 b, b fis' fis fis( | gis4) r8 gis gis gis b a ~ | a gis fis e dis e fis fis( |
	e4) r8 b b e e e( | fis4) r8 b, b fis' fis fis( | gis4) r8 e e e e dis ~ | dis e fis gis a4 fis8 e |
	e4 r8 b b e e e( | fis4) r8 b, b fis' fis fis( | gis4) r8 gis gis gis b b( | c) gis fis e dis e fis e |
	e4 r8 b e e dis e | dis4 dis8 cis b4 b8 b | cis4. gis'8 gis2 ~ | gis r4 b, |
	\acciaccatura b8 c4. gis'8 gis4. gis8 | fis4 r8 b, a' gis e fis | fis4. e8 e2 | r4 d cis a |
	
	% C'
	\key d \major
	b g fis' e8( fis | e2) r4 a,8 a | fis'4 g fis e8( d) | d4 r d fis |
	e8 d r4 d fis | e8 d r4 r a | d a d e | fis d e fis |
	fis fis \acciaccatura fis8 g4 fis | e r cis e | a%{ais ?%} fis e%{ees ?%} d | fis r8 a, e' fis e d |
	d4 r8 a e' fis e d | d4 r8 a e' fis e d | d4 r fis8 g fis g | a b a4 ~ a2( |
	b1) |
	
	% M'
	\key e \major
	e,4 b8 b b e e e( | fis4) r8 b, b fis' fis fis( | gis4) r8 gis gis gis b a ~ | a gis fis e dis e fis fis( |
	e4) r8 b b e e e( | fis4) r8 b, b fis' fis fis( | gis4) r8 e e e e dis ~ | dis e fis gis a4 fis8 e |
	b'4 r8 e, e cis' \xNote cis cis( | b4) r8 e, e cis' \xNote cis cis( | b4) r8 gis gis gis b b( | c) gis fis e dis e fis e |
	gis4 r8 b, e e e e | dis4 dis8 cis b4 b8 b | cis4. gis'8 gis2 ~ | gis r4 b,8 b |
	\acciaccatura b8 c4. gis'8 gis4. gis8 | fis4 b,8 b a' gis e fis | fis4. e8 e2 ~ | e1 |
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key d \major
	\partial 4*1
	%C
	r4
	d'2\p( cis | d e | d1) | R |
	
	% A
	a4 r8 a ~ a r a4 | b4 r8 b r b4. | a4 r8 a ~ a r a4 | ais4 r8 ais  r ais4. |
	b4 r8 b ~ b r b4 | gis r8 a ~ a r gis8 a | b4 cis d e | d cis8 b cis2 |
	
	% B
	d4. d8 ~ d e d cis ~ | cis4 cis b cis | d4. d8 ~ d e g fis ~ | fis4 fis e cis |
	d4. d8 ~ d e b a ~ | a4 r a8 b cis d ~ | d1 | d4. d8 ~ d4 fis | e2. r4 |
	R1 |
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key d \major
	\partial 4*1
	% C
	r4
	g'2\p( a | b a) | r8 d, e fis g a b cis | d2 r |
	
	% A
	d,4 r8 d ~ d r d4 | d4 r8 d r e4. | cis4 r8 cis ~ cis r d4 | e4 r8 e r e4. |
	fis4 r8 fis ~ fis r fis4 | e4 r8 fis ~ fis r gis8 a | g4 a b g | a g8 b a2 |
	
	% B
	d,4 e fis fis8 e ~ | e4 a, a cis | d d8 e ~ e fis d4 | r g fis e |
	d e8 fis ~ fis g fis4 | r a, a cis | d2. r8 a | d4 d8 d ~ d e fis4 |
	g4. e8 e4 r | R1 |
}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key d \major
	\partial 4*1
	% C
	r4
	d2\p( fis | g e | d2) ~ d8 fis g e | d2 r |
	
	% A
	a4 r8 a ~ a r a4 | b4 r8 b r b4. | a4 r8 a ~ a r b4 | cis4 r8 cis r cis4. |
	b4 r8 b ~ b r b4 | b4 r8 cis ~ cis r b cis | d4 e fis d | d e8 d cis2 |
	
	% B
	b4. b8 ~ b4 b ~ | b8 fis4. fis4 fis | g4. g8 ~ g4 a ~ | a8 d4. d4 cis |
	b4. b8 ~ b4 b ~ | b8 fis4. fis4 fis | g4. g8 ~ g4 g | gis4. gis8 ~ gis4 gis |
	a4. a8 a4 r | R1 |
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\key d \major
	\partial 4*1
	%C
	r4
	b'2\p( cis | d cis | b1) |
	\perc \drummode {
		bd4 bd bd8 bd bd bd
		
		% A
		bd4 bd bd bd | bd bd bd8 sn bd4 | bd bd bd bd | bd bd bd bd |
		bd bd bd bd8 sn | bd4 bd bd r | R1 | r8 sn bd sn ~ sn bd hh4 |
		
		% B
		bd2 bd | bd8 bd4 bd8 bd4 r | bd2 bd4 bd8 bd16 bd | bd8 bd4 bd8 bd8 sn bd8 bd |
		bd4. bd8 sn4 bd | bd4. bd8 sn8 bd bd bd | bd4 bd8 bd sn8 bd bd4 | bd4 bd8 sn ~ sn bd8 sn4 |
		bd4 bd8 bd sn8 sn sn sn | sn4 r r2 |
	}
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key d \major
	\partial 4*1
	% C
	r4 |
	e2\p( fis | g a | g1) | R |
	
	% A
	d4 d8 d d d d d | g,4 g8 g g g g g | a4 a8 a a a a a | ais4 ais8 ais ais ais ais ais |
	b4 b8 b b b b b | e,4 fis8 fis gis gis d' d | g,4 g g b | a a8 b cis4 fis8 e |
	
	% B
	d4 e fis d'8 cis ~ | cis4 fis, fis a | g fis8 e ~ e d a4 | r e' d cis |
	b4 cis8 d ~ d d' cis4 | r4 fis, fis a | b2. r8 fis, | b4 b8 b ~ b cis d4 |
	e4. cis8 cis4 r | fis g8 fis ~ fis e e4 |
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
					\set Staff.instrumentName = "Lead"
					\set Staff.midiInstrument = "flute"
					\clef treble
					\new Voice = "VoiceFemale1" \fA
				>>
				\new Lyrics = "LyricsFemale1"

				\new Staff = "Female2" <<
					\set Staff.instrumentName = "Female I"
					\set Staff.midiInstrument = "flute"
					\clef treble
					\new Voice = "VoiceFemale2" \fB
				>>
				\new Lyrics = "LyricsFemale2"

				\new Staff = "Female3" <<
					\set Staff.instrumentName = "Female II"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale3" \fC
				>>
				\new Lyrics = "LyricsFemale3"

				\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female III"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				\new Lyrics = "LyricsFemale4"

				\new Staff = "Male1" \with {
					\accepts "DrumVoice"
					\remove "Staff_performer"
				} <<
					\set Staff.instrumentName = \markup {\center-column{"Male" "Percussion"}}
					\set Staff.midiInstrument = "oboe"
					\clef "treble_8"
					\new Voice = "VoiceMale1" \with {\consists "Staff_performer"} \mA
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
		\layout {
			#(layout-set-staff-size 17.82)
			\context {
				\Score
				%fontSize = -1
				\override StaffSymbol #'staff-space = 2.5457\pt % staffsize/7 may be good
				\numericTimeSignature
			}
			\context {
				\Voice
				\dynamicUp
			}
		}
		\midi {}
	}
}