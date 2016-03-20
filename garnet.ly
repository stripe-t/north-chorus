% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 2; tab-width: 2; indent-tabs: true;

\version "2.19.0"

altInst = 1

%% http://lilypond.1069038.n5.nabble.com/if-then-else-in-Lilypond-with-config-file-td163526.html
%% \ifDefinedThenElse symbol expression else-expression
%%
%% If the symbol is defined, returns the expression.
%% Otherwise, returns the else-expression.

ifDefinedThenElse =
#(define-music-function (parser location sym music else) (symbol? ly:music? ly:music?)
  (if (defined? sym)
   music else))

%% Example:
%%
%% \ifDefinedThen #'leadWords  \lyricsto lead \ifDefined #'leadWords

% \annotation markup command

#(define-markup-command (annotation layout props text) (markup?)
  "Annotation"
  (interpret-markup layout props
    #{
    	\markup { \override #'(font-name . "TakaoEx明朝") #text }
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

#(set-global-staff-size 15.00)

\paper {
	page-count = #4
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2016/3/20"
			}
			\fill-line {
				\null
				\override #'(font-name . "TakaoEx明朝")
				\fontsize #6 "ガーネット"
				"Original by Hanako Oku"
			}
			\fill-line {
				\null
				"Arranged by Tomohiro Tatejima"
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
			\fontsize #0 \italic \fill-line {
				\null
%				\left-column {"This score is open-source." "The latest revision is available at : https://github.com/stripe-t/north-chorus/releases"}
				\right-column {#(string-append "LilyPond Version " (lilypond-version) ", www.lilypond.org")}
			}
		}
	}

	evenFooterMarkup = \oddFooterMarkup
}

chord = \chordmode {
	\set majorSevenSymbol = \markup { maj7 }
	\set additionalPitchPrefix = "add"
	\override ChordName font-size = 0

	\set Score.markFormatter = #format-mark-box-alphabet

	\tempo 4=75

	\set Score.skipTypesetting = ##f
	c2 g/c | f/c c:9^7 | c g/c | f/c c:9^7 |

	\set Score.skipTypesetting = ##f
	\mark \default
	c g/c | f/c c:9^7 | f:maj7 f:maj7m | d:m7 g:sus4 |
	c g/c | f/c c:9^7 | f:maj7 e4:m7 a:m | \time 2/4 d:m7 g:sus4 | \time 4/4 c2:9^7 f4/c c |

	\set Score.skipTypesetting = ##f
	\mark \default
	d2:m g | e:m7 a:m | d:m g | e4:m7 e:7 a2:m |
	f:maj7 c/e | d:m7 g | \time 2/4 as4:maj7 bes:6 |

	\set Score.skipTypesetting = ##f
	\mark \default
	\time 4/4 es2 as/es | bes/d g/b | c4:m c:maj7m/b c:m7/bes a:m7.5- | as2:maj7 bes:7sus4 |
	es as/es | bes/d g/b | c2:m f | bes1 |
	as2 as:m | es/g c:m | as bes:sus4 |
	as1:maj9 | bes:sus4 | es:9^7/g | c:m |

	\set Score.skipTypesetting = ##f
	\mark \default
	as2 bes:sus4 | ees:9^7/g c:m | as bes:sus4 | es es:7 |
	as bes:sus4 | ees:9^7/g c:m | as1 | bes:sus4 | s |

	\set Score.skipTypesetting = ##f
	\mark \default
	es2 as/es | bes/d g/b | c4:m c:maj7m/b c:m7/bes a:m7.5- | as2:maj7 bes:7sus4 |
	es as/es | bes/d g/b | c2:m f | bes1 |
	as2 as:m | es/g c:m | as bes:sus4 |
	es1 | \bar "|."
}

fA = \relative c' {
	\key c \major
	\time 4/4
	R1*3 | r2 r4 r8. c16 |
	e8 f16 e ~ e8 r16 e d8 e16 d ~ d8 r16 d | c8 f g f16 f ~ f e e8 r4 |
	e8 d16 d ~ d8 c16 c ~ c as c8 r c16 d | f8 e16 d ~ d c8 e16 ~ e d d8 r8. c16 |
	e8 f16 e ~ e8 r16 e d8 e16 d ~ d8 r16 d | c8 f g f16 f ~ f e e8 r4 |
	e8 d16 a' ~ a8 a16 g ~ g8 e16 c ~ c r a b | c8 e16 d ~ d c16 c8 ~ | c4 r r2 |

	r8 a'16 a a8 a16 a ~ a8 g16 g ~ g f g8 | r e16 f g8 e16 d ~ d c8. r4 |
	r8 a'16 a a8 a16 a ~ a8 g16 g ~ g f g8 | r e16 f g8 e16 d ~ d c8. r8 c16 d |
	e8 f16 e ~ e8 c16 g ~ g c c8 r c16 c | a'8 g16 g ~ g e g8 ~ g2 ~ | g2 |

	\key es \major
	r8 bes16 bes bes bes bes bes bes8 es,16 es ~ es d es8 | r8 bes16 bes f' f f g as8 bes16 g ~ g f es8 |
	r8 c16 d es es es f g8 as16 g ~ g8 r16 es | g8 f16 g ~ g g as g ~ g f f8 ~ f4 |
	r8 bes16 bes bes bes bes bes bes8 es,16 d ~ d es8. | r8 bes16 bes bes' bes8 bes16 b8 g16 f ~ f es8. |
	r8 c16 d es f( g8) ~ g4 as8 g16 bes ~ | bes4 r as8 g16 c, ~ c d es8 ~ |
	es4. r8 as8 g16 c, ~ c d es8 ~ | es4 r8 es d es f g |
	as8 g16 es ~ es8 r bes es d es16 es ~ | es1 |
	R1 | R1 | R |

	g8 as16 g ~ g es f8 ~ f4 r8 d | f g16 f ~ f d es8 ~ es4 r8 bes |
	as g'16 g ~ g8 as g es f es | f g16 g ~ g2 r8 es |
	g8 as16 g ~ g es f8 ~ f4 r8 d | f g as g16 f ~ f es16 es8 r bes |
	as8 g'16 g ~ g2 r16 f g as | g8 f16 f ~ f2. ~ | f2 r |

	r8 bes16 bes bes bes bes bes bes8 es,16 es ~ es d es8 | r8 bes16 bes f' f f g as8 bes16 g ~ g f es8 |
	r8 c16 d es es es f g8 as16 g ~ g8 r16 es | g8 f16 g ~ g g as g ~ g f f8 ~ f4 |
	r8 bes16 bes bes bes bes bes bes8 es,16 d ~ d es8. | r8 bes16 bes bes' bes8 bes16 b8 g16 f ~ f es8. |
	r8 c16 d es f( g8) ~ g4 as8 g16 bes ~ | bes4 r as8 g16 c, ~ c d es8 ~ |
	es4. r8 as8 g16 c, ~ c d es8 ~ | es4 r8 es d es f g |
	as8 g16 es ~ es8 r bes^\markup {\italic "rall."} es d es16 es ~ | es1 ~ |
}

fB = \relative c'' {
	\key c \major
	R1*2 | g1 ~ | g |

	g( | a4 f g2) | a( as | a g) |
	c2( b | a g4) c16( b g8) | a4.( c8 b4 c8 g | a4 g | e2) f4 g |

	c2.( d4 | b2 c) |
	c2.( d4 | g,4. a16 b c4) c16( b g c,) |
	r2 r4 r8 g'16 g | c8 c16 c ~ c c c8 ~ c2 | c4( d) |

	\key es \major
	es2. ~ es16 c( d es | d4. c8 b2) | c2. ~ c8. d16 | es8 d16 es ~ es es f es ~ es d d8 ~ d4 |
	es2. ~ es16 c( d es | f4. es8 d4 g, | c2.) ees8 ees16 d ~ | d4 r r2 |
	g,2( f | g2 bes4.) bes8 | c8 bes16 aes ~ aes8 r aes2 |
	g4. g16 aes bes4. c16 bes ~ | bes4. ees8 d ees bes aes |
	g4. bes8 d4 ees4 | f4. ees16 d ees2 |

	ees,2 f | f g | ees f | g1 |
	g2 f | g g | R1 | r2. bes8 ees | d4. ees8 f2 |

	r8 bes,16 bes bes bes bes bes bes8 es,16 es ~ es d es8 | r8 bes16 bes f' f f g as8 bes16 g ~ g f es8 ~ |
	ees4 g( bes ees | g2) ees4( f |
	g2. ~ g8 f16 ees | d4.) d16( ees f4 g) |
	ees1( | f4) r r2 |
	g,2( aes | g1) | ees2( f | ees1) |
}

fC = \relative c'{
	\key c \major
	e2( d | f e) | e( d | f e) |

	e( d | f e4) d( | e1 | f) |
	g1( | f2 e4) e16( d c8) | e2( d4 g8 c, | a4 b | c2) c4 e |

	f2.( g4 | g2 a4) c16( b g c,) |
	r8 c16 c c8 c16 c ~ c8 b16 b ~ b a b8 | r b16 c d8 c16 b ~ b c8. r4 |
	c2. r8 e16 e | f8 d16 d ~ d e d8 ~ d4 b16( c d f | bes2) |

	\key es \major
	r8 g16 g g g g g g8 c,16 c ~ c bes c8 | r bes16 bes d d d es f8 g16 es ~ es d c8 |
	r c16 d c c c d es8 f16 es ~ es8 r16 c | c8 bes16 c ~ c c d c ~ c bes bes8 ~ bes4 |
	r8 g'16 g g g g g g8 c,16 bes ~ bes c8. | r8 bes16 bes f' f8 f16 g8 es16 d ~ d c8. |
	r8 g16 bes c d( es8) ~ es4 f8 es16 f ~ | f4 r r2 |
	ees2( ees | ees2 g4.) d8 | ees8 d16 c ~ c8 r f2 |
	ees4 ees16 f g8 c, ees g aes16 g ~ | g4 aes bes8 aes g f16 ees |
	d4 f c' b | d4. c8 ~ c4 g16( f ees bes |

	c2) ees | ees ees | c ees | ees des |
	c ees | f ees | g4. ees16 d ees bes'8. ~ bes16 bes bes bes | c8 bes16 bes ~ bes4 ~ bes4. c8 | bes4. c8 d2 |

	r8 g,16 g g g g g g8 c,16 c ~ c bes c8 | r8 bes16 bes d d d ees f8 g16 ees ~ ees d c8 ~ |
	c4 ees( g c | ees2) c4( d |
	ees2. ~ ees8 d16 c | bes4.) g16( aes b4 d) | c4. ees,16 g f c'8. ~ c4 | d4 r r2 |
	g,2( f | f g) | g bes,8 ees d c16 c( | bes1)
}

fD = \relative c'{
	\key c \major
	c2( b | c c) | c( b | c c) |

	c2( b | c2.) b4( | c1 | d2. ~ d8) r16 g, |
	c8 d16 c ~ c8 r16 c b8 c16 b ~ b8 r16 b | a8 c e8 d16 d ~ d c c8 r4 |
	c8 b16 c ~ c8 c16 b ~ b8 b16 a ~ a r8. | a8. b16 ~ b c c8 ~ c4 r c2 |

	a2( d | d e4) e16( d c g) |
	a2( d | e4) b( c4) e16( d c g) |
	a2( g4) r8 c16 c | a8 a16 a ~ a a c8 ~ c4 g16( a b d | g4 f)

	\key es \major
	es4.( bes8 c4 es | f4.) f16( g as4 g) | es2( g | c bes4 as) |
	r8 es16 es es es es es c8 as16 as ~ as as8. | r8 f16 f d' d8 d16 d8 c16 b ~ b c8. |
	ees2. c8 c16 d ~ | d4 r r2 |
	c8 c16 c ~ c c ces8 ~ ces2 | d8 d16 d ~ d d c8 ~ c2 | c2( bes) |
	c8 c16 d ees8 d ees4 g8 f16 ees | d8 d16 ees f8 ees f4 ees8 d16 c |
	bes8 bes16 c d8 ees f g aes16 g f ees | d4. ees8 ~ ees4 ees16( d c bes |

	aes2) bes | g c | aes bes | bes1 |
	aes2 bes | bes c | ees4. c16 bes c ees8. ~ ees16 ees ees ees | ees8 ees16 ees ~ ees4 ~ ees8 f4. | d4 ees f bes |

	r8 ees,16 ees ees ees ees ees ees8 aes,16 aes ~ aes g aes8 | r bes16 bes bes bes bes c d8 d16 c ~ c d ees8 ~ |
	ees4 g( ees c | ees4) c'( bes2) |
	r8 es,16 es es es es es c8 as16 as ~ as as8. | r8 f16 f d' d8 d16 d8 c16 b ~ b c8. |
	r8 g16 bes c d ees8 ~ ees4 f8 ees16 f ~ | f4 r r2 |
	ees1 ~ | ees1 | ees2 bes8 c bes aes16 aes( | g1) |
}


mA = \relative c' {
	\key c \major
	g2( g | a g) | g( g | a g) |

	g1( | f4 a g) d( | a'2 as | c2. b4) |
	g2.( b4 | c4. d8 c4) b( | a4 f8 a g4 e | f2 | g) f4 g

	r8 c16 c c8 c16 c ~ c8 b16 b ~ b a b8 | r g16 a b8 g16 f ~ f e8. r4 |
	r8 f16 f f8 f16 f ~ f8 f16 f ~ f d g8 ~ | g4 gis( a4) r8 a16 b |
	c8 d16 c ~ c8 f,16 e ~ e g g8 r g16 g | f8 f16 f ~ f f f8 ~ f2 | es4( f) |

	\key es \major
	g2( as4 ~ as16) f( g as | bes2 d) | g,2( es4) c16( d es f | g2.) es16( f g as |
	bes2 as4.) g16( as | bes2 g) | g( a | f4) r r2 |
	g8 g16 g ~ g g aes8 ~ aes2 | bes8 bes16 bes ~ bes bes bes8 ~ bes2 | ees,2( f) |
	ees4. f8 g4 c | bes2 ~ bes8 bes16 c d c bes aes | g2 f4 g | aes4. g8 ~ g2 |

	R1 | R | R | r4 r8 g16( aes bes8) bes16( c des4) |
	ees,2 f | ees g | c1 | bes4. bes8 ees2 | bes4 c d f |

	r8 bes,16 bes bes bes bes bes bes8 es,16 es ~ es d es8 | r8 d16 d f f f f f8 g16 f ~ f ees d8 |
	g4 ees'( c ees | c2) ees4( d |
	bes2) aes4( ~ aes16 ees d ees | f2) aes4( g) |
	ees4. g16 bes a f8. ~ f4 ~ | f r r2 |
	c'2( ces | bes1) | c2( bes | bes1) |
}
mB = \relative c {
	\key c \major
	c1 ~ | c | c ~ | c |

	c ~ | c2. g4( | f1 | d'2 g,) |
	c1 ~ | c2. g4( | f4. f8 e4 a | d g, | c2) c2 |

	d4. d8 g,4. g8 | e4. e8 a4. a8 |
	d4. d8 g,4. g8 | e4 e'( a,) a8 g |
	f4. f8 e4 r8 e'16 e | d8 d16 d ~ d d g,8 ~ g2 | as4( bes) |

	\key es \major
	es4. es8 es4. es8 | d4. c8 b4. b8 | c4 b bes a | as4. as8 bes4. bes8 |
	es4. es8 es4. es8 | d4. c8 b4. b8 | c4. g8 f2 | bes4 r r2 |
	as1( | g2 c) | aes( bes) |
	aes2 aes4 ees' | bes4. f'8 bes4 aes | g4. f16 ees d4 g | c,4. c8 ~ c2 |

	R1 | R | R | r4 r8 ees16( f g8) g16( aes bes4) |
	aes,2 bes | g c | aes1 | bes4 bes2. | bes4 f' bes2 |

	r8 ees,16 ees ees ees ees ees aes,8 aes16 aes ~ aes g aes8 | r8 bes16 bes bes bes bes bes b8 b16 b ~ b b b8 |
	c4 b'( bes a | aes2) bes4( bes,) |
	ees4. es8 ees4. ees8 | d4. c8 b4. b8 | c4. c8 f,4. f8 | bes4 r r2 |
	aes'( aes, | g c) | aes( bes | ees1) |
}

\book{
	\score {
		<<
			\new ChordNames {
				\set ChordNames.midiMaximumVolume = #0.0
				\set ChordNames.midiMinimumVolume = #0.0
				\chord
			}
			\new Staff = "Female1" <<
				\set Staff.instrumentName = "Lead"
				\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
				\clef treble
				\new Voice = "VoiceFemale1" \fA
			>>
			% \new Lyrics = "LyricsFemale1"
			\new ChoirStaff <<
				\new Staff = "Female2" <<
					\set Staff.instrumentName = "Female I"
					\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale2" \fB
				>>
				% \new Lyrics = "LyricsFemale2"

				\new Staff = "Female3" <<
					\set Staff.instrumentName = "Female II"
					\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale3" \fC
				>>
				% \new Lyrics = "LyricsFemale3"

				\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female III"
					\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				% \new Lyrics = "LyricsFemale4"

				\new Staff = "Male1" <<
					\set Staff.instrumentName = "Male"
					\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
					\clef "treble_8"
					\new Voice = "VoiceMale1" \mA
				>>
				% \new Lyrics = "LyricsMale1"

				\new Staff = "Male2" <<
					\set Staff.instrumentName = "Bass"
					\ifDefinedThenElse #'altInst \set Staff.midiInstrument = "flute" \set Staff.midiInstrument = "acoustic grand"
					\clef "bass"
					\new Voice = "VoiceMale2" \mB
				>>
				% \new Lyrics = "LyricsMale2"

				%{ \context Lyrics = "LyricsFemale1" {
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
				} %}
			>>
		>>
		\layout {
			\context {
				\Score
				\numericTimeSignature
      			%\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
			}
			\context {
				\Staff
				\showStaffSwitch
			}
			\context {
				\Voice
				\dynamicUp
			}
		}
		\midi {}
	}
}