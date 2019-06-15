%=========================================================================
% CBX Article Class
%=========================================================================
% This class file formats a paper according to the conference submission
% guidelines. You should use \conference, \title, \author, and
% \affiliation in your front matter. The relevant guidelines are listed
% below.
%
% Class Options
%  - appearsin  : add appears in header
%  - submitted  : add submitted & do not dist. header, draft watermark
%  - draftcopy  : add draft copy & do not dist. header, draft watermark
%  - submission : remove author information, confidential header, page num
%  - pagenum    : add a page number to every page
%  - shownotes  : show notes
%
% Author : Christopher Batten
% Date : May 26, 2015
%

%-------------------------------------------------------------------------
% Formatting Guidlines
%-------------------------------------------------------------------------
% Currently using guidelines from last year:
%
%  http://asplos15.bilkent.edu.tr/submission.html
%
% All submissions should contain a maximum of 11 pages of single-spaced
% two-column text not including references. You may include any number of
% pages for references, but see webpage for more instructions.
%
%  Page limit                  11 pages
%  Paper size                  US Letter 8.5in x 11in
%  Top margin                  1in
%  Bottom margin               1in
%  Left margin                 0.75in
%  Right margin                0.75in
%  Separation between columns  0.25in
%  Body font                   10pt
%  Abstract font               10pt, italicized
%  Section heading font        12pt, bold
%  Subsection heading font     10pt, bold
%  Caption font                9pt, bold
%  References                  8pt, no page limit, list all authors
%
% Please ensure that you include page numbers with your submission. This
% makes it easier for the reviewers to refer to different parts of your
% paper when they provide comments. Please ensure that your submission
% has a banner at the top of the title page, which contains the
% submission number and the notice of confidentiality.
%
% Author List. All submissions are double blind. Therefore, please do not
% include any author names in the submission. You must also ensure that
% the metadata included in the PDF does not give away the authors. If you
% are improving upon your prior work, refer to your prior work as a third
% person.
%
% Figures and Tables. Ensure that the figures and tables are legible.
% Please also ensure that you refer to your figures in the main text.
% Many reviewers print the papers in gray-scale. Therefore, if you use
% colors for your figures, ensure that the different colors are
% distinguishable in gray-scale.
%
% References. There is no length limit for references. Each reference
% must explicitly list all authors of the paper. Papers not meeting this
% requirement will be rejected. Authors of NSF proposals should be
% familiar with this requirement. Knowing all authors of related work
% will help find the best reviewers. Since there is no length limit for
% the number of pages used for references, there is no need to save space
% here.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxarticle}[2012/06/02 ver 0.1]
\LoadClass[twocolumn,10pt]{article}

%-------------------------------------------------------------------------
% Options
%-------------------------------------------------------------------------
% These are the options which you can pass when you call \documentclass.
%
%  - appearsin  : add appears in header
%  - submitted  : add submitted & do not dist. header, draft watermark
%  - draftcopy  : add draft copy & do not dist. header, draft watermark
%  - submission : remove author information, confidential header, page num
%  - pagenum    : add a page number to every page
%  - shownotes  : show notes
%

\gdef\cbxarticle@draftcopy{false}
\gdef\cbxarticle@appearsin{false}
\gdef\cbxarticle@submitted{false}
\gdef\cbxarticle@pagenum{false}
\gdef\cbxarticle@shownotes{false}
\gdef\cbxarticle@submission{false}

\DeclareOption{appearsin}{\gdef\cbxarticle@appearsin{true}}
\DeclareOption{submitted}{\gdef\cbxarticle@submitted{true}}
\DeclareOption{draftcopy}{\gdef\cbxarticle@draftcopy{true}}
\DeclareOption{pagenum}{\gdef\cbxarticle@pagenum{true}}
\DeclareOption{shownotes}{\gdef\cbxarticle@shownotes{true}}
\DeclareOption{submission}{\gdef\cbxarticle@submission{true}}
\ProcessOptions

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------
% We use the mathptmx package to load the Times and Helvetica fonts. The
% main text font size is set as an option when we load the article
% class. We used scaled helvetica so that the caption font size is
% comparable to the main text Times font size. I also load packages
% which I pretty much always use (eg. graphicx, textcomp, booktabs, etc)

\RequirePackage{geometry}     % Page layout

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathptmx}     % Use times for serif font
\RequirePackage[scaled=0.92]{helvet} % Use helvetica for sans serif font
%\RequirePackage{courier}      % Use courier for fixed width font

\RequirePackage{caption}      % updated version of caption
\RequirePackage{subcaption}   %  ... which includes the subcaption pkg
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{dblfloatfix}  % Fixes some issues with dbl col floats
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{balance}      % Balance last columns
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text
\RequirePackage{afterpage}    % Add code after this page
\RequirePackage{array}        % Extra table formatting
\RequirePackage{comment}      % For adding comment blocks
\RequirePackage{lipsum}       % Lorem Ipsum?

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% linespacing
%-------------------------------------------------------------------------

\renewcommand{\baselinestretch}{0.95}

%-------------------------------------------------------------------------
% specialcomment
%-------------------------------------------------------------------------

\specialcomment{acknowledgments}
{%
  \section*{Acknowledgments}
}{%
}

\ifthenelse{ \equal{\cbxarticle@submission}{true} }
{%
  \excludecomment{acknowledgments}%
}{%
}

%-------------------------------------------------------------------------
% \cbxarticle@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Subsection headers are supposed to be 11pt, but there
% is no equivalent built-in LaTeX font size which corresponds to 11pt
% (normalsize is 10pt and large is 12pt). Notice we always calculate the
% the line spacing to be 1.2 times the font size.

\newlength{\cbxarticle@Templen}
\newcommand{\cbxsetfontsize}[1]
{%
  \setlength{\cbxarticle@Templen}{#1 * \real{1.19}}%
  \fontsize{#1}{\the\cbxarticle@Templen}\selectfont%
}

%-------------------------------------------------------------------------
% Caption Fontsizes
%-------------------------------------------------------------------------

\DeclareCaptionFont{capfont}{\cbxsetfontsize{9pt}}
\newcommand{\cbxcaptionsize}{\cbxsetfontsize{9pt}}

% Main caption setup

\captionsetup
{%
  font={capfont},%
  labelfont={bf},%
  skip=8pt%
}

% Subcaption setup

\captionsetup[sub]
{%
  font={capfont},%
  labelfont={},%
  skip=8pt,%
  justification=centering,%
  labelformat=simple%
}

% Parens

\DeclareCaptionSubType{figure}
\renewcommand{\thesubfigure}{(\alph{subfigure})}

\DeclareCaptionSubType{table}
\renewcommand{\thesubtable}{(\alph{subtable})}

\newcommand{\subrefs}[3]
{%
  \mbox{\ref{#1}\subref{#1-#2}--\subref{#1-#3}}%
}

%-------------------------------------------------------------------------
% Assembly block formatting
%-------------------------------------------------------------------------

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \parbox{1.5ex}{\raggedleft\theFancyVerbLine} #1%
}

%-------------------------------------------------------------------------
% Page layout
%-------------------------------------------------------------------------
% Technically the top/bottom margins should all be 1in, the left/right
% margins should be 0.75in, and the column separation should be 0.25in.
% This corresponds to these parameters:
%
%  hmargin=0.75in,vmargin=1in,columnsep=0.25in
%
% You can play with these margins a bit and they probably won't notice
% 0.05in here or there.
%

\ifthenelse{ \equal{\cbxarticle@shownotes}{false} }%
{
  \geometry
  {%
    paperheight=11in,
    headsep=20pt,
    headheight=15pt,
    tmargin=1in,         % should be 1in
    bmargin=1in,         % should be 1in
    columnsep=0.25in,    % should be 0.25in
    paperwidth=8.5in,
    hmargin=0.75in,
    marginparwidth=0in,
  }
}{
  \geometry
  {%
    paperheight=11in,
    headsep=20pt,
    headheight=15pt,
    vmargin=1in,
    tmargin=1in,         % should be 1in
    bmargin=1in,         % should be 1in
    columnsep=0.25in,    % should be 0.25in
    paperwidth=10.5in,
    hmargin=1.75in,
    marginparwidth=1.5in,
  }
}

%-------------------------------------------------------------------------
% Title block
%-------------------------------------------------------------------------

\gdef\cbxarticle@papernum{}%
\newcommand{\papernum}[1]
{%
  \gdef\cbxarticle@papernum{#1}%
}

\gdef\cbxarticle@confabbr{}%
\newcommand{\confabbr}[1]
{%
  \gdef\cbxarticle@confabbr{#1}%
}

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
  \centering
  {\cbxsetfontsize{16pt}\textbf{\@title}\par}
  \ifthenelse{ \equal{\cbxarticle@submission}{false} }
  {%
    \vspace{5pt}%
    {\cbxsetfontsize{10pt}\@author\par}
    {\cbxsetfontsize{10pt}\cbxarticle@affiliation\par}
  }{}
  \vspace{20pt}
}

%-------------------------------------------------------------------------
% Abstract
%-------------------------------------------------------------------------
% The word abstract needs to be bold, centered, and in 12pt font. The
% abstract should be italicized.

\renewenvironment{abstract}
{%
  \centerline{\cbxsetfontsize{12pt}\bf Abstract}%
  \vspace*{5pt}%
  \itshape%
}{%
}

%-------------------------------------------------------------------------
% Section headers
%-------------------------------------------------------------------------
% We need to change the spacing around the section headers and also
% make sure the numbers have an extra dot at the end. Both headers are
% bold and section headers are 12pt while subsection headers are 10pt.
% The space below the two headers is not really a whole line but using
% the same space above and below a section header seems like bad
% practice since it makes it harder to see the structure.

\renewcommand{\section}
{%
  \@startsection{section}{1}{\z@}%
                {8pt plus 2pt minus 2pt}%
                {6pt plus 2pt minus 3pt}%
                {\cbxsetfontsize{12pt}\bf}%
%                {\cbxsetfontsize{12pt}\bf\MakeUppercase}%
}

\renewcommand{\subsection}
{%
  \@startsection{subsection}{2}{\z@}%
                {6pt plus 2pt minus 2pt}%
                {4pt plus 2pt minus 2pt}%
                {\cbxsetfontsize{10pt}\bf}%
}

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\hspace{0.5em}}
\renewcommand{\@seccntformat}[2]{\csname the#1\endcsname.\hspace{0.5em}}

%-------------------------------------------------------------------------
% Widow/Orphans
%-------------------------------------------------------------------------

\widowpenalty10000
\clubpenalty10000

%-------------------------------------------------------------------------
% Float spacings
%-------------------------------------------------------------------------

\renewcommand{\dbltopfraction}{0.99}
\renewcommand{\topfraction}{0.99}
\renewcommand{\dblfloatpagefraction}{0.99}
\renewcommand{\floatpagefraction}{0.99}

\newcommand{\bsk}{\baselineskip}
\setlength{\dbltextfloatsep}{0.8\bsk plus 0.2\bsk minus 0.2\bsk}
\setlength{\floatsep}{1\bsk plus 0.2\bsk minus 0.2\bsk}
\setlength{\textfloatsep}{1\bsk plus 0.2\bsk minus 0.2\bsk}

%-------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------
% Make sure the final page is balanced and change inter-item spacing.

\let\cbxarticle@oldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]
{%
  \balance%
  \raggedright%
  \cbxarticle@oldthebibliography{#1}%
  \setlength{\itemsep}{-0.2ex}%
  \cbxsetfontsize{8pt}%
  \vspace{0.5ex}%
}

%-------------------------------------------------------------------------
% Process class options
%-------------------------------------------------------------------------

% Default headers

\renewcommand{\headrulewidth}{0.0in}
\newcommand{\cbxarticle@firstpageheader}{}
\newcommand{\cbxarticle@mainpageheader}{}
\newcommand{\cbxarticle@footer}{}

% Submission

\ifthenelse{ \equal{\cbxarticle@submission}{true} }
{%
  \renewcommand{\cbxarticle@firstpageheader}
  {%
    \vspace{0.1in}%
    \cbxarticle@confabbr{} Submission \#\cbxarticle@papernum{} --
    Confidential Draft --
    Do Not Distribute!!
  }
  \renewcommand{\cbxarticle@footer}{\thepage}%
}{}

% Appears

\ifthenelse{ \equal{\cbxarticle@appearsin}{true} }
{%
  \renewcommand{\cbxarticle@firstpageheader}
  {%
    \vspace*{-0.1in}\itshape%
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
    \vspace*{-0.15in}\itshape --- Please Do Not Redistribute --- \\
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

\ifthenelse{     \equal{\cbxarticle@pagenum}{true}
             \OR \equal{\cbxarticle@submission}{true} }
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
% notes
%-------------------------------------------------------------------------

% Basic inline note

\ifthenelse{ \equal{\cbxarticle@shownotes}{true} }%
{%
  \newcommand{\note}[1]
  {%
    {\color{red}\sffamily\footnotesize[\thinspace#1\thinspace]}%
  }
}{%
  \newcommand{\note}[1]{}%
}%

% Description of paragraph that will end up in the margin

\ifthenelse{ \equal{\cbxarticle@shownotes}{true} }%
{%
  \newcommand{\pnote}[1]
  {%
    \marginpar%
    {%
      \raggedright\color{red}\sffamily\footnotesize{}%
      \textparagraph{} #1%
    }%
  }
}{%
  \newcommand{\pnote}[1]{}%
}%

% Margin note

\ifthenelse{ \equal{\cbxarticle@shownotes}{true} }%
{%
  \newcommand{\mnote}[2][none]
  {%
    \ifthenelse{ \equal{#1}{none} }%
    {%
      \marginpar{\raggedright\color{red}\sffamily\footnotesize{}#2}%
    }{%
      \marginpar{\raggedright\color{red}\sffamily\footnotesize{}#1. #2}%
    }%
  }%
}{%
  \newcommand{\mnote}[2][none]{}
}%

% Numbered margin note (like a footnote)

\newcounter{cbxarticle@mnotecounter}

\ifthenelse{ \equal{\cbxarticle@shownotes}{true} }%
{%
  \newcommand{\fnote}[1]
  {%
    \stepcounter{cbxarticle@mnotecounter}%
    \textsuperscript{\color{red}\sffamily\thecbxarticle@mnotecounter}%
    \marginpar%
    {%
      \raggedright\color{red}\sffamily\footnotesize{}%
      \thecbxarticle@mnotecounter. #1%
    }%
  }%
}{%
  \newcommand{\fnote}[1]{}
}%

% Note mark

\ifthenelse{ \equal{\cbxarticle@shownotes}{true} }%
{%
  \newcommand{\N}[1]
  {%
    \textsuperscript{\color{red}\sffamily#1}%
  }
}{%
  \newcommand{\N}[1]{}
}

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

\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}

%-------------------------------------------------------------------------
% Compact formatting
%-------------------------------------------------------------------------

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}
\newcommand{\mmsq}{mm\tsup{2}}
\newcommand{\umsq}{\textmu{}m\tsup{2}}

\newcommand{\tsup}[1]{\textsuperscript{#1}}
\newcommand{\tsub}[1]{\textsubcript{#1}}

\renewcommand{\paragraph}[1]
{%
  \smallskip\textbf{#1} --%
}

