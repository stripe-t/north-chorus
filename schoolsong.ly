% This is an lilypond engraving example.
% Template revision 1
% 
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.16.0"

\paper {
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2013/10/14"
			}
			\fill-line {
				\override #'(font-name . "IPAex明朝")
				\fontsize #5 "サンプル (校歌)"
			}
			\fill-line {
				\null
				\override #'(font-name . "IPAex明朝") "LilyPond　Sample"
			}
		}
	}
	oddHeaderMarkup = \markup {
		\column {
			\fill-line {
				\fontsize #-1 \fromproperty #'page:page-number-string \null
			}
			
		}
		
	}
	evenHeaderMarkup = \markup {
		\column {
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
	\set Score.tempoHideNote = ##t 
	\tempo \markup {
		\concat {
			\smaller \general-align #Y #DOWN \note #"4" #1
			" = " "104 " \italic "ca." " 心を込めて"
		}
	} 4=104
	R1*4 |
	g'4.\mp g8 c4 c | g4. g8 e4. r8 | g4. g8 f4 e | d2. r4 |
	f4. f8 e4 d | e4.\< e8 g4. r8\! | a4\mf \autoBeamOff g8 c \autoBeamOn d4. b8 | c2.\> r4\! |
	c,4.\mp-\markup \italic "espress." c8 f4 a | g2. \breathe a4 | a4. c8 b4 a | e2. r4 |
	a4.\mf a8 g f e4 | g8. g16 f8 e d4. r8 | g4.\< g8 c4 e\! | d2.\> r4\! |
	c4. d8 c b a4 | c4 c g4. r8 | g2\< d' | c2. r4\! |
	\autoBeamOff
	g4.\f g8 a-. g-. g r | c8. c16 b8 a g f e4 | d8.\< d16 c8 d e4 g8. g16\! | d2.\> \breathe g4\mf | b4. a8 g4 fis | g2. r4 |
	\autoBeamOn
	g4.\f c8 c4 g | e a g4. r8 | g4. g8 g\< c c e | d2\> c4\! r | \bar "|."
}
sopranolyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あ か し や か を る
}

alto = \relative c'{
	R1*4 | 
	e4.\mp e8 f4 f | d4. d8 c4. r8 | c4. c8 b4 c | b2( c4 d8) r |
	b4. b8 c4 b | c4.\< c8 c4. r8\! | c4\mf c8 e f4. f8 | e2.\> r4\! |
	c4.\mp-\markup \italic "espress." c8 c4 f | e2. \breathe c4 | f4. e8 e4 d e2. r4 |
	c4.\mf c8 c b c4 | c8. c16 b8 c b4. r8 | d4\< c8 d e4 g\! | g2.\> r4\! |
	e4. e8 f f f4 | e8 f e c e4. r8 | d4\< e8 f g4 f | e2. r4\! |
	\autoBeamOff
	d4.\f b8 c-. b-. b r | c8. c16 d8 e d d c4 | c8.\< c16 c8 b c4 c8. c16\! | b2.\> \breathe b4\mf | d4. d8 d4 c | b2( c4 d8) r |
	\autoBeamOn
	e4.\f e8 e4 e | c c c4. r8 | b4. c8 e4\< e8 g | f2\> e4.\! r8 |
	
}
altolyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あ か し や か を る
}

tenor = \relative c {
	R1*4 |
	g'4.\mp g8 f4 f | g4. g8 g4. r8 | g4. g8 g4 g | g2. r4 |
	g4. g8 g4 g | g4.\< g8 g4. r8\! | f4\mf g8 g a4 g | g2.\> r4\! |
	e4.\mp-\markup \italic "espress." e8 a4 f | g2. \breathe a4 | a4. a8 gis4 gis | gis2. r4 |
	a4.\mf f8 g g g4 | g8. g16 g8 g g4. r8 | g4.\< g8 g4 c\! | b2\>( a4 b8\!) r |
	c4. b8 a b c4 | g8 a g e g4. r8 | g2\< b | c2. r4\! |
	\autoBeamOff
	g4.\f g8 fis-. g-. g r | g8. g16 g8 g g g g4 | a8.\< a16 g8 g g4 g8. g16\! | g2.\> \breathe g4\mf | g4. a8 b4 a | g2. r4 |
	\autoBeamOn
	g4.\f g8 c4 c | g f g4. r8 | g4. g8 c4\< c | b4\>( a8 b) <g c>4.\! r8 |
}
tenorlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あ か し や か を る
}

bass = \relative c {
	R1*4 |
	c4.\mp c8 a4 a | b4. b8 c4. r8 | e4. e8 d4 c | g2( a4 b8) r |
	d4. d8 c4 g | c4.\< c8 e4. r8\! | f4\mf e8 e d4 g | c,2.\> r4\!
	c4.\mp-\markup \italic "espress." c8 c4 c | c2. \breathe f4 | d4. a8 e'4 f | e2 d4 b8 r |
	a4.\mf f'8 e d c4 | e8. e16 d8 c g4. r8 | b4\< a8 b c4 c\! | g'2.\> r4\! |
	c,4. c8 c c c4 | c4 c c4. r8 | b4.\< a8 g2 | c2. r4\! |
	\autoBeamOff
	b4.\f g8 d'8-. d-. g r | e8. e16 d8 c b b c4 | f8\< f16 e d c4 e4. e16 | g2.\> \breathe g4\mf | g4. c,8 d4 d | g,2( a4 b8) r |
	\autoBeamOn
	c4.\f c8 c4 c | c f e4. r8 | d4. b8 c4\< c | <g g'>2\> c4.\! r8 |
}
basslyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
	あ か し や か を る
}

pianorh = \relative c' {
	\clef treble
	
}
pianolh = \relative c {
	\clef bass

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
%{\book{
	\score{
		\new PianoStaff <<
			\override Score.StaffSymbol #'ledger-line-thickness = #'(1.0 . 0.0)
			\new Staff {
				\overrideProperty #"Score.NonMusicalPaperColumn"
				#'line-break-system-details #'((Y-offset . 10)(alignment-distances . (6 0)))
				\clef treble <<{\voiceOne \soprano}\new Voice{\voiceTwo \alto}>>
			}
			\new Staff <<\clef bass \tenor \bass>>
		>>
	}
}
%}