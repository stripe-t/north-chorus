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
				"Revision 2 (WIP)"
				"2013/12/18"
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
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	bes'1\fermata |
	g4 bes a8 g f ees | f2 g8 f ees d | ees d c4 f8 ees d4 | ees'8 d c bes a bes a f |
	c'2.\fermata s4
	bes4. bes8 ~ bes4 bes | a4. a8 ~ a4 a | bes4. bes8 ~ bes4 bes | bes4. bes8 ~ bes8 a bes c |
	
	bes4. f8 ~ f4 f | bes4. a8 ~ a4 f | bes8 a bes c ~ c bes c d ~ | d c d ees ees2 |
	d2 c | c4 bes8 a bes2 | bes a | c bes |
	bes2 a | a bes8 bes bes bes ~ | bes bes bes bes ~ bes4 r | bes4 a bes c ~ |
	c2. r4 |
	
	f1 | f | g2 f4 ~ \t{f8 ees16 d8 ees16 ~ } | ees1 |
	g2 f | f4 c d a | bes2. ees4 | f1 |
	d,8 ~ \t {d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16 } r8 \t {r8 d16} | \t {d8 d16 d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16} r4 |
	\t {d8 d16 d8 d16 d8 d16 d8 d16 f8 f16 f8 f16 ~ f8 ees16 d8 ees16 ~ } | ees8 r r4 g8 f g bes |
	ees2 c | bes4 c d f | ees1 | f2. r4 |
	ees4 d c bes |
	bes4 bes8 ~ \t {bes8 bes16 r8[ bes16 r8 bes16]} bes4 | a4 a8 ~ \t {a8 a16 r8[ a16 r8 a16]} a4 |
	b4 b8 ~ \t {b8 b16 r8[ d16 r8 d16]} d4 | bes4 bes8 ~ \t {bes8 bes16 r8[ bes16 r8 bes16]} bes4
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	f1\fermata |
	g | f2 f | g bes | bes a4 g |
	f2.\fermata r4 |
	f4. f8 ~ f4 f | f4. f8 ~ f4 f | g4. g8 ~ g4 g | f4. f8 ~ f f g a |
	ees8 g bes d ~ d c bes a | ees g bes f' ~ f ees d c | bes4 f8 f ~ f g a bes ~ | bes a bes f ~ f2 |
	g4 g f f | f f a g | ees ees f f | a a bes8 c d d ~ |
	d8 c c c a bes c c | c bes d r g,8 g g g ~ | g g g g ~ g4 r | g4 f g a ~ |
	a2. r4 |
	bes2. d4 | d2. d4 | b1 | g2 ~ g8 f ees d |
	ees2 f | d'4 c bes f | g2. bes4 | c2 ~ c8 c d ees |
	d1 | d | d4 b f' d | ees1 |
	bes2 a | f4 a bes c | bes1 | c2. r4 |
	bes4 bes a a |
	d4 \t {d8 d16 d8 d16 d8 d16 ees8 f16 r8[ bes,16 bes8 bes16]} | \t {d8 d16 d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16} r4 |
	\t {d8 d16 d8 d16 d8 d16 d8 d16 f8 f16 f8 f16 ~ f8 ees16 d8 ees16 ~ } | ees8 r r4 r2 |
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	d1\fermata |
	ees | c2 d8 a' g f | ees2 d | g8 f ees d c2 |
	f2.\fermata r4 |
	d4. d8 ~ d4 d | d4. d8 ~ d4 d | d4. d8 ~ d4 d | d4. d8 ~ d4 d |
	%{ TODO: change %}ees4 ees8 bes' ~ bes a g f | ees d g c ~ c a f ees | d4 d8 d ~ d ees f f ~ | f4 r8 g g a bes bes ~ |
	bes a a r f g a a ~ | a bes g r g a bes bes ~ | bes bes g bes a bes c c ~ | c ees d bes ~ bes4 r4 |
	g4 g a a | f f f8 f f f | ees ees ees ees ~ ees ees f g | g4 f f f |
	a8. a16 r8 a8 ~ a16 a8. a8 f |
	d4 \t {d8 d16 d8 d16 d8 d16 ees8 f16 r8[ bes,16 bes8 bes16]} | \t {d8 d16 d8 d16 d8 d16 d8 d16 d8 d16 ees8 f16} r4 |
	\t {d8 d16 d8 d16 d8 d16 d8 d16 f8 f16 f8 f16 ~ f8 ees16 d8 ees16 ~ } | ees8 r r4 r2 |
	g2 a | f4 f d c | ees2. g4 | a2 ~ a8 a bes g |
	f1 | f | f2 aes2 | g1 |
	d4 \t {d8 d16 ees8 ees16 r8[ ees16 ees8 ees16] ees8 g16 f8 a,16} | bes8 \t {bes8 bes16 d8 f16 f8 g16 ~ } g8 r r \t {r g16} |
	\t {g8 g16 g8 g16 g8 g16 g8 g16 g8 g16 g8 g16 g8 a16 bes8 a16 ~ } | a2. r4 |
	g4 f ees f |
	f4 f8 ~ \t {f8 f16 r8[ f16 r8 f16]} f4 | f4 f8 ~ \t {f8 f16 r8[ f16 r8 f16]} f4 |
	g4 g8 ~ \t {g8 g16 r8[ f16 r8 f16]} f4 | g4 g8 ~ \t {g8 g16 r8[ g16 r8 g16]} g4 |
}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	bes1\fermata |
	ees4 g f2 | d4 a' g8 f ees d | c2 bes | c ees |
	a2.\fermata r4 |
	bes,4. bes8 ~ bes4 bes | a4. a8 ~ a4 a | bes4. bes8 ~ bes4 bes | bes4. bes8 ~ bes4 bes |
	bes4. a8 ~ a4 a | ees'4. c8 c4 ees | d4 d8 c ~ c bes c d | d c d bes bes c d d ~ |
	d8 ees c r a bes c c ~ | c bes bes r bes c d d ~ | d c c c c c ees ees ~ | ees d d r r2 |
	ees4 ees f f | d d d8 d d d ~ | d d d d ~ d8 c d ees | d4 c d ees |
	f8. f16 r8 f ~ f16 f8. f8 ees |
	d1 | f | f | ees |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 c8 c16 ~ } c8 r \t {r8[ f,16 f8 f16] } | d'8 \t {d8 ees16 d8 a16 a8 bes16 ~ } bes8 r \t {r8[ bes16 bes8 bes16]} |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16} c8 \t {bes8 c16 ~ } | c8 r r4 r2 |
	bes'2 ~ bes4. \t {a8 bes16} | a2 ~ a4. \t {a8 bes16} | g2 f4. \t {f8 g16} | ees1 |
	g2 f | bes4 f g c, | ees1 | f2. r4 |
	ees4 f ees c |
	d4 d8 ~ \t {d8 d16 r8[ d16 r8 d16]} d4 | c4 c8 ~ \t {c8 c16 r8[ c16 r8 c16]} c4 |
	d4 d8 ~ \t {d8 d16 r8[ d16 r8 d16]} d4 | ees4 ees8 ~ \t {ees8 ees16 r8[ ees16 r8 ees16]} ees4 |
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	f1\fermata |
	bes | a2 bes | g f | ees'4 bes c8 d c f, |
	c'2.\fermata f,8 bes ~ |
	bes4 bes8 bes ~ bes a g g | g f d f r4 f8 bes ~ | bes4 bes8 bes8 ~ bes a g g ~ | g f d f r4 r8 d8|
	ees4 bes'8 a ~ a4 d,8 ees ~ | ees4 bes'8 a ~ a4 bes8 bes ~ | bes4 r r2 | R1
	bes4 bes c c | c c d d | bes bes ees ees | d d d d |
	bes bes ees ees | c c bes8 bes bes bes ~ | bes bes bes bes ~ bes4 r | bes a bes c |
	ees8. ees16 r8 ees8 ~ ees16 ees8. d8 c |
	d1 | d | d | bes |
	bes2 c | d4 c bes a | bes1 | c |
	bes8 ~ \t {bes bes16 bes8 bes16 bes8 bes16 bes8 bes16 c8 d16} r8 \t {r bes16} | \t {a8 a16 a8 a16 a8 a16 a8 a16 a8 a16 c8 d16} r4 |
	\t {b8 b16 b8 b16 b8 b16 b8 b16 g8 g16 g8 g16 g8 g16 b8 c16 ~ } | c8 r r4 r2 |
	bes4 \t {bes8 bes16 c8 c16 } \t {r8[ f,16 f8 f16] r8[ f16 f8 f16]} | d'8 \t {ees8 ees16 d8 a16 a8 bes16 ~ } bes8 r r \t {r8[ bes16]} |
	\t {bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 bes8 bes16 c8 c16 ~ } | c2. r4 |
	ees4 d c ees |
	f,4 f8 ~ \t {f f16 r8[ f16 r8 f16] r8[ f16 ~} f8] | f4 f8 ~ \t {f f16 r8[ f16 r8 f16] r8[ f16 ~} f8] |
	f4 f8 ~ \t {f f16 r8[ f16 r8 f16] r8[ f16 ~} f8 | g4 g8[ ~ \t {g g16 r8[ g16 r8 g16] r8[ g16 ~} g8] |
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\override TupletBracket.bracket-visibility = ##f
	\key bes \major
	bes1\fermata | ees2 f | d g8 f ees d | c2 bes | c c4 ees |
	f2.\fermata r4 |
	bes,4. bes8 ~ bes4 bes | a4. a8 ~ a4 a | g4. g8 ~ g4 g | bes4. bes8 ~ bes2 |
	ees4. d8 ~ d2 | ees4. f8 ~ f4 f | bes,4 bes8 f ~ f f f8 bes ~ | bes8 a bes f ~ f2 |
	ees'4. ees8 ees4. ees8 | d4. d8 g4. g8 | ees4. ees8 f4. f8 | d4. d8 g4. g8 |
	ees4. ees8 f4. f8 | d4. d8 g8 g g g( | ees) ees ees ees ~ ees4 r | ees ees ees f |
	f f f f |
	bes1 | a | g | c, |
	ees2 f | bes4 a g f | ees1 | f |
	bes,1 | a | g2 b | c1 |
	ees2 ees | bes4 a g f' | ees1 | f2. r4 |
	ees4 ees ees f |
	bes,4 bes8 ~ \t {bes8 bes16 r8[ bes16 r8 bes16]} f'8 bes, | a4 a8 ~ \t {a8 a16 r8[ a16 r8 a16]} f'8 a, |
	g4 g8 ~ \t {g8 g16 r8[ g16 r8 g16]} f'8 g, | c4 c8 ~ \t {c8 c16 r8[ c16 r8 c16]} g'8 c,
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
		\layout {
			#(layout-set-staff-size 17.82)
		}
		\midi {}
	}
}