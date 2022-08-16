%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{syllabus}[2022/08/16 v1.1]

%--------------Initial Code--------------

%---------Declaration of Options---------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%----------Execution of Options----------
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{article}
\RequirePackage{titlesec}
\AtBeginDocument{%
  \RequirePackage{fancyhdr}%
  \RequirePackage[colorlinks,urlcolor=blue]{hyperref}%
}

%----------------Main Code---------------
% Add some new maketitle options
\def\coursenumber#1{\gdef\@coursenumber{#1}}
\def\@coursenumber{\@latex@warning@no@line{No \noexpand\coursenumber given}}
\def\coursename#1{\gdef\@coursename{#1}}
\def\@coursename{\@latex@warning@no@line{No \noexpand\coursename given}}
\def\semester#1{\gdef\@semester{#1}}
\def\@semester{\@latex@warning@no@line{No \noexpand\semester given}}
\def\instructor#1{\gdef\@instructor{#1}}
\def\@instructor{\@latex@warning@no@line{No \noexpand\instructor given}}
\def\office#1{\gdef\@office{#1}}
\def\@office{\@latex@warning@no@line{No \noexpand\office given}}
\def\emailaddress#1{\gdef\@emailaddress{#1}}
\def\@emailaddress{\@latex@warning@no@line{No \noexpand\emailaddress given}}
\def\officehours#1{\gdef\@officehours{#1}}
\def\@officehours{\@latex@warning@no@line{No \noexpand\officehours given}}


% Custom maketitle
\def\@maketitle{%
  \begin{center}%
    {\LARGE \textbf{\@coursename\ (\@coursenumber) -- \@semester} }%
    \par \vskip 1em%
    \begin{tabular}{rl}%
      \textsc{Instructor:} & \@instructor \\%
      \textsc{E-mail:} & \href{mailto:\@emailaddress}{\@emailaddress} \\%
      \textsc{Office:} & \@office \\%
      \textsc{Office Hours:} & \@officehours \\%
    \end{tabular}%
  \end{center}%
  }

% Set header and footer
\AtBeginDocument{
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% Change section title formatting
\titleformat{\section}%
  {\centering\Large\scshape}%
  {\thesection}%
  {0.5em}%
  {\rule{\textwidth}{1pt}\\}%
  [\vspace{-1ex}\rule{\textwidth}{0.5pt}]%
\titlespacing*{\section}%
  {0pt}%
  {0.5em}%
  {0pt}%
\titlespacing*{\subsection}%
  {0pt}%
  {1em}%
  {0.5em}%
\titlespacing*{\subsubsection}%
  {0pt}%
  {0.7em}%
  {0.25em}%
\titleformat{\subsubsection}[runin]%
  {\normalfont\bfseries}%
  {\thesection}%
  {0.5em}%
  {}%