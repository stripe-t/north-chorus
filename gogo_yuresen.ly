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
	
}

fA = \relative c' {
	\key c \minor
	\time 4/4
	c4 c c c
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key c \minor
	\time 4/4
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key c \minor
	\time 4/4
}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key c \minor
	\time 4/4
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\key c \minor
	\time 4/4
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key c \minor
	\time 4/4
}
mBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "TakaoEx明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

pc = \drummode {
	\time 4/4
	bd8 hh sn hh hho hh sn hh
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
				% \new Lyrics = "LyricsFemale1"

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