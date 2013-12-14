% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.16.0"

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

t = #(define-music-function
     (parser location note)
     (ly:music?)
   #{
	 \set Timing.baseMoment = #(ly:make-moment 1/8)
     \tuplet 3/2 8 {
		 #note
	 }
	 \unset Timing.baseMoment
   #})
\paper {
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1 (Ported Revision)"
				"2013/11/28"
			}
			\fill-line {
				\override #'(font-name . "IPAex明朝")
				\fontsize #5 "眠り姫"
			}
			\fill-line {
				\null
				"Original by SEKAI NO OWARI"
			}
			\fill-line {
				\null
				"Arranged by Sakumi Sugawara, Tomohiro Tatejima"
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
	bes1 |
	ees2 f/ees | d:m g:7 | c:m bes/d | ees4:maj7 ees2 f4 |
	f2. \tempo 4=120 s4 |
	bes1 | d:m/a | g:m7 | bes |
	ees4. d8:m s2 | ees4.:maj7 f8 s2 | bes4. f8 s2 | bes4. f8:7 s2 |
	ees2 f:7 | d:m7 g:m7 | ees f | d:m g:m7 |
	ees f:7 | d:m7 g:m7 | ees1 | f2 \set Score.tempoHideNote = ##t \tempo 4=110 s2 |
	\tempo 4=100 s2 \tempo 4=90 s4 f4:7 |
	\unset Score.tempoHideNote \tempo 4=100
	bes1 | d:m/a | g2 g:7 | c1:m7 |
	ees2 f/ees | bes4 f/a g:m f | ees1 | f |
	bes | d:m/a | g2 g:7 | c1:m7 |
	ees2 f/ees | bes4 f/a g:m f | ees1 | f |
}

fA = \relative c' {
	\key bes \major
	bes'1\fermata |
	g4 bes a8 g f ees | f2 g8 f ees d | ees d c4 f8 ees d4 | ees'8 d c bes a bes a f |
	<f c'>2.\fermata f8 bes ~ |
	bes4 bes8 bes ~ bes a g g | g f d f r4 f8 bes ~ | bes4 bes8 bes8 ~ bes a g g ~ | g f d f r4 r8 d8|
	ees4 bes'8 a ~ a4 d,8 ees ~ | ees4 bes'8 a ~ a4 bes8 bes ~ | bes4 r r2 | r4 r8 bes bes c d d ~ |
	d ees c r a bes c c ~ | c bes bes r bes c d d ~ | d c c c c c ees ees ~ | ees d d r bes c d d ~ |
	d c c c a bes c c | c bes d r bes bes bes bes ~ | bes bes bes bes ~ bes4 r | bes4 a bes c ~ |
	c2. r4 |
	
	\override TupletBracket.bracket-visibility = ##f
	d4 \t {d8 d16 d8 d16 d8 d16 ees8 f16 r8[ bes,16 bes8 bes16]} | \t {d8 d16 d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16} r4 |
	\t {d8 d16 d8 d16 d8 d16 d8 d16 f8 f16 f8 f16 ~ f8 ees16 d8 ees16 ~ } | ees8 r r4 r2 |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 c8 c16 ~ } c8 r \t {r8[ f,16 f8 f16] } | d'8 \t {d8 ees16 d8 a16 a8 bes16 ~ } bes8 r \t {r8[ bes16 bes8 bes16]} |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16} c8 \t {bes8 c16 ~ } | c8 r r4 r2 |
	d8 ~ \t {d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16 } r8 \t {r8 d16} | \t {d8 d16 d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16} r4 |
	\t {d8 d16 d8 d16 d8 d16 d8 d16 f8 f16 f8 f16 ~ f8 ees16 d8 ees16 ~ } | ees8 r r4 r2 |
	bes4 \t {bes8 bes16 c8 c16 } \t {r8[ f,16 f8 f16] r8[ f16 f8 f16]} | d'8 \t {ees8 ees16 d8 a16 a8 bes16 ~ } bes8 r r \t {r8[ bes16]} |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 c8 c16 ~ } | c2 r |
	r \t {r8[ bes16 bes8 bes16]} a8 bes ~ | bes2. r4 |
	
	\set stemRightBeamCount = #0
	%\tuplet 3/2 4 {c4 c8[] c4 c8[] c4 c8[] c4 c8[]}
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key bes \major
	f1\fermata |
	g | f2 f | g bes | bes a4 g |
	a2.\fermata r4 |
	bes4. bes8 ~ bes4 bes | a4. a8 ~ a4 a | bes4. bes8 ~ bes4 bes | bes4. bes8 ~ bes8 a bes c |
	bes4. f8 ~ f4 f | bes4. a8 ~ a4 f | bes8 a bes c ~ c bes c d ~ | d c d ees ees2 |
	bes4 bes a a | a a bes bes | bes bes c c | a a bes bes |
	bes bes c c | a a d d | bes4 bes8 bes ~ bes g a bes | c1 |
	ees8 f,16 c' ~ c f, c'8 ees f,16 c' ~ c a c8 |
	bes2. d4 | d2. d4 | b1 | g2 ~ g8 f ees d |
	ees2 f | d'4 c bes f | g2. bes4 | c2 ~ c8 c d ees |
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key bes \major
	d1\fermata |
	ees | c2 d8 a' g f | ees2 d | g8 f ees d c d c c |
	f2.\fermata r4 |
	d4. d8 ~ d4 d | d4. d8 ~ d4 d | d4. d8 ~ d4 d | d4. d8 ~ d4 d |
	ees8 g bes d ~ d c bes a | ees g bes <c f> ~ <c f> ees d c | f,4 f8 f ~ f g a bes ~ | bes a bes c ~ c2 |
	g4 g f f | f f f f | g g a a | f f f f |
	g g a a | f f f f | g g8 g ~ g ees f g | a8 f16 a ~ a f a8 c f,16 a ~ a f a8 |
	c f,16 a ~ a f a8 c f,16 a ~ a f a8 | 
	f1 | f | g2 f4 ~ \t{f8 ees16 d8 ees16 ~ } | ees1 |
	g2 a | f4 f d c | ees2. g4 | a1 |
	
}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

%{fD = \relative c'{
  \key bes \major
	e2
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}%}

mA = \relative c {
	\key bes \major
	bes'1\fermata |
	bes | a2 bes | g f | ees'4 bes c f, |
	c'2.\fermata r4 |
	f,4. f8 ~ f4 f | f4. f8 ~ f4 f | d4. d8 ~ d4 d | f4. f8 ~ f f g a |
	bes4. a8 ~ a4 a | ees'4. c8 c4 ees | d4 d8 c ~ c bes d f | d4 ees8 f ~ f2 |
	bes,4 bes c c | c c d d | bes bes ees ees | d d d d |
	bes bes ees ees | c c bes bes | bes4. bes8 ~ bes4 bes | c4. c8 c4. d8 |
	ees4 ees f8 ees d c |
	d1 | d | d | bes |
	bes2 c | d4 c bes a | bes1 | c
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key bes \major
	bes1\fermata | ees2 f | d g8 f ees d | c2 bes | c c4 ees |
	f2.\fermata r4 |
	bes,4. bes8 ~ bes4 bes | a4. a8 ~ a4 a | g4. g8 ~ g4 g | bes4. bes8 ~ bes2 |
	ees4. d8 ~ d2 | ees4. f8 ~ f4 c' | d,4 d8 f ~ f4 f | bes8 a bes f ~ f2 |
	ees4. ees8 ees4. ees8 | d4. d8 g4. g8 | ees4. ees8 f4. f8 | d4. d8 g4. g8 |
	ees4. ees8 f4. f8 | d4. d8 g4. g8 | ees4. ees8 ~ ees4 ees | f4. f8 f4 f |
	f f f f |
	bes1 | a | g | c, |
	ees2 ees | bes'4 a g f | ees1 | f |
}
mBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

\book{
	\score{
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
				
				%{\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female IV"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				\new Lyrics = "LyricsFemale4"%}

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
				%{\context Lyrics = "LyricsFemale4" {
					\lyricsto "VoiceFemale4" {
						\fDlyric
					}
				}%}
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
		}
		\midi {}
	}
}