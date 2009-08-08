%=========================================================================
% CBX Slides Class
%=========================================================================
% This is a class for creating technical presentations.
%
% Author : Christopher Batten
% Date   : January 6, 2009
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxslides}[2008/08/17 ver 0.1]

%-------------------------------------------------------------------------
% Options
%-------------------------------------------------------------------------

\gdef\cbxslides@handout{}
\DeclareOption{handout}{\gdef\cbxslides@handout{,handout}}
\ProcessOptions

%-------------------------------------------------------------------------
% Base Class
%-------------------------------------------------------------------------

\LoadClass[mathsans,hyperref={draft}\cbxslides@handout]{beamer}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage{eulervm}
\RequirePackage[scaled]{helvet}
\RequirePackage{tikz}         

\RequirePackage{graphicx}     % To include graphics
\RequirePackage{dblfloatfix}  % Fixes some issues with dbl col floats
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{balance}      % Balance last columns
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% \cbxslides@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Notice we always calculate the the line spacing to be
% 1.2 times the font size.

\newlength{\cbxslides@templen}
\newcommand{\cbxslides@setfontsize}[1]
{%
  \setlength{\cbxslides@templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\cbxslides@templen}\selectfont%
}

%-------------------------------------------------------------------------
% Variables
%-------------------------------------------------------------------------

\gdef\cbxslides@title{}
\gdef\cbxslides@conference{}
\gdef\cbxslides@author{}
\gdef\cbxslides@affiliation{}
\gdef\cbxslides@abbrvinst{}

\gdef\cbxslides@name{}
\gdef\cbxslides@address{}
\gdef\cbxslides@email{}
\gdef\cbxslides@web{}

\renewcommand{\title}[1]{\gdef\cbxslides@title{#1}}
\newcommand{\conference}[1]{\gdef\cbxslides@conference{#1}}
\renewcommand{\author}[1]{\gdef\cbxslides@author{#1}}
\newcommand{\affiliation}[1]{\gdef\cbxslides@affiliation{#1}}
\newcommand{\abbrvinst}[1]{\gdef\cbxslides@abbrvinst{#1}}

\newcommand{\name}[1]{\gdef\cbxslides@name{#1}}
\newcommand{\address}[1]{\gdef\cbxslides@address{#1}}
\newcommand{\email}[1]{\gdef\cbxslides@email{#1}}
\newcommand{\web}[1]{\gdef\cbxslides@web{#1}}

%-------------------------------------------------------------------------
% Beamer Colors
%-------------------------------------------------------------------------

\mode<presentation>

\selectcolormodel{rgb}

\definecolor{cbxgreenA}    {RGB}{230, 248, 219}
\definecolor{cbxgreenB}    {RGB}{190, 227, 169}
\definecolor{cbxgreenC}    {RGB}{ 88, 171,  30}
\definecolor{cbxgreenD}    {RGB}{ 42,  76,  19}
\definecolor{cbxbluegreen} {RGB}{ 19,  76,  51}
\definecolor{cbxblueA}     {RGB}{223, 238, 255}
\definecolor{cbxblueB}     {RGB}{183, 206, 233}
\definecolor{cbxblueC}     {RGB}{ 69, 136, 214}
\definecolor{cbxblueD}     {RGB}{ 20,  50,  85}
\definecolor{cbxbrownA}    {RGB}{247, 243, 204}
\definecolor{cbxbrownB}    {RGB}{213, 205, 124}
\definecolor{cbxbrownC}    {RGB}{143, 132,  19}
\definecolor{cbxbrownD}    {RGB}{ 84,  67,   0}
\definecolor{cbxredA}      {RGB}{254, 217, 217}
\definecolor{cbxredB}      {RGB}{223, 167, 159}
\definecolor{cbxredC}      {RGB}{176,  24,  24}
\definecolor{cbxredD}      {RGB}{ 98,   9,   9}

\colorlet{cbxschemeA}{cbxblueA}
\colorlet{cbxschemeB}{cbxblueB}
\colorlet{cbxschemeC}{cbxblueC}
\colorlet{cbxschemeD}{cbxblueD}

\setbeamercolor{palette primary}{use=structure,fg=black,bg=structure.fg!20!white}
\setbeamercolor{palette secondary}{use=structure,fg=black,bg=structure.fg!25!white}
\setbeamercolor{palette tertiary}{use=structure,fg=black,bg=structure.fg!30!white}
\setbeamercolor{palette quaternary}{use=structure,fg=black,bg=structure.fg!35!white}

\setbeamercolor{structure}{fg=black}

\setbeamercolor{cbxheadline}{fg=cbxschemeD,bg=cbxschemeA}
\setbeamercolor{cbxfootline}{fg=cbxschemeD,bg=cbxschemeA}

\setbeamercolor*{titlelike}{bg=white,fg=black}

\setbeamercolor*{separation line}{}
\setbeamercolor*{fine separation line}{}

\setbeamercolor{section in head/foot}{palette quaternary}
\setbeamercolor{frametitle}{bg=white,fg=black}

\mode
<all>

%-------------------------------------------------------------------------
% Beamer Fonts
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamerfont{normal text}{} % ignored currently
\setbeamerfont{alerted text}{}
\setbeamerfont{example text}{}

\setbeamerfont{structure}{}
\setbeamerfont{tiny structure}{size=\tiny}

\setbeamerfont{title}{size=\Large,parent=structure}
\setbeamerfont{title in head/foot}{}
\setbeamerfont{title in sidebar}{size=\tiny}

\setbeamerfont{subtitle}{size=\normalsize,parent=title}

\setbeamerfont{author}{}
\setbeamerfont{author in head/foot}{}
\setbeamerfont{author in sidebar}{size=\tiny}

\setbeamerfont{institute}{size=\scriptsize}
\setbeamerfont{institute in head/foot}{}
\setbeamerfont{institute in sidebar}{}

\setbeamerfont{date}{}
\setbeamerfont{date in head/foot}{}
\setbeamerfont{date in sidebar}{}

\setbeamerfont{part name}{size=\Large}
\setbeamerfont{part title}{parent=title}

\setbeamerfont{section in toc}{size=\Large}
\setbeamerfont{section in toc shaded}{parent=section in toc}
\setbeamerfont{section in head/foot}{}
\setbeamerfont{section in sidebar}{size=\tiny}
\setbeamerfont{section number projected}{size=\small,parent={section in toc,projected text}}

\setbeamerfont{subsection in toc}{}
\setbeamerfont{subsection in toc shaded}{parent=subsection in toc}
\setbeamerfont{subsection in head/foot}{}
\setbeamerfont{subsection in sidebar}{}

\setbeamerfont{subsubsection in toc}{size=\footnotesize}
\setbeamerfont{subsubsection in toc shaded}{parent=subsubsection in toc}
\setbeamerfont{subsubsection in head/foot}{}
\setbeamerfont{subsubsection in sidebar}{}

\setbeamerfont{headline}{parent={tiny structure}}
\setbeamerfont{footline}{parent={tiny structure}}

\setbeamerfont{sidebar}{size=\Tiny,parent={tiny structure}}
\setbeamerfont{sidebar left}{parent=sidebar}
\setbeamerfont{sidebar right}{parent=sidebar}

\setbeamerfont{frametitle}{parent=structure,size=\Large}
\setbeamerfont{framesubtitle}{parent=frametitle,size=\footnotesize}

\setbeamerfont{caption}{size=\small}
\setbeamerfont{caption name}{parent={structure,caption}}

\setbeamerfont{button}{size=\tiny}

\setbeamerfont{block body}{}
\setbeamerfont{block body alerted}{}
\setbeamerfont{block body example}{}
\setbeamerfont{block title}{size=\large,parent={structure,block body}}
\setbeamerfont{block title alerted}{parent={block title,alerted text}}
\setbeamerfont{block title example}{parent={block title,example text}}

\setbeamerfont{item}{parent=structure}
\setbeamerfont{subitem}{parent=item}
\setbeamerfont{subsubitem}{parent=subitem}

\setbeamerfont{item projected}{size=\tiny,parent={item,projected text}}
\setbeamerfont{subitem projected}{parent=item projected}
\setbeamerfont{subsubitem projected}{parent=subitem projected}

\setbeamerfont{itemize item}{parent=item}
\setbeamerfont{itemize subitem}{parent=subitem}
\setbeamerfont{itemize subsubitem}{parent=subsubitem}

\setbeamerfont{enumerate item}{parent=item}
\setbeamerfont{enumerate subitem}{parent=subitem}
\setbeamerfont{enumerate subsubitem}{parent=subsubitem}

\setbeamerfont{itemize/enumerate body}{}
\setbeamerfont{itemize/enumerate subbody}{size=\small}
\setbeamerfont{itemize/enumerate subsubbody}{size=\footnotesize}

\setbeamerfont{description item}{parent=item}

\setbeamerfont{projected text}{parent={tiny structure}}

\setbeamerfont{abstract}{size=\small}
\setbeamerfont{abstract title}{parent={abstract,structure},size=\normalsize}

\setbeamerfont{verse}{family=\rmfamily,shape=\itshape}

\setbeamerfont{quotation}{shape=\itshape}
\setbeamerfont{quote}{parent=quotation}

\setbeamerfont{note page}{size=\small}

\setbeamerfont{title}{size=\Large,series=\bfseries}
\setbeamerfont{author}{size=\normalsize}
\setbeamerfont{institute}{size=\scriptsize}

\mode
<all>

%-------------------------------------------------------------------------
% Misc Configuration
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{navigation symbols}{}

\setbeamersize{text margin left=0.2in,text margin right=0.2in}

%\setbeamertemplate{table of contents shaded}[default][50]

\setlength{\parindent}{0pt}

\mode
<all>

%-------------------------------------------------------------------------
% Headline Template
%-------------------------------------------------------------------------

\mode<presentation>

% Format for current and non-current section names in the header
\usesectionheadtemplate
  {\hfill{\color{cbxschemeD}\textbf{\insertsectionhead}}}         % Current section
  {\hfill{\color{cbxschemeD!40!bg}\insertsectionhead}}  % Non-current section

\setbeamertemplate{headline}
{%
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxheadline}%
    \centerline{\insertsectionnavigationhorizontal{0.8\paperwidth}{}{}}%
  \end{beamercolorbox}%
  {\color{cbxschemeD}\rule{\paperwidth}{0.25pt}}
}

\mode
<all>

%-------------------------------------------------------------------------
% Title Page Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{title page}
{%
  \tiny
  \vspace{-1.9ex}
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxheadline}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=\paperwidth,ht=0pt,dp=0pt]{}
    {\color{cbxschemeD}\rule[0.045in]{\paperwidth}{0.25pt}}
  \end{beamercolorbox}%
  \vskip0pt plus 1filll
  \normalsize
  \vskip2ex
  \begin{centering}
    \vspace{0.2in}
    {\cbxslides@setfontsize{16pt}\textbf{\cbxslides@title}}\par%
    \vspace{0.1in}
    {\cbxslides@setfontsize{14pt}\cbxslides@author}\par%
    \vspace{0.4in}
    {\cbxslides@setfontsize{11pt}\cbxslides@affiliation}\par%
    \vspace{0.2in}
  \end{centering}
  \vskip0pt plus 1filll
  \tiny
  \begin{beamercolorbox}[wd=\paperwidth,ht=0pt,dp=0pt]{}
    {\color{cbxschemeD}\rule[-0.013in]{\paperwidth}{0.25pt}}
  \end{beamercolorbox}%
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxfootline}
  \end{beamercolorbox}%
}

\mode
<all>

%-------------------------------------------------------------------------
% Frame Title Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{frametitle}
{
  \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
  \@tempdima=\textwidth%
  \advance\@tempdima by\beamer@leftmargin%
  \advance\@tempdima by\beamer@rightmargin%
  \begin{beamercolorbox}[sep=0.3cm,left,wd=\the\@tempdima]{frametitle}
    \centering
    \usebeamerfont{frametitle}%
    \vbox{}\vskip-1ex%
    \if@tempswa\else\csname beamer@fteleft\endcsname\fi%
    \strut\textbf{\insertframetitle}\strut\par%
    {%
      \ifx\insertframesubtitle\@empty%
      \else%
      {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
      \fi
    }%
    \vskip-1.5ex%
    \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
    \rule{0.95\paperwidth}{0.5pt}
  \end{beamercolorbox}%
  \vspace{-0.1in}
}

\mode
<all>

%-------------------------------------------------------------------------
% Footline Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{footline}
{%
  {\color{cbxschemeD}\rule{\paperwidth}{0.25pt}}
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.3ex,dp=1.4ex,
     leftskip=.15cm,rightskip=.15cm]{cbxfootline}
    \parbox{1in}{\cbxslides@abbrvinst} \hfill \cbxslides@name \hfill \parbox{1in}{\hfill\insertframenumber~/~\ref{finalslide}}
  \end{beamercolorbox}%
  \vskip0pt%
}

\mode
<all>

%-------------------------------------------------------------------------
% Handouts
%-------------------------------------------------------------------------

\mode<handout>
{%
  \RequirePackage{pgfpages}
  \pgfpagesuselayout{resize to}[letterpaper,landscape,border shrink=0.25in]
  \pgfpageslogicalpageoptions{1}{border code=\pgfstroke} 
}

% Use this macro inside overlay specifications to indicate that the
% corresponding object should only be shown on certain handout pages.
% The following will include the second graphic as the first page of the
% handout and the third graphic as the second page.
%
%  \includegraphics<1\h0>{figure-0.pdf}
%  \includegraphics<2\h1>{figure-1.pdf}
%  \includegraphics<3\h2>{figure-2.pdf}
%

\def\h#1{| handout:#1}

%-------------------------------------------------------------------------
% Useful Macros
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
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}


