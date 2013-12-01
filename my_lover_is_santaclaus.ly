% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.16.0"
\include "articulate.ly"

\paper {
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2013/12/1"
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
		\column {
			\fill-line {
				\fontsize #-1 \fromproperty #'page:page-number-string \null
			}
			\draw-hline
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

chord = \chordmode {
	\tempo 4=150
	d1 | s | e | s |
	d | s | e | s |
	cis:m | fis:m | cis:m | fis:m |
	b:m | d | g | e |
	d1 | s | e | s |
	d | s | e | s |
	cis:m | fis:m | cis:m | fis:m |
	b:m | g | cis | s |
	d | s | a/cis | b:m7 |
	a | b/a | gis:m | cis:7 |
	d | s | a/cis | b:m7 |
	a | b2:m7 cis:m7 | fis1:m | e2 a |
	d2.. s8 | s4 s s s8 s |
}

fA = \relative c' {
	\key a \major
	R1 | R1 | r2 e'8-. e-. r4 | r2 e8-. e-. r4 |
	R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r4 e ~ e4. d8->-. |
	R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	R1 | R1 | r2 e8-. e-. r4 | r2 e8-. e-. r4 |
	cis4. cis8 ~ cis e gis-. fis ~ | fis4 r r2 | cis4. cis8 ~ cis e gis-. fis ~ | fis4 r r2 | 
	R1 | b,4. d8 ~ d4  fis | f2. r8 cis ~ | cis cis dis e f4-. r |
	r4 a,8 a a a a a ~ | a gis fis4 r2 | r4 a8 a a a a a ~ | a e d4 r2 |
	cis4 e gis a8 b ~ | b4 a gis a8 b ~ | b4. b8 ~ b2 | R1 |
	fis'1 ~ | fis2 ~ fis8 e d cis ~ | cis2 cis8 b cis d ~ | d2 \times 2/3 { fis4 b, d } |
	cis2. ~ cis8 gis' ~ | gis4 fis eis4. fis8 ~ | fis2 r2 | R1 |
}
fAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fB = \relative c' {
	\key a \major
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r2 r4 cis8 e |
	e4 r r2 | fis4 gis8 fis ~ fis e cis e | e4 r r2  | fis4 gis8 fis ~ fis e cis e |
	b2. r4 | cis4 b a8 b4 b8 ~ | b2 r2 | r4 r8 d' ~ d4. d8->-. |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | R1 |
	cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 | cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 |
	b,8 b d b fis' r r4 | b,8 b d b g' r r4 | r2 r4 r8 cis, ~ | cis cis dis e f4-. r |
	r4 d8 d d d d d ~ | d cis b4 r2 | r4 cis8 cis cis cis cis cis ~ | cis b a4 r4 gis8( a) |
	a4 cis e cis8 dis ~ | dis4 cis b cis8 dis ~ | dis4. dis8 ~ dis2 | R1 |
	R1 | r4 r8 e a e b' a ~ | a4 r r2 | r4 r8 cis ~ cis a e d |
	cis4 e gis a8 b ~ | b4 a gis a8 a ~ | a2 r | R1 |
}
fBlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fC = \relative c'{
	\key a \major
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | R1 |
	cis8-. cis-. e-. cis-. gis'-. r r4 | R1 | cis,8-. cis-. e-. cis-. gis'-. r r4 | R1 |
	b,8 b d b fis' r r4 | a,8 a d a fis' r r4 | b,8 b d b g' r g e ~ | e r r4 b'4. a8->-. |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r2 r4 cis,8 e |
	e4 r r2 | fis4 gis8 fis ~ fis e cis e | e4 r r2  | fis4 gis8 fis ~ fis e cis e |
	b2. r4 | cis4 b a8 b4 cis8 ~ | cis2. r4 | R1 |
	R1 | r4 r8 e a e b' a ~ | a4 r r2 | r4 r8 cis ~ cis a e d |
	cis4 r r2 | R1 | r2 r4 r8 cis' ~ | cis cis dis e f4-. r |
	fis,8( fis-.) r fis8( fis-.) r fis8( fis-.) | r fis8( fis-.) r fis8( fis-.) r e( ~ | e e-.) r e e r e e | r d d r d e b d |
	cis4 e e fis8 gis ~ | gis4 fis eis eis8 fis ~ | fis2 r2 | R1 |
} 
fClyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

fD = \relative c'{
	\key a \major
	r8 d d d fis fis e e | d cis b a b cis4 b8 ~ | b4. gis16 fis e2 ~ | e4 r4 r2 |
	r8 d' d d fis fis e e | d cis b a b cis8 r b8 ~ | b4 r r2 | R1 |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r2 r8 a'4 d8->-. |
	R1 | R1 | e,8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	R1 | R1 | e8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 r cis8 e |
	cis4 r r2 | cis4 e8 fis ~ fis e cis e | cis4 r r2 | cis4 e8 fis ~ fis e cis e |
	b2. r4 | g4 g a8 b4 cis8 ~ | cis2. r4 | R1 |
	R1 | r4 r8 e ~ e e d cis ~ | cis4 r r2 | r2 b8 cis d b( |
	cis4) r r2 | R1 | r2 r4 r8 cis ~ | cis cis dis e f4-. r |
	r4 d8 d d d d d ~ | d cis b4 r2 | r4 cis8 cis cis cis cis cis ~ | cis b a4 r4 gis8( a) |
	a4 cis e cis8 d ~ | d4 cis b cis8 cis ~ | cis2 r | R1 |
}
fDlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mA = \relative c {
	\key a \major
	R1 | R1 | e'8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	R1 | R1 | e8-. e-. r4 e8-. e-. r4 | e8-. e-. r4 e8-. e-. r4 |
	R1 | R1 | R1 | R1 |
	R1 | R1 | R1 | r2 r4 b8 a->-. |
	r8 d d d fis fis e e | d cis b a b cis4 b8 ~ | b4. gis16 fis e2 ~ | e4 r4 r2 |
	r8 d' d d fis fis e e | d cis b a b cis8 r b8 ~ | b4 r r2 | R1 |
	R1 | R1 | R1 | R1 |
	fis1( | g | gis2. ~ gis8) gis ~ | gis gis r gis cis4-. r |
	r4 fis,8 fis fis fis fis fis ~ | fis e fis4 r2 | r4 e8 e e e e e ~ | e e b'4 r2 |
	a1( | b2. a4 | gis4.) gis8 ~ gis dis' fis eis ~ | eis4. gis8 ~ gis4 r |
	r4 a,8 a a a a a ~ | a gis fis4 r2 | r4 a8 a a a a a ~ | a e d4 r2 |
	cis4 e gis a8 b ~ | b4 a gis a8 a ~ | a2 r | R1 |
}
mAlyric = \lyricmode {
	\set ignoreMelismata = ##t
	\override Lyrics . LyricText #'font-name = "IPAex明朝"
	\override Lyrics . LyricText #'font-size = #-1
}

mB = \relative c {
	\key a \major
	d4-. d-. d-. d-. | d d d d | e e e e | e4 e e8 e e e |
	d4 d d d | d d d d | e e e e | e4 e e8 e e16 e e e |
	cis4. cis8 cis4 r | fis,4 cis'8 fis ~ fis fis cis fis | cis4. cis8 cis4 r | fis,4 cis'8 fis ~ fis fis cis fis |
	b,4. b8 b4 r | d4. d8 d4 r | g,4 g8 d' g fis f e ~ | e e e e e e e d |
	r4 d d d | d d d d | e e e e | e4 e e8 e e e |
	d4 d d d | d d d d | e e e e | e4 e e8 e e16 e e e |
	cis4. gis'8 ~ gis4 cis, | fis,4 cis'8 fis ~ fis fis cis fis | cis4. gis'8 ~ gis4 cis, | fis,4 cis'8 fis ~ fis fis cis fis |
	b,4. fis'8 ~ fis4 b, | g4. d'8 g d g, cis ~ | cis4. cis8 ~ cis8 cis cis cis ~ | cis cis dis e f cis e d ~ |
	d d d4 d d | d d d8 a' d,-. cis ~ | cis4 cis cis cis | b b b8 fis' b, d |
	a4 a a a | a a a8 b a gis ~ | gis4 gis gis gis8-. cis ~ | cis cis dis e f cis e d ~ |
	d d d( a-.) d( a-.) d( a-.) | d a d a e' a, d a | cis a cis a cis d cis b ~ | b b fis b b fis' b, d |
	a4 a a a | b2 cis | fis1 | R1 |
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