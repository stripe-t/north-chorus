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
	\set majorSevenSymbol = \markup { maj7 }
	\tempo 4=100
}

fA = \relative c' {
	\key e \major
	e8 fis gis a b cis dis e
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key e \major

}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key e \major

}
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key e \major

}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\key e \major
	e8^\markup {\italic "Works great :)"}
	\perc \drummode {
		bd8 sn hh
	}
	b cis dis e
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key e \major

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
		}
		\midi {}
	}
}