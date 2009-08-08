%=========================================================================
% CBX Article Class
%=========================================================================
% This class file formats a paper according to the IEEE Computer Society
% Guidelines for 8.5 x 11 proceedings. You should use \conference,
% \title, \author, and \affiliation in your front matter and use
% \cbxbib right before you use \bibliography{}. The relevant guidelines
% are listed below. Note that I don't try to implement centered captions
% nor positioning the table captions above the tables since these just
% don't seem to make sense for captions which are more than just a
% title. Although this class can be used for IEEE Computer Society
% publications I also have code below which breaks the guidelines but
% makes it look better in my opinion.
%
% Class Options
%  - appearsin  : add appears in header
%  - submitted  : add submitted & do not dist. header, draft watermark 
%  - draftcopy  : add draft copy & do not dist. header, draft watermark
%  - blind      : remove author and affiliation information
%  - pagenum    : add a page number to every page
%
% Author : Christopher Batten 
% Date : February 3, 2009
%

%-------------------------------------------------------------------------
% Releveant IEEE Computer Society Guidelines
%-------------------------------------------------------------------------
% All printed material, including text, illustrations, and charts, must
% be kept within a print area of 6.5in x 8.875in. All text must be in
% two column format. Columns are to be separated by 0.375in.
%
% The primary title should begin 1.375in from the top of the page,
% centered, in Times 14pt boldface type. Leave two 12pt blank lines
% after the title. Author names and affiliations are to be centered
% beneath the title and printed in Times 12pt non-boldface type.
% Multiple authors may be shown in a two- or three-column forma, with
% their affiliations italicized and centered below their respective
% names. Author information should be followed by two 12pt blank lines.
%
% Abstract is to be in fully-justified italicized text, at the top of
% the first left-hand column. Use the word "Abstract" as the title in
% 12pt Times, boldface type, centered relative to the column, initially
% capitalized. The abstract is to be in 10pt, single-spaced type, and up
% to 150 words in length. Leave two blank lines after the abstract, then
% begin the main text.
%
% Main text should be 10pt Times, single-spaced All paragraphs should
% be indented 0.25in. Figure and table captions should be 10pt boldface
% helvetica. Callouts should be 9pt non-boldface Helvetica. Initially
% capitalize only the first word of each figure caption or table title.
% Figures and tables must be numbered separately. Figure captions are
% to be centered below the figures. Table titles are to be centered
% above the tables.
%
% Section headers should be Times 12pt boldface, initially capitalized,
% flush left, with one blank line before, and one blank line after. Use
% a period after the heading number, not a colon. Subsection headers
% should be Times 11pt boldface, initially capitalized, flush left, with
% one blank line before, and one after.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxarticle}[2009/02/04 ver 0.1]
\LoadClass[10pt,twocolumn]{article}

%-------------------------------------------------------------------------
% Options
%-------------------------------------------------------------------------
% These are the options which you can pass when you call \documentclass.
%
%  - appearsin  : appears in header
%  - submitted  : submitted & do not distribute header, draft watermark
%  - draftcopy  : draft copy & do not distribute header, draft watermark
%  - blind      : remove author and affiliation information
%  - pagenum    : add a page number to every page
%

\gdef\cbxarticle@draftcopy{false}
\gdef\cbxarticle@appearsin{false}
\gdef\cbxarticle@submitted{false}
\gdef\cbxarticle@pagenum{false}
\gdef\cbxarticle@blind{false}

\DeclareOption{appearsin}{\gdef\cbxarticle@appearsin{true}}
\DeclareOption{submitted}{\gdef\cbxarticle@submitted{true}}
\DeclareOption{draftcopy}{\gdef\cbxarticle@draftcopy{true}}
\DeclareOption{pagenum}{\gdef\cbxarticle@pagenum{true}}
\DeclareOption{blind}{\gdef\cbxarticle@blind{true}}
\ProcessOptions

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------
% We use the mathptmx package to load the Times and Helvetica fonts. The
% main text font size is set as an option when we load the article
% class. We used scaled helvetica so that the caption font size is
% comparable to the main text Times font size. I also load packages
% which I pretty much always use (eg. graphicx, textcomp, booktabs, etc)

\RequirePackage{geometry}
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.92]{helvet}
\RequirePackage{caption}
\RequirePackage{subfig}

\RequirePackage{graphicx}     % To include graphics
\RequirePackage{dblfloatfix}  % Fixes some issues with dbl col floats
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{balance}      % Balance last columns
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% \cbxarticle@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Subsection headers are supposed to be 11pt, but there
% is no equivalent built-in LaTeX font size which corresponds to 11pt
% (normalsize is 10pt and large is 12pt). Notice we always calculate the
% the line spacing to be 1.2 times the font size.

\newlength{\cbxarticle@Templen}
\newcommand{\cbxarticle@setfontsize}[1]
{%
  \setlength{\cbxarticle@Templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\cbxarticle@Templen}\selectfont%
}

%-------------------------------------------------------------------------
% Caption Fontsizes
%-------------------------------------------------------------------------
% Set the caption font to be sans-serif,bold and the sub-figure caption
% font to be just sans-serif. 
%
% \captionsetup{font={sf,bf},skip=6pt}
% \captionsetup[subfloat]{font={sf},skip=6pt}
%
% The bold helvetica captions are pretty ugly. So here we can override
% the caption font to be much nicer. We use Times, a slightly smaller
% font size, and bold the caption label. You will need to comment this
% out to be strictly conforming, and uncomment the above.

\DeclareCaptionFont{slightlysmaller}{\cbxarticle@setfontsize{9.4pt}}
\captionsetup{font={slightlysmaller},labelfont={bf},skip=6pt}
\captionsetup[subfloat]{font={slightlysmaller},labelfont={},skip=6pt}
\newcommand{\cbxcaptionsize}{\cbxarticle@setfontsize{9.4pt}}

% Sometimes we want to manually create subfigure labels. For example we
% might have three subfigures but they are really subplots in a single
% pdf. We can use the following macro to create the subfigure captions.
% It takes two arguments: the first is the width of the subfigure
% caption and the second is the subfigure text. Put your label in the
% subfigure text.

\newcommand{\cbxsubfigcaption}[2]{\subfloat[#2]{\rule{#1}{0pt}}}

%-------------------------------------------------------------------------
% Page layout
%-------------------------------------------------------------------------
% Technically the margins should all be 1in except for the bottom margin
% which should be 1.125in and the column separation should be 0.375in.
% This corresponds to these parameters:
%
%  hmargin=1in,tmargin=1in,bmargin=1.125in,columnsep=0.375in
%
% You can play with these margins a bit and they probably won't notice
% 0.05in here or there.

\geometry
{%
  headheight=15pt,hmargin=0.95in,tmargin=1in,bmargin=1in,columnsep=0.3in
}

%-------------------------------------------------------------------------
% Title block
%-------------------------------------------------------------------------
% The title should have an extra 0.375in of vspace above it and be in
% 14pt bold Times. Then 24pt of white space before the author names and
% affiliations which should be in 12pt Times. Affiliations should be
% italicized. After the affiliations there should be another 24pt of
% white space.

\gdef\cbxarticle@conference{}%
\newcommand{\conference}[1]
{%
  \gdef\cbxarticle@conference{#1}%
}

\gdef\cbxarticle@affiliation{}%
\newcommand{\affiliation}[1]
{%
  \gdef\cbxarticle@affiliation{#1}%
}

\renewcommand{\@maketitle}
{%
  % Technically this top vspace should be 0.375in to be conforming
  \ifthenelse{ \equal{\cbxarticle@blind}{false} }
  {%
    \vspace*{0.2in}%
  }{%
    \vspace*{0.2in}%
  }
  \centering
  {\cbxarticle@setfontsize{14pt}\bf\@title\par}
  \ifthenelse{ \equal{\cbxarticle@blind}{false} }
  {%
    % Technically this top vspace should be 24pt to be conforming
    \vspace{20pt}%
    {\cbxarticle@setfontsize{12pt}\@author\par}\vspace{6pt}
    {\cbxarticle@setfontsize{12pt}\itshape\cbxarticle@affiliation\par}
  }{}
  \vspace{20pt}
}

%-------------------------------------------------------------------------
% Abstract
%-------------------------------------------------------------------------
% The word abstract needs to be bold, centered, and in 12pt font. The
% abstract should be italicized. The space below the abstract should
% be 24pt but here I only leave one line.

\renewenvironment{abstract}
{%
  \centerline{\cbxarticle@setfontsize{12pt}\bf Abstract}%
  \vspace*{10pt}%
  \itshape%
}{}

%-------------------------------------------------------------------------
% Section headers
%-------------------------------------------------------------------------
% We need to change the spacing around the section headers and also
% make sure the numbers have an extra dot at the end. Both headers are
% bold and section headers are 12pt while subsection headers are 11pt.
% The space below the two headers is not really a whole line but using
% the same space above and below a section header seems like bad
% practice since it makes it harder to see the structure.

\renewcommand{\section}
{%
  \@startsection{section}{1}{\z@}%
                {12pt plus 2pt minus 2pt}%
                {8pt plus 2pt minus 3pt}%
                {\cbxarticle@setfontsize{12pt}\bf}%
}

\renewcommand{\subsection}
{%
  \@startsection{subsection}{2}{\z@}%
                {10pt plus 2pt minus 2pt}%
                {6pt plus 2pt minus 3pt}%
                {\cbxarticle@setfontsize{11pt}\bf}%
}

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\hspace{0.5em}}
\renewcommand{\@seccntformat}[2]{\csname the#1\endcsname.\hspace{0.5em}}

%-------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------
% Make sure the final page is balanced.

\newcommand{\cbxbib}
{%
  \renewcommand{\baselinestretch}{0.95}
  \balance
  \bibliographystyle{cbx}
}

%-------------------------------------------------------------------------
% Float spacings
%-------------------------------------------------------------------------

\renewcommand{\dbltopfraction}{0.9}
\renewcommand{\topfraction}{0.9}
\renewcommand{\dblfloatpagefraction}{0.7}
\renewcommand{\floatpagefraction}{0.7}

\newcommand{\bsk}{\baselineskip}
\setlength{\dbltextfloatsep}{1\bsk plus 0.2\bsk minus 0.2\bsk}
\setlength{\floatsep}{1\bsk plus 0.2\bsk minus 0.2\bsk}
\setlength{\textfloatsep}{1\bsk plus 0.2\bsk minus 0.2\bsk}

%-------------------------------------------------------------------------
% Process class options
%-------------------------------------------------------------------------

% Default headers

\renewcommand{\headrulewidth}{0.0in}
\newcommand{\cbxarticle@firstpageheader}{}
\newcommand{\cbxarticle@mainpageheader}{}
\newcommand{\cbxarticle@footer}{}

% Appears

\ifthenelse{ \equal{\cbxarticle@appearsin}{true} }
{%
  \renewcommand{\cbxarticle@firstpageheader}
  {%
    \vspace{0.1in}\itshape%
    Appears in the Proceedings of the \cbxarticle@conference%
  }
}{}

% Submitted

\ifthenelse{      \equal{\cbxarticle@appearsin}{false} 
             \AND \equal{\cbxarticle@submitted}{true}  }
{%
  \RequirePackage[firstpage]{draftwatermark}
  \SetWatermarkLightness{0.9}
  \renewcommand{\cbxarticle@firstpageheader}
  {%
    \itshape --- Please Do Not Redistribute --- \\
    Submitted to the \cbxarticle@conference%
  }
  \renewcommand{\cbxarticle@mainpageheader}
  {%
    \itshape --- Please Do Not Redistribute ---%
  }
}{}

% Draft Copy

\ifthenelse{      \equal{\cbxarticle@appearsin}{false} 
             \AND \equal{\cbxarticle@submitted}{false} 
             \AND \equal{\cbxarticle@draftcopy}{true}  }
{%
  \RequirePackage[firstpage]{draftwatermark}
  \SetWatermarkLightness{0.9}
  \renewcommand{\cbxarticle@firstpageheader}
  {%
    \itshape --- Please Do Not Redistribute --- \\
    Draft Copy for the \cbxarticle@conference%
  }
  \renewcommand{\cbxarticle@mainpageheader}
  {%
    \itshape --- Please Do Not Redistribute ---%
  }
}{}

% Page Numbers

\ifthenelse{ \equal{\cbxarticle@pagenum}{true} }
{%
  \renewcommand{\cbxarticle@footer}{\thepage}%
}

%-------------------------------------------------------------------------
% Setup page styles
%-------------------------------------------------------------------------

\fancypagestyle{firstpagestyle}
{%  
  \fancyhead{}
  \fancyfoot{}
  \fancyhead[C]{\cbxarticle@firstpageheader}
  \fancyfoot[C]{\cbxarticle@footer}
}

\fancypagestyle{mainpagestyle}
{%
  \fancyhead{}
  \fancyfoot{}
  \fancyhead[C]{\cbxarticle@mainpageheader}
  \fancyfoot[C]{\cbxarticle@footer}
}

\let\cbxarticle@oldmaketitle\maketitle
\renewcommand{\maketitle}
{%
  \cbxarticle@oldmaketitle
  \thispagestyle{firstpagestyle}
}

\pagestyle{mainpagestyle}

%-------------------------------------------------------------------------
% Useful macros
%-------------------------------------------------------------------------

\newenvironment{cbxlist}[4][\textbullet]
{%
  \begin{list}{#1}
  {%
    \setlength{\leftmargin}{#2}
    \setlength{\rightmargin}{#3}
    \setlength{\topsep}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\itemsep}{#4}
  }
}{%
  \end{list}
} 

\newenvironment{cbxindent}[2]
{%
  \begin{list}{}
  {
    \setlength{\leftmargin}{#1}
    \setlength{\rightmargin}{#2}
    \item
  }
}{%
  \end{list}
}

\newcommand{\annotate}[1]{{\color{red}\bfseries [ #1 ]}}
\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wunits}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\texttilde}{{\char'176}}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}
