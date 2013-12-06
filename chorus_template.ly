% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.16.0"

\paper {
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2000/01/01"
			}
			\fill-line {
				\override #'(font-name . "IPAex明朝")
				\fontsize #5 "TITLE"
			}
			\fill-line {
				\null
				\override #'(font-name . "IPAex明朝") "COMPOSER"
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

soprano = \relative c' {
	c'2
}
sopranolyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あー
}

alto = \relative c'{
	e2
}
altolyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あー
}

tenor = \relative c {
	g'4 c4
}
tenorlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あ ー
}

bass = \relative c {
	c2
}
basslyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あー
}

pianorh = \relative c' {
	\clef treble
	<e c'>2
}
pianolh = \relative c {
	\clef bass
	<c g'>2
}

\book{
	\score{
		<<
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
					\set Staff.midiInstrument = "clarinet"
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
					\set Staff.midiInstrument = "bassoon"
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

			\new PianoStaff = "Piano" \with {
			    fontSize = #-1
				\override StaffSymbol #'staff-space = #(magstep -1)
			}<<
				\set PianoStaff.instrumentName = "Piano"
				\new Staff \pianorh
				\new Staff \pianolh
			>>
		>>
		\layout {}
		\midi {}
	}
}

% Work in progress
\book{
	\score{
		\new PianoStaff <<
			\override Score.StaffSymbol #'ledger-line-thickness = #'(1.0 . 0.0)
			\new Staff <<
				% \overrideProperty #"Score.NonMusicalPaperColumn" #'line-break-system-details #'((Y-offset . 10)(alignment-distances . (6 0)))
				\clef treble \soprano \alto
			>>
			\new Staff <<\clef bass \tenor \bass>>
		>>
	}
}
