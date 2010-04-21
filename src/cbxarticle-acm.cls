%=========================================================================
% CBX Article Class (ACM Sig Alternate Format)
%=========================================================================
% This class file formats a paper according to the ACM SIG alternate
% guidelines for 8.5 x 11 proceedings. You should use \conference,
% \title, \author, and \affiliation in your front matter and use
% \bibliographystyle{abbrv} right before you use \bibliography{}. You
% will also need to use \copyrightconf, \copyrightconfdateloc,
% \copyrightyear, and \copyrightdata for the copyright block, and set the
% appropriate \categories and \terms after the abstract. \keywords do not
% seem to be required by the ISCA guidelines.
%
% Class Options
%  - appearsin : add appears in header
%  - submitted : add submitted & do not dist. header, draft watermark
%  - draftcopy : add draft copy & do not dist. header, draft watermark
%  - blind : remove author and affiliation information
%  - pagenum : add a page number to every page
%
% Author : Christopher Batten
% Date   : April 4, 2010
%

%-------------------------------------------------------------------------
% Releveant ACM Guidelines
%-------------------------------------------------------------------------
% Page Size and Layout: All material on each page should fit within a
% rectangle of 18 X 23.5 cm (7" X 9.25"), centered on the page, beginning
% 1.9 cm (0.75") from the top of the page and ending with 2.54 cm (1")
% from the bottom. The right and left margins should be 1.9 cm (.75").
% The text should be in two 8.45 cm (3.33") columns with a .83 cm (.33")
% gutter.
%
% All body text is set in two columns. The two columns on the last page
% should be of (nearly) equal length.
%
% Normal or Body Text: The body text is set in 9-point Times Roman (cmr).
% Use sans serif or nonproportional fonts only for special purposes, such
% as distinguishing source code text. Right margins should be justified,
% not ragged. This Alternate style uses the indenting of paragraphs, to
% visually distinguish between successive paragraphs, instead of the de
% facto style which uses a full line space. This may help reduce the
% total number of pages.
%
% Title and Author Information: The title (Helvetica or Arial 18-point
% bold), authors' names (Helvetica or Arial 12point), author addresses,
% affiliations and phone number (Helvetica or Arial 10-point) and email
% address (Helvetica 12 point) run across the full width of the page. Up
% to three author names and information blocks may be aligned at the top
% of the first page; any additional author information appears in a
% paragraph at the end of the paper.
%
% References and Citations: Footnotes should be Times New Roman 9-point.
% The format of references is a numbered list at the end of the article,
% ordered alphabetically by first author, and referenced by numbers in
% brackets e.g. [1].
%
% References should be published materials accessible to the public.
% Internal technical reports may be cited only if they are easily
% accessible (i.e. you can give the address to obtain the report within
% your citation) and may be obtained by any reader. Proprietary information
% may not be cited. Private communications should be acknowledged, not
% referenced (e.g. "[Robertson, personal communication]").
%
% Page Numbering, Headers and Footers: Do not include headers or footers in
% your submission. Page numbers are not output by the sig-alternate.cls
% file.
%
% Hierarchical Section Headings: The heading of a section should be in
% Times New Roman 12 point bold in all-capitals flush left. Sections and
% subsequent subsections should be numbered and flush left.
%
% The heading of subsections should be in Times New Roman 12 point bold
% with only the initial letters capitalized. (Note: For subsections and
% subsubsections, a word like the or a is not capitalized unless it is the
% first word of the header.)
%
% The heading for subsubsections (or lower) should be in Times New Roman
% 11-point italic with initial letters capitalized.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxarticle-acm}[2010/04/04 ver 0.1]
\LoadClass[twocolumn,9pt]{extarticle}

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
% We use the mathptmx package to load the Times and Helvetica fonts.
% Normally the main text font size is set as an option when we load the
% article class, but since we need 9pt we need to use a special class
% called extarticle. We used scaled helvetica so that the caption font
% size is comparable to the main text Times font size -- well actually I
% want to use scaled helvetica but then the font sizes don't match
% exactly what the editors want. I also load packages which I pretty much
% always use (eg. graphicx, textcomp, booktabs, etc)

\RequirePackage{geometry}     % Page layout

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathptmx}     % Use times for serif font
%\RequirePackage[scaled=0.92]{helvet}
\RequirePackage{helvet}       % Use helvetica for sans serif font
\RequirePackage{courier}      % Use courier for fixed width font

\RequirePackage{caption}      % Flexibly configure captions
\RequirePackage{subfig}       % -> we should move to subcaption soon
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

\RequirePackage{indentfirst}  % Indent first paragraph for this style
\RequirePackage{setspace}     % Slightly tighter spacing

%-------------------------------------------------------------------------
% \cbxarticle@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Notice we always calculate the the line spacing to be
% 1.2 times the font size.

\newlength{\cbxarticle@Templen}
\newcommand{\cbxarticle@setfontsize}[1]
{%
  \setlength{\cbxarticle@Templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\cbxarticle@Templen}\selectfont%
}

%-------------------------------------------------------------------------
% Caption Fontsizes
%-------------------------------------------------------------------------
% Set the caption label font to be bold. Technically, I think the whole
% caption is supposed to be bold but this looks ridiculous for longer
% captions.

\DeclareCaptionFont{slightlysmaller}{\cbxarticle@setfontsize{9pt}}
\captionsetup{font={slightlysmaller},labelfont={bf},skip=6pt}
\captionsetup[subfloat]{font={slightlysmaller},labelfont={},skip=6pt}
\newcommand{\cbxcaptionsize}{\cbxarticle@setfontsize{9pt}}

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
% These are the tighter margins allowed by the sig-alternate as opposed
% to the standard sig template.

\geometry
{%
  headsep=0.15in,
  headheight=26pt,
  hmargin=0.75in,
  tmargin=0.75in,
  bmargin=1in,
  columnsep=0.33in
}

%-------------------------------------------------------------------------
% Title block
%-------------------------------------------------------------------------
% Not sure what the extra space above the title is supposed to be. From
% the sig-alternate.cls file it looks like maybe 2em? Also not sure what
% the exact inter title, author, affiliation spacing is supposed to be,
% but this looks pretty good. Note that we need the extra \email{} macro
% because ACM requires the email addresses to be larger.

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

\newcommand{\email}[1]
{%
  {\cbxarticle@setfontsize{12pt}#1\par}%
}

\renewcommand{\@maketitle}
{%
  \vspace*{0.5em}%
  \centering%
  {\cbxarticle@setfontsize{18pt}\textsf{\textbf{\@title}}\par}
  \ifthenelse{ \equal{\cbxarticle@blind}{false} }
  {%
    \vspace{14pt}%
    {\cbxarticle@setfontsize{12pt}\textsf{\@author}\par}\vspace{12pt}
    {\cbxarticle@setfontsize{10pt}\textsf{\cbxarticle@affiliation}\par}
  }{}
  \vspace{18pt}
}

%-------------------------------------------------------------------------
% Abstract
%-------------------------------------------------------------------------
% The word abstract needs to be bold, left aligned, in 12pt font. The
% abstract should _not_ be italicized. Code for categories grabbed from
% sig-alternate.cls template.

\renewenvironment{abstract}
{%
  \setlength{\parindent}{0pt}%
  \section*{Abstract}%
}{%
  \setlength{\parindent}{9pt}%
}

\newcount\catcount
\global\catcount=1

\def\category#1#2#3{%
\ifnum\catcount=1
\subsection*{Categories and Subject Descriptors}
\advance\catcount by 1\else{\unskip; }\fi
    \@ifnextchar [{\@category{#1}{#2}{#3}}{\@category{#1}{#2}{#3}[]}%
}

\def\@category#1#2#3[#4]{%
\setlength{\parindent}{0pt}%
    \begingroup
        \let\and\relax
            #1 [\textbf{#2}]%
            \if!#4!%
                \if!#3!\else : #3\fi
            \else
                :\space
                \if!#3!\else #3\kern\z@---\hskip\z@\fi
                \textit{#4}%
            \fi
    \endgroup
\setlength{\parindent}{9pt}%
}

\newcommand{\terms}[1]
{%
  \setlength{\parindent}{0pt}%
  \subsection*{General Terms}
  #1%
  \setlength{\parindent}{9pt}%
}

\newcommand{\keywords}[1]
{%
  \setlength{\parindent}{0pt}%
  \subsection*{Keywords}
  #1%
  \setlength{\parindent}{9pt}%
}

%-------------------------------------------------------------------------
% Section headers
%-------------------------------------------------------------------------
% We need to change the spacing around the section headers and also make
% sure the numbers have an extra dot at the end of the section headers
% but not subsection headers. Both headers are bold and 12pt font.
% Section headers are all caps while subsection headers are normal title
% capitalized. Code to handle the final period from here:
%
%  http://www.tex.ac.uk/cgi-bin/texfaq2html?label=seccntfmt
%

\renewcommand{\section}
{%
  \@startsection{section}{1}{\z@}%
                {-10\p@ \@plus -4\p@ \@minus -2\p@}%
                {4\p@}%
                {\baselineskip 14pt\cbxarticle@setfontsize{12pt}\bf\MakeUppercase}%
}

\renewcommand{\subsection}
{%
  \@startsection{subsection}{2}{\z@}%
                {-8\p@ \@plus -2\p@ \@minus -\p@}%
                {4\p@}%
                {\cbxarticle@setfontsize{12pt}\bf}%
}

\renewcommand*{\@seccntformat}[1]
{%
  \csname the#1\endcsname\hspace{1em}%
}

\let\@@seccntformat\@seccntformat
\renewcommand*{\@seccntformat}[1]%
{%
  \expandafter\ifx\csname @seccntformat@#1\endcsname\relax
    \expandafter\@@seccntformat
  \else
    \expandafter
      \csname @seccntformat@#1\expandafter\endcsname
  \fi
    {#1}%
}

\newcommand*{\@seccntformat@section}[1]
{%
  \csname the#1\endcsname.\hspace{1em}%
}

%-------------------------------------------------------------------------
% Float spacings
%-------------------------------------------------------------------------

\renewcommand{\dbltopfraction}{0.9}
\renewcommand{\topfraction}{0.9}
\renewcommand{\dblfloatpagefraction}{0.7}
\renewcommand{\floatpagefraction}{0.7}

\newcommand{\bsk}{\baselineskip}
\setlength{\dbltextfloatsep}{1.5\bsk plus 0.3\bsk minus 0.3\bsk}
\setlength{\floatsep}{1.5\bsk plus 0.3\bsk minus 0.3\bsk}
\setlength{\textfloatsep}{1.5\bsk plus 0.3\bsk minus 0.3\bsk}

%-------------------------------------------------------------------------
% Copyright box
%-------------------------------------------------------------------------
% This is the code for the copyright box in the lower left-hand corner.
% You need to use the following three macros to set the conference, year,
% and copyright data. The guidlines specify that 1.5" should be left for
% this box, but we also need to take into account the float spacing. I
% looked in the sig-alternate.cls file and it seems like they are only
% reserving 1" which looks much better with the smaller fontsize. So I am
% going to go with that for now and leave the floatsep in for cushion. I
% am not positive what fontsize the copyright is supposed to be. I think
% it is 8pt - it is definitely smaller than 9pt.
%
%  \copyrightconf{CONF'YY}
%  \copyrightconfdateloc{Month DD--DD, YYYY, City, Country.}
%  \copyrightyear{YYYY}
%  \copyrightdata{X-XXXXX-XX-X/XX/XX}
%

\gdef\cbxarticle@copyrightconf{}%
\newcommand{\copyrightconf}[1]
{%
  \gdef\cbxarticle@copyrightconf{#1}%
}

\gdef\cbxarticle@copyrightconfdateloc{}%
\newcommand{\copyrightconfdateloc}[1]
{%
  \gdef\cbxarticle@copyrightconfdateloc{#1}%
}

\gdef\cbxarticle@copyrightyear{}%
\newcommand{\copyrightyear}[1]
{%
  \gdef\cbxarticle@copyrightyear{#1}%
}

\gdef\cbxarticle@copyrightdata{}%
\newcommand{\copyrightdata}[1]
{%
  \gdef\cbxarticle@copyrightdata{#1}%
}

\newcommand{\makecopyrightbox}
{%
  \begin{figure}[b]
    % This roughly compensates for the floatsep, leaving exactly 1.5"
    % \vspace{-\baselineskip}
    % \setlength{\fboxsep}{0pt}
    % \fbox{%
    \begin{minipage}[b][1in][b]{\cw}\cbxarticle@setfontsize{8pt}
    Permission to make digital or hard copies of all or part of this work
    for personal or classroom use is granted without fee provided that
    copies are not made or distributed for profit or commercial advantage
    and that copies bear this notice and the full citation on the first
    page. To copy otherwise, to republish, to post on servers or to
    redistribute to lists, requires prior specific permission and/or a
    fee.\par
    \textit{\cbxarticle@copyrightconf{}},
    \cbxarticle@copyrightconfdateloc\par
    Copyright \cbxarticle@copyrightyear{} ACM
    \cbxarticle@copyrightdata{} ...\$10.00\par
    \end{minipage}%
    % }
  \end{figure}
}

%-------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------
% Make sure the final page is balanced, change inter-item spacing, and
% use raggedright.

\let\cbxarticle@oldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]
{%
  \balance
  \cbxarticle@oldthebibliography{#1}
  \setlength{\itemsep}{0.7ex}
  \raggedright
  \vspace{1ex}
}

%-------------------------------------------------------------------------
% Misc setup
%-------------------------------------------------------------------------

\setlength{\parindent}{9pt}%

% Help prevent widows and orphans

\widowpenalty=1000
\clubpenalty=1000

% The ACM guidelines have obnoxiously tight line spacing (9pt font with
% 10pt spacing). I just tighten it up a bit.

\spacing{0.99}

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
  \fancyhead[C]{\cbxarticle@setfontsize{10pt}\cbxarticle@firstpageheader}
  \fancyfoot[C]{\cbxarticle@setfontsize{10pt}\cbxarticle@footer}
}

\fancypagestyle{mainpagestyle}
{%
  \fancyhead{}
  \fancyfoot{}
  \fancyhead[C]{\cbxarticle@setfontsize{10pt}\cbxarticle@mainpageheader}
  \fancyfoot[C]{\cbxarticle@setfontsize{10pt}\cbxarticle@footer}
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

