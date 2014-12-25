% Template revision 2
%
% For Flescobaldi :
% -*- indent-width: 4; tab-width: 4; indent-tabs: true;

\version "2.18.0"

t = #(define-music-function
     (parser location note)
     (ly:music?)
   #{
	 \set Timing.baseMoment = #(ly:make-moment 1/4)
	 %\set Timing.beatStructure = #'(2 2 2 2)
	 %\set Timing.beamExceptions = #'()
     \tuplet 3/2 4 {
		 #note
	 }
	 \unset Timing.baseMoment
	 %\unset Timing.beatStructure
	 %\unset Timing.beamExceptions
   #})


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
	page-count = #3
	bookTitleMarkup = \markup {
		\column {
			\fill-line {
				"Revision 1"
				"2014/12/21"
			}
			\fill-line {
				\null
				\override #'(font-name . "TakaoEx明朝")
				\fontsize #6 "冬がはじまるよ"
				"Original by Noriyuki Makihara"
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
				\right-column {#(string-append "LilyPond - Music Notation for Everyone - Version " (lilypond-version) ", See www.lilypond.org")}
			}
		}
	}

	evenFooterMarkup = \oddFooterMarkup
}

fA = \relative c' {
	\key a \major
	\time 4/4
	\tempo 4=125
	c4-- g'-- c,-- g'-- | \t{g4 f8 e4 f8 ~ } f2 ~ | f1\fermata \bar "||"
	\change Staff = "Female3"
	fis2 \t {r4 fis8 ~} fis4 | f2 \t {r4 f8 ~} f4 | e2 \t {r4 e8 ~} e4 | e2 \t {r4 e8 ~} e4 |
	d4 \t {r4 d8 ~} d2 | d4 \t {r4 d8 ~} d2 | cis4 \t {r4 cis8 ~} cis4 ~ \t {cis cis8 ~ } | \t {cis4 cis8} cis4-. cis-. b-- |
	\change Staff = "Female4"
	a4 r r2 | gis4 r r2 | a4 r r2 | a4 r r2 |
	cis4 r r2 | cis4 r r2 | b4 r r2 | e2 d |
	cis4 ~ \t {cis cis8 ~ } cis2 | b4 ~ \t {b b8 ~ } b2 | b4 ~ \t {b b8 ~ } b2 | b4 ~ \t {b b8 ~ } b2 |
	cis4 ~ \t {cis cis8 ~ } cis2 | cis4 ~ \t {cis cis8 ~ } cis2 | d4 ~ \t {d d8 ~ } d2 | d2 b2 |
	
	e1 ~ | e4 \t{fis gis8 ~ gis4 a8 e4 a,8} | e'1 ~ | e4 \t{fis gis8 ~ gis4 a8} e4 |
    e4-. e-. e-. e-. | d-. d-. d-. d-. | ees-. ees-. c-. c-. | d \t {c b8 ~ } b4 b |
	
	g'4 ~ \t {g g8 ~} g4 ~ \t {g g8} | e4 ~ \t {e e8 ~} e4 ~ \t {e e8} | d4 ~ \t{d4 d8} b4 ~ \t {b b8} | b4 ~ \t{b4 b8} c4 ~ \t {c c8} |
	e4 ~ \t {e e8 ~} e2 | d4 ~ \t {d d8 ~} d2 | d4 ~ \t {d bes8 ~} bes2 | f'1 |
	g4---. c---. g---. c---. | \t {c4 a8 g4 a8} r2 | a2 gis | b a |
	b,4 \t {d cis8 ~ } cis4 gis' | \t { e4 fis8 gis4 fis8 ~ } fis2 | fis4 ~ \t{fis4 fis8} d4 d | cis4 ~ \t {cis cis8} cis4 ~ \t{cis4 cis8}  |
	a2 b | gis4 ~ \t {gis4 bis8 ~ } bis2 ~ | bis2 r2 | R1 |
	
	\leftBracket
	\t {cis4^\markup {\italic "ad lib. (the following is an example)"} d8 cis4 a8 r4 a8 b4 e8} | f4 aes \grace {g16 aes} g4 f | e cis4 gis' \t {cis,4 d8} | cis2 cis4 cis' |
	b4 \t {r d,8 ~ d4 a'8} fis4 | e4 \t {fis4 gis8 r4 \acciaccatura dis'8 e8 r4 gis,8} | \t {gis4 a8 b4 \acciaccatura bis8 cis8 ~ } cis4 \rightBracket \t {r4 cis,8 ~ } | \t {cis4 cis8} cis4-. cis-. b-- |
	r4 b2. ~ | b1\fermata \bar "|."
}

fB = \relative c''' {
	\key a \major
	\time 4/4
	#(define afterGraceFraction (cons 15 16))
	R1 | R | g1\fermata |
	\change Staff = "Female1"
	\leftBracket
	r4^\markup{\italic "ad lib. (the following is an example)"} \t{ r4 e,8 fis4 a8 b4 c8 ~ } | c2 \grace {b16( c} b4) a | e'2 gis,4 \t { b4 bes8 ~ } bes2 \acciaccatura bis8 \times 2/3 {cis4 d e} |
	\t {e4 \grace {eis8} fis8 r4 a,8 ~ } \afterGrace a2 {gis16 a} | gis2 \times 2/3 {gis4 a b} | \t { b4 \grace {bis8} cis8 r4 e,8 ~ } e4 \rightBracket \t {r4 e8 ~} | \t {e4 e8} e4-. e-. e-- |
	\change Staff = "Female2"
	fis4 r r2 | e4 r r2 | fis4 r r2 | e4 r r2 |
	gis4 r r2 | ais4 r r2 | a4 r r2 | a2 b |
	a4 ~ \t {a a8 ~ } a2 | gis4 ~ \t {gis gis8 ~ } gis2 | a4 ~ \t {a a8 ~ } a2 | a4 ~ \t {a a8 ~ } a2 |
	gis4 ~ \t {gis cis8 ~ } cis2 | cis4 ~ \t {cis cis8 ~ } cis2 | b4 ~ \t {b b8 ~ } b2 | a2 b2 |
	
	e1 ~ | e4 \t {fis e8 ~ e4 cis8 b4 a8} | e'1 ~ | e4 \t {fis e8 ~ e4 cis8 b4 a8} |
	\t{e'4 a,8 d4 c8 ~ c4 b8 c4 d8} | \t{e4 g,8 d'4 c8 ~ c4 b8 c4 e8} | ees2 g | g d |
	
	c4 ~ \t {c c8 ~} c4 ~ \t {c c8} | c4 ~ \t {c c8 ~} c4 ~ \t {c c8} | a4 ~ \t{a4 a8} gis4 ~ \t {gis gis8} | b4 ~ \t {b4 b8} a4 ~ \t {a4 a8} |
	c4 ~ \t {c c8 ~} c2 | c4 ~ \t {c c8 ~} c2 | d4 ~ \t {d d8 ~} d2 | c2 g' |
	e2. \t {g4 f8} | e2. \t{f4 e8} | c2 b | d c |
	cis2 b | b4 ~ \t {b cis8 ~ } cis2 | cis4 \t {d4 cis8} a4 b | a4 ~ \t {a a8} g4 ~ \t{g4 g8} |
	fis2 gis | b4 ~ \t{b4 fis8 ~ } fis2 ~ | fis2 r | R1 |
	
	\leftBracket
	r4^\markup{\italic "ad lib. (same as intro)"} \t{ r4 e8 fis4 a8 b4 c8 ~ } | c2 \grace {b16( c} b4) a | e'2 gis,4 \t { b4 bes8 ~ } bes2 \acciaccatura bis8 \times 2/3 {cis4 d e} |
	\t {e4 \grace {eis8} fis8 r4 a,8 ~ } \afterGrace a2 {gis16 a} | gis2 \times 2/3 {gis4 a b} | \t { b4 \grace {bis8} cis8 r4 e,8 ~ } e4 \rightBracket \t {r4 e8 ~} | \t {e4 e8} e4-. e-. e-- |
	r4 e2. ~ | e1\fermata |
	
}

fC = \relative c'{
	\key a \major
	\time 4/4
	c1 | d4 ~ \t{ d4 cis8 ~ } cis2 ~ | cis1\fermata |
	\change Staff = "Female2"
	a'2 \t {r4 a8 ~} a4 | gis2 \t {r4 gis8 ~} gis4 | gis2 \t {r4 gis8 ~} gis4 | g2 \t {r4 g8 ~} g4 |
	fis4 \t {r4 fis8 ~} fis2 | e4 \t {r4 e8 ~} e2 | e4 \t {r4 e8 ~} e4 ~ \t {e e8 ~} | \t {e4 e8} e4-. e-. cis-- |
	\change Staff = "Female3"
	cis4 r r2 | cis4 r r2 | d4 r r2 | b4 r r2 |
	e4 r r2 | fis4 r r2 | fis4 r r2 | fis2 e |
	fis4 ~ \t {fis fis8 ~ } fis2 | e4 ~ \t {e e8 ~ } e2 | d4 ~ \t {d d8 ~ } d2 | e4 ~ \t {e e8 ~ } e2 |
	gis4 ~ \t {gis gis8 ~ } gis2 | gis4 ~ \t {gis ais8 ~ } ais2 | fis4 ~ \t {fis fis8 ~ } fis2 | fis2 e2 |
	gis2 e4 b' | b a gis a | gis2 e4 b' | b a gis a |
	c4 \t {b4 a8 ~ a4 g8 a4 b8} | c4 \t {b4 a8 ~ a4 a8 a4 a8} | g2 c | c b |
	
	g4---. c---. g---. c---. | \t {c4 a8 g4 a8} r2 | e4 ~ \t{e4 e8} e4 ~ \t {e e8} | g4 ~ \t{g4 g8} fis4 ~ \t {fis fis8} |
	a4 ~ \t {a a8 ~} a2 | g4 ~ \t {g g8 ~} g2	| g4 ~ \t {g g8 ~} g2 | a2. \t{d4 des8} |
	c4 ~ \t {c c8 ~} c4 ~ \t {c c8} | c4 ~ \t {c f,8 ~} f2 | f4 ~ \t{f4 f8} d4 ~ \t {d d8} | e4 ~ \t{e4 e8} e4 ~ \t {e e8} |
	a2 gis | b4 ~ \t { b a8 ~ } a2 | a4 ~ \t { a4 a8 } fis4 fis | e4 ~ \t {e e8} e4 ~ \t{e4 e8} |
	cis2 e | gis4 ~ \t {gis4 dis8 ~ } dis2 ~ | dis2 r | R1 |
	
	\leftBracket
	r4^\markup {\italic "ad lib. (the following is an example)"} d4 d a' | \acciaccatura fisis8 gis2 \times 2/3 {gis4 a b} | e,2 cis4 gis' | g2 a4 g |
	\t {fis4 d8 a'4 fis8 b4 a8 b4 c8} | b4 e, gis b | \t {b4 a8 gis4 \acciaccatura gis8 a8 ~ } a4 \rightBracket \t {r4 e8 ~ } | \t{e4 e8} e4-. e-. cis-- |
	r4 cis2. ~ | cis1\fermata |
}

fD = \relative c'{
	\key a \major
	\time 4/4
	a1 | b4 ~ \t{ b bes8 ~ } bes2 | c'1\fermata |
	
    cis,2 \t {r4 cis8 ~} cis4 | d2 \t {r4 d8 ~} d4 | cis2 \t {r4 cis8 ~} cis4 | cis2 \t {r4 cis8 ~} cis4 |
	b4 \t {r4 b8 ~} b2 | gis4 \t {r4 gis8 ~} gis2 | gis4 \t {r4 gis8 ~} gis4 ~ \t {gis a8 ~} | \t {a4 a8} a4-. a-. gis-- |
	\change Staff = "Female1"
	cis4 \t{a4 b8} cis4 \t{a4 b8} | cis4 \t{cis4 fis8 e4 cis8 b4 a8 ~ } | a4 r r2 | d4 \t{cis4 a8 ~ a4 b8 ~ } b4 |
	cis4 \t{e4 cis8} e4 cis | fis \t{cis4 d8 ~ d4 e8 ~ e4 e8 ~ } | e4 \t{d4 cis8} d4 r | d \t{cis a8 ~ a4 b8 ~ } b4 |
    cis4 \t{a4 b8} cis4 \t{a4 b8} | \t {cis4 cis8 cis4 fis8 e4 cis8 b4 b8} | \t{r4 a8} r4 r2 | d4 \t{cis4 a8 ~ a4 b8 ~ } b4 |
	cis4 \t{e4 cis8} e4 cis | fis \t{cis4 d8 ~ d4 e8 ~ e4 e8 ~ } | e4 ~ \t{e4 a,8 ~ } a4 \t {r4 fis8} | d'4 \t{cis a8 ~ a4 b8 ~ b4 a8} |
	
    b4 \t{e, fis8} gis4 b | \t {b4 a8 gis4 a8 ~ } a4 \t { r4 a8 } |  b4 \t{e, fis8} gis4 b | \t {b4 a8 gis4 a8 ~ a4 a8 a4 e'8 ~ } |
    e4 ~ \t {e a,8 ~ a4 a8 a4 e'8} | e4 ~ \t {e4 a,8 ~ a4 a8 a4 a8} | g'4 f e d | \t{d4 e8 f4 e8 ~ } e2 |
    
    c4---. g'---. c,---. g'---. | \t {g4 f8 e4 f8 r4 f8 f4 f8} | e4 \t {d c8 c4 d8 c4 e8 ~ } | e2 r4 \t {r d8} |
    e4 \t{a,4 c8 ~ c4 b8 c4 d8} | e4 \t{a,4 c8 ~ c4 c8 c4 c8} | g'4 \t{f c8 r4 g8 g4 g8} | g'4 \t {f c8 c4 d8} r4 |
    c4---. g'---. c,---. g'---. | \t {g4 f8 e4 f8 r4 f8 f4 f8} | e4 \t {d c8 c4 d8 c4 e8 ~ } | e2 r2 |
    e4 ~ \t {e cis8} cis4 \t {fis4 e8 ~} | \t {e4 cis8 b4 a8 r4 a8 b4 cis8} | d4 e \t {cis4 a8 b4 a8} | R1 |
    e'4^\markup {\italic "poco riten."} ~ \t {e cis8} cis4 \t {fis4 e8 ~} | \t {e4 cis8 b4 a'8 ~} a2 ~ | a2 \t {r4^\markup {\italic "a tempo"} a,8 b4 cis8} | d4 e \t {cis4 a8 b4 a8 ~} |
    a1 ~ | a | R1 | R1 |
    R1 | R1 | r2 r4 \t {r a8 ~} | \t {a4 a8} a4-. a-. gis-- |
    r4 gis2. ~ | gis1\fermata |
}


mA = \relative c' {
	\key a \major
	\time 4/4
	g1 | g4 ~ \t{ g g8 ~ } g2 ~ | g1\fermata |
	
	a2 \t {r4 a8 ~} a4 | gis2 \t {r4 gis8 ~} gis4 | gis2 \t {r4 gis8 ~} gis4 | g2 \t {r4 g8 ~} g4 |
	fis4 \t {r4 fis8 ~} fis2 | e4 \t {r4 e8 ~} e2 | e4 \t {r4 e8 ~} e4 ~ \t {e fis8 ~} | \t {fis4 fis8} fis4-. fis-. e-- |

	cis4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis e8} | gis4 ~ \t {gis gis8 ~} gis4 ~ \t {gis e8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | e4 ~ \t {e e8 ~ } e4 ~ \t {e a8} |
	gis4 ~ \t {gis gis8 ~} gis4 ~ \t {gis gis8} | ais4 ~ \t {ais fis8 ~ } fis4 ~ \t {fis fis8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | a2 b |
	
	cis,4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis e8} | gis4 ~ \t {gis gis8 ~} gis4 ~ \t {gis e8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | e4 ~ \t {e e8 ~ } e4 ~ \t {e a8} |
	gis4 ~ \t {gis gis8 ~} gis4 ~ \t {gis gis8} | ais4 ~ \t {ais fis8 ~ } fis4 ~ \t {fis fis8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | a2 b4 a |
	
	gis4 ~ \t {gis gis8 ~} gis2 | a4 ~ \t{a a8 ~ } a4 \t{a a8} | gis4 ~ \t {gis gis8 ~} gis2 | a4 ~ \t{a a8 ~ } a4 \t{a a8} | 
	a4-. a-. a-. a-. | g-. g-. g-. g-. | c-. c-. aes-. aes-. | g \t {g gis8 ~ } gis4 gis |
	
	e4 ~ \t {e e8 ~} e4 ~ \t {e e8} | f4 ~ \t {f f8 ~} f4 ~ \t {f f8} | a4 ~ \t{a4 a8} gis4 ~ \t {gis gis8} | g4 ~ \t {g4 g8} fis4 ~ \t {fis4 fis8} |
	g4 ~ \t {g4 f8 ~ } f2 | g4 ~ \t {g4 e8 ~ } e2 | bes'4 ~ \t {bes4 g8 ~} g4 g | c4 ~ \t{c c8 ~} c4 \t {b4 bes8} |
	a4 ~ \t {a a8 ~} a4 ~ \t {a a8} | g4 ~ \t {g g8 ~} g4 ~ \t {g g8} | a4 ~ \t{a4 a8} gis4 ~ \t {gis gis8} | g4 ~ \t {g4 g8} fis4 ~ \t {fis4 fis8} |
	fis4 \t{a4 gis8 ~ gis4 b8 e4 gis,8 ~} | \t {gis4 a8 gis4 fis8 ~} fis2 | fis4 fis \t{a4 b8 ~ b4 b8} | e,4 ~ \t{e e8} a4 ~ \t {a a8} |
	fis2 gis | e4 ~ \t {e a8 ~ } a2 ~ | a2 r2 | R1 |
	
	a2 \t {r4 a8 ~} a4 | gis2 \t {r4 gis8 ~} gis4 | gis2 \t {r4 gis8 ~} gis4 | g2 \t {r4 g8 ~} g4 |
	fis4 \t {r4 fis8 ~} fis2 | e4 \t {r4 e8 ~} e2 | e4 \t {r4 e8 ~} e4 ~ \t {e fis8 ~} | \t {fis4 fis8} fis4-. fis-. e-- |
	r4 e2. ~ | e1\fermata |
}
mB = \relative c {
	\key a \major
	\time 4/4
	f1 | e4 ~ \t { e ees8 ~ } ees2 ~ | ees1\fermata |
	
	d2 \t {r4 d8 ~} d4 | d2 \t {r4 d8 ~} d4 | cis2 \t {r4 cis8 ~} cis4 | cis2 \t {r4 cis8 ~} cis4 |
	b4 \t {r4 b8 ~} b2 | b4 \t {r4 b8 ~} b2 | a4 \t {r4 a8 ~} a4 ~ \t {a d8 ~} | \t {d4 d8} d4-. d-. e,-- |
	
	fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | cis'4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis cis8} | b4 ~ \t {b b8 ~ } b4 ~ \t {b fis8} | e4 ~ \t {e e8 ~ } e4 ~ \t {e d'8} | 
	cis4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis gis8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | b4 ~ \t {b b8 ~ } b4 ~ \t {b b8} | e2 e, | 
	
	fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | cis'4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis cis8} | b4 ~ \t {b b8 ~ } b4 ~ \t {b fis8} | e4 ~ \t {e e8 ~ } e4 ~ \t {e d'8} | 
	cis4 ~ \t {cis cis8 ~ } cis4 ~ \t {cis gis8} | fis4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | b4 ~ \t {b b8 ~ } b4 ~ \t {b b8} | e2 e,4 \t{e'4 d8} | 
	
	cis4 ~ \t {cis cis8 ~ } cis2 | fis,4 ~ \t {fis fis8 ~ } fis4 ~ \t {fis fis8} | cis'4 ~ \t {cis cis8 ~ } cis2 | fis,4 ~ \t {fis fis8 ~ } fis2 |
	f4-. f-. f-. f-. | e-. e-. e-. e-. | aes-. aes-. aes-. aes-. | g \t{g e8 ~ } e4 e' |
	
	a,4 \t {a4 a8 ~ a4 a8 ~ a4 a8} | f4 \t {f4 f8 ~ f4 f8 ~ f4 f8} | b4 ~ \t{b4 b8} e4 ~ \t {e e8} | a,4 ~ \t {a4 a8} a4 ~ \t{a4 g8} |
	f4 ~ \t {f4 f8 ~ } f4 f | e4 ~ \t {e4 e8 ~ } e4 e | ees'4 ~ \t {ees4 ees8 ~} ees4 ees | d4 ~ \t{d d8} g,4 ges |
	f4 \t {f4 f8 ~ f4 f8 ~ f4 f8} | e4 \t {e4 e8 ~ e4 e8 ~ e4 e8} | d'4 ~ \t{d4 d8} e4 ~ \t {e e8} | a,4 ~ \t {a4 a8} d4 ~ \t{d4 d8} |
	b4 ~ \t{b b8} e4 ~ \t {e e8} | cis4 \t {cis4 fis,8 ~ } fis2 | b4 b \t {e e8 ~ e4 e8} | a,4 ~ \t{a a8} cis4 ~ \t{cis cis8} |
	d2 e | cis4 ~ \t {cis4 bis8 ~ } bis2 ~ | bis2 r2 | R1 |
	
	d2 \t {r4 d8 ~} d4 | d2 \t {r4 d8 ~} d4 | cis2 \t {r4 cis8 ~} cis4 | cis2 \t {r4 cis8 ~} cis4 |
	b4 \t {r4 b8 ~} b2 | b4 \t {r4 b8 ~} b2 | a4 \t {r4 a8 ~} a4 ~ \t {a d8 ~} | \t {d4 d8} d4-. d-. e,-- |
	r4 a2. ~ | a1\fermata |
}

\book{
	\score {
		<<			
			\new Staff = "Female1" <<
				\set Staff.instrumentName = "Lead"
				\set Staff.midiInstrument = "acoustic grand"
				\clef treble
				\new Voice = "VoiceFemale1" \fA
			>>
			% \new Lyrics = "LyricsFemale1"
			\new ChoirStaff <<
				\new Staff = "Female2" <<
					\set Staff.instrumentName = "Female I"
					\set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale2" \fB
				>>
				% \new Lyrics = "LyricsFemale2"

				\new Staff = "Female3" <<
					\set Staff.instrumentName = "Female II"
					\set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale3" \fC
				>>
				% \new Lyrics = "LyricsFemale3"

				\new Staff = "Female4" <<
					\set Staff.instrumentName = "Female III"
					\set Staff.midiInstrument = "acoustic grand"
					\clef treble
					\new Voice = "VoiceFemale4" \fD
				>>
				% \new Lyrics = "LyricsFemale4"

				\new Staff = "Male1" <<
					\set Staff.instrumentName = "Male"
					\set Staff.midiInstrument = "acoustic grand"
					\clef "treble_8"
					\new Voice = "VoiceMale1" \mA
				>>
				% \new Lyrics = "LyricsMale1"

				\new Staff = "Male2" <<
					\set Staff.instrumentName = "Bass"
					\set Staff.midiInstrument = "acoustic grand"
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