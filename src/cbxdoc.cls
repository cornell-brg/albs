%=========================================================================
% CBX Document Class
%=========================================================================
% This class file is for generic documents such as reports, problem sets,
% and laboratory assignments. It uses the Palatino font which is a nice
% sans serif font, and at least a little more modern than the ironically
% named Computer Modern default. The class file puts the title and
% subtitle at the top of each page and page numbers are centered at the
% bottom.
%
% Author : Christopher Batten
% Date   : September 6, 2010
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxdoc}[2010/09/06 ver 0.1]
\LoadClass[11pt]{article}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathpazo}     % Use palatino for serif font
\linespread{1.05}             % http://www.tug.dk/FontCatalogue/palatino

\RequirePackage{geometry}     % Page layout
\RequirePackage{caption}      % Flexibly configure captions
\RequirePackage{subfig}       % -> we should move to subcaption soon
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text
\RequirePackage{datetime}     % Date/time formatting
\RequirePackage{url}          % Format URLs

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

\RequirePackage{cbxcommon}    % Common macros across all class files

%-------------------------------------------------------------------------
% Document Parameters
%-------------------------------------------------------------------------

\renewcommand{\title}[1]      {\gdef\cbx@title{#1}}
\newcommand{\subtitle}[1]     {\gdef\cbx@subtitle{#1}}
\renewcommand{\author}[1]     {\gdef\cbx@author{#1}}
\newcommand{\institution}[1]  {\gdef\cbx@institution{#1}}

%-------------------------------------------------------------------------
% Misc Setup
%-------------------------------------------------------------------------

% Setup date/time formats suitable for revision numbers

\newdateformat{revdate}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}
\newtimeformat{revtime}{\twodigit{\THEHOUR}-\twodigit{\THEMINUTE}}

%-------------------------------------------------------------------------
% Page Layout
%-------------------------------------------------------------------------
% A margin of 1.2in seems to be a good compromise between number of
% characters per line vs. compactness.

\geometry
{%
  margin=1.2in,
  headheight=15pt,
}

%-------------------------------------------------------------------------
% Header/Footers
%-------------------------------------------------------------------------
% We put the title and subtitle in the header and the page numbers are
% centered in the footer.

\fancypagestyle{mainpagestyle}%
{%
  \fancyhead{}%
  \fancyfoot{}%
  %
  % Header Left
  %
  \fancyhead[L]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Center
  %
  \fancyhead[C]
  {%
    \ifthenelse{ \isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Right
  %
  \fancyhead[R]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@subtitle}%
    }{}%
  }%
  %
  % Footer
  %
  \fancyfoot[C]{\thepage}%
}%

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{mainpagestyle}

%-------------------------------------------------------------------------
% Title Block
%-------------------------------------------------------------------------

\renewcommand{\@maketitle}
{%
  \centering%
  %
  % Title
  %
  {\Large\textbf{\cbx@title}\par}%
  %
  % Subtitle
  %
  \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
  {%
    {\Large\textbf{\cbx@subtitle}\par}%
  }{}%
  %
  % Author
  %
  \ifthenelse{ \NOT\isundefined{\cbx@author} }%
  {%
    \vspace{0.15in}%
    {\large\cbx@author\par}%
  }{}%
  %
  % Institution
  %
  \ifthenelse{ \NOT\isundefined{\cbx@institution} }%
  {%
    \vspace{0.1in}%
    {\cbx@institution\par}%
  }{}%
  %
  % Revision
  %
  \vspace{0.1in}%
  revision: \revdate\today{}-\revtime\par%
  %
  \thispagestyle{empty}%
}

%-------------------------------------------------------------------------
% Section Formatting
%-------------------------------------------------------------------------
% Put the period after the section number.

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\hspace{0.5em}}

%-------------------------------------------------------------------------
% Lists
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

%-------------------------------------------------------------------------
% Simple Macros
%-------------------------------------------------------------------------

\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}

