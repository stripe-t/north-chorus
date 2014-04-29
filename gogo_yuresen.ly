% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.18.0"

% Custom percussion table

#(define voiceperc '(
                    	(bassdrum default #f  -1)
                    	(snare default #f 1)
                     (hihat cross #f 3)
                     (openhihat cross "open" 3)
                    ))

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
	% page-count = #6
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2014/4/28"
			}
			\fill-line {
				\override #'(font-name . "TakaoEx明朝")
				\fontsize #6 "ゴーゴー幽霊船"
			}
			\fill-line {
				\null
				"Original by Kenshi Yonezu"
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
			\fontsize #0 \italic \fill-line {
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
	\set Score.markFormatter= #format-mark-box-alphabet
	\mark \markup{\bold \box Intro}
	\tempo 4=180
	
	% Intro
	s1*8
	\time 3/4
	s4*3
	\time 4/4
	s1*8
}

fA = \relative c' {
	\key c \minor
	\time 4/4
	
	% Intro
	R1*8
	\time 3/4
	r4 r r
	\time 4/4
	g'8 c r c ~ c ees d c | c8. c16 ees8-. d8 ~ d ees d4 | g,8 c r c ~ c ees d c | c8. c16 d8-. c8 ~ c d c4 |
	g8 c r c ~ c ees d c | c8. c16 ees8-. d8 ~ d ees d4 | g,8 c r c ~ c ees d c | c8. c16 d8-. c8 ~ c d c4 |
	
	% A
	\change Staff = "Female3"
	r4 c,-.-- r c-.-- | r4 d-.-- r d-.-- | r4 ees-.-- r ees-.-- | r4 d-.-- r d-.-- |
	r4 c-.-- r c-.-- | r4 d-.-- r d-.-- | r4 f-.-- r f-.-- | r4 c-.-- r c-.-- |
	g'4. c8 ~ c2 | d4. g,8 ~ g2 | g4. c8 ~ c2 | bes4. f8 ~ f2 |
	g4. c8 ~ c2 | bes4. f8 ~ f2 | c'4. bes8 ~ bes2 | g4. g8 ~ \autoBeamOff g c \autoBeamOn d b16 g |
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key c \minor
	\time 4/4
	
	% Intro
	R1*4
	c4. g'8 ~ g2 | f4. d8 ~ d2 | c4. g'8 ~ g2 | f4. d8 ~ d2 |
	\time 3/4
	r4 r r
	\time 4/4
	R1*4
	g8 c r c ~ c g' f ees | c8. c16 g'8-. f ~ f g f4 | g,8 c r c ~ c g' f ees | c8. c16 d8-. c ~ c d c4 |
	
	% A
	r4 g-.-- r g-.-- | r4 g-.-- r g-.-- | r4 g-.-- r g-.-- | r4 g-.-- r g-.-- |
	r4 g-.-- r g-.-- | r4 g-.-- r g-.-- | r4 g-.-- r g-.-- | r4 g-.-- r g-.-- |
	c4. g'8 ~ g2 | f4. d8 ~ d2 | c4. ees8 ~ ees2 | d4. bes8 ~ bes2 |
	c4. g'8 ~ g2 | f4. d8 ~ d2 | ees4. d8 ~ d2 | c4. c8 ~ c4 r |
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key c \minor
	\time 4/4
	
	% Intro
	R1*4
	c4. g'8 ~ g2 | f4. d8 ~ d2 | c4. g'8 ~ g2 | f4. d8 ~ d2 |
	\time 3/4
	r4 r r
	\time 4/4
	ees4. ees8 ~ ees2 | ees4. d8 ~ d2 | ees4. ees8 ~ ees2 | ees4. f8 ~ f2 |
	ees4. ees8 ~ ees4 f | ees4. ees8 ~ ees ees-. f4 | ees4. ees8 ~ ees4 f | ees4. ees8 ~ ees f ees4 |
	
	% A
	\change Staff = "Female4"
	<<{\hideNotes r4 r r r}\new Voice{\oneVoice R1}>>| R1*3 | \unHideNotes
	ees4. ees8 ~ ees2 | f4. f8 ~ f2 | d4. d8 ~ d2 | ees4. ees8 ~ ees2 |
	ees4 d8 ees ~ ees g4 g8 | f8 d4 bes8 ~ bes d d d | ees4 d8 c ees4 d8 c | d f4 d8 ~ d d ees d |
	c4 bes8 c ~ c g' g g | f d4 bes8 ~ bes g g g | c4 d8 ees d c bes d | ees ees d ees ~ ees4 r |

}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key c \minor
	\time 4/4

	% Intro
	c4. g'8 ~ g2 | f4. d8 ~ d2 | c4. g'8 ~ g2 | f4. d8 ~ d2 |
	c4. ees8 ~ ees2 | d4. bes8 ~ bes2 | g4. c8 ~ c4 ees | d4. g,8 ~ g2 |
	\time 3/4
	a4-.-- bes-.-- bes-.--
	\time 4/4
	R1*4
	R1*2 | g8 c r c ~ c ees d c | c8. c16 d8-. c8 ~ c d c4 |
	
	% A
	\change Staff = "Female1"
	c4 bes8 c ~ c ees ees ees | d bes4 g8 ~ g g g g | g4 f8 ees g4 f8 ees | f bes4 bes8 ~ bes4 r |
	c4 bes8 c ~ c ees ees ees | d bes4 g8 ~ g g g g | g'4 f8 g f ees c bes | c c bes c ~ c4 r |
	c4 bes8 c ~ c ees ees ees | d bes4 g8 ~ g g g g | g4 f8 ees g4 f8 ees | f bes ~ bes bes ~ bes4 r |
	c4 bes8 c ~ c ees ees ees | d bes4 g8 ~ g g g g | g'4 f8 g f ees c bes | c c bes c ~ c4 r |
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c' {
	\key c \minor
	\time 4/4
	
	% Intro
	g4. g8 ~ g2 | bes4. f8 ~ f2 | aes4. aes8 ~ aes2 | bes4. f8 ~ f4 aes |
	g4. g8 ~ g2 | aes4. f8 ~ f2 | ees4. ees8 ~ ees2 | f4. f8 ~ f2 |
	\time 3/4
	f4-.-- f-.-- f-.-- |
	\time 4/4
	g4. a8 ~ a2 | g4. f8 ~ f g f d | g4. a8 ~ a2 | bes4. a8 ~ a2 |
	g4. g8 ~ g2 | g4. f8 ~ f2 | g4. g8 ~ g2 | g4. g8 ~ g2 |
	
	% A
	g4. g8 ~ g2 | g4. g8 ~ g2 | g4. g8 ~ g2 | g4. g8 ~ g2 |
	g4. g8 ~ g2 | g4. g8 ~ g2 | g4. g8 ~ g2 | g4. g8 ~ g2 |
	g4. g8 ~ g2 | g4. f8 ~ f2 | ees4. g8 ~ g2 | f4. d8 ~ d2 |
	c4. c8 ~ c2 | d4. d8 ~ d2 | ees4. f8 ~ f4 d | g4. g8 ~ \autoBeamOff g c \autoBeamOn d b16 g |
	
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
	
	
}

mB = \relative c {
	\key c \minor
	\time 4/4
	
	% Intro
	c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 |
	c4. c8 ~ c2 | bes4. bes8 ~ bes2 | aes4. aes8 ~ aes2 | bes4. bes8 ~ bes2 |
	\time 3/4
	r4 r g
	\time 4/4
	c4. c8 ~ c2 | c4. c8 ~ c ees d g, | c4. c8 ~ c2 | c4. c8 ~ c2 |
	c4. c8 ~ c4 g | c4. c8 ~ c ees d g, | c4. c8 ~ c4 g | c4. c8 ~ c2 |
	
	% A
	c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 |
	c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 | c4. c8 ~ c2 |
	c4. c8 ~ c2 | bes4. bes8 ~ bes2 | aes4. aes8 ~ aes2 | bes4. bes8 ~ bes2 |
	f4. f8 ~ f2 | g4. g8 ~ g2 | aes4. bes8 ~ bes2 | c4. c8 ~ c4 r |
}
mBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

pc = \drummode {
	\time 4/4
	
	% Intro
	R1*8
	\time 3/4
	r4 r r
	\time 4/4
	bd8 hh r bd ~ bd bd hh4 | bd8 hh r bd ~ bd bd hho4 | bd8 hh r bd ~ bd bd hh8 bd | bd8 hh r bd ~ bd bd hho4 |
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
				\set Staff.midiInstrument = "flute"
				\clef treble
				\new Voice = "VoiceFemale1" \fA
			>>
			% \new Lyrics = "LyricsFemale1"
			\new ChoirStaff <<
				\new Staff = "Female2" <<
					\set Staff.instrumentName = "Female I"
					\set Staff.midiInstrument = "flute"
					\clef treble
					\new Voice = "VoiceFemale2" \fB
				>>
				% \new Lyrics = "LyricsFemale2"

				\new Staff = "Female3" <<
					\set Staff.instrumentName = "Female II"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale3" \fC
				>>
				% \new Lyrics = "LyricsFemale3"

				\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female III"
					\set Staff.midiInstrument = "clarinet"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				% \new Lyrics = "LyricsFemale4"

				\new Staff = "Male1" <<
					\set Staff.instrumentName = "Male"
					\set Staff.midiInstrument = "oboe"
					\clef "treble_8"
					\new Voice = "VoiceMale1" \mA
				>>
				% \new Lyrics = "LyricsMale1"

				\new Staff = "Male2" <<
					\set Staff.instrumentName = "Bass"
					\set Staff.midiInstrument = "bassoon"
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
			\new DrumStaff = "Percussion" <<
				\set DrumStaff.drumStyleTable = #(alist->hash-table voiceperc)
				\override Staff.StaffSymbol #'line-positions = #'(-2 0 2)
				\set Staff.instrumentName = "Percussion"
				\clef "percussion"
				\new DrumVoice = "VoicePercussion" \pc
			>>
		>>
		\layout {
			\context {
				\Score
				\numericTimeSignature
			}
			\context {
				\Staff
				\showStaffSwitch
			}
			\context {
				\Voice
				\dynamicUp
			}
			\context {
				\DrumVoice
				\dynamicUp
			}
		}
		\midi {}
	}
}