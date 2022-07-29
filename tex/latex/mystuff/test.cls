%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{test}[2022/07/28 v1.01]

%--------------Initial Code--------------
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\newbool{@boxed@solutions}
\global\setbool{@boxed@solutions}{false}
\newbool{@initials}

%---------Declaration of Options---------
\DeclareOption{black-solutions}{\colorlet{@solutioncolor}{black}}
\DeclareOption{blue-solutions}{\colorlet{@solutioncolor}{blue}}
\DeclareOption{red-solutions}{\colorlet{@solutioncolor}{red}}
\DeclareOption{boxed-solutions}{\global\setbool{@boxed@solutions}{true}}
\DeclareOption{initials}{\global\setbool{@initials}{true}}
\DeclareOption{no-initials}{\global\setbool{@initials}{false}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}

%----------Execution of Options----------
\ExecuteOptions{blue-solutions, no-initials}
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass[addpoints]{exam}
\RequirePackage{calc}

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
\def\timelimit#1{\gdef\@timelimit{#1}}
\def\@timelimit#1{\@latex@warning@no@line{No \noexpand\timelimit given}}

% Save title for use in header
\AtBeginDocument{
  \edef\mytitle{\@title}
}

% Custom maketitle
\def\@maketitle{
  \parbox{.3\textwidth}{%
    \bfseries \raggedright \@coursenumber \\ \@coursename \\ \@semester%
  }%
  \parbox{.4\textwidth}{\centering \Large \scshape \@title}%
  \parbox{.3\textwidth}{%
    \bfseries \raggedleft \@instructor \\ \@date \\ Time Limit: \@timelimit%
  }%
  \\[1cm]%
  \makebox[\textwidth]{Name:\enspace\hrulefill}%
  \\%
  \\%
}

% Make the title and empty the footer
\newcommand{\addtitle}{
  \maketitle
  \thispagestyle{empty} % \maketitle automatically sets =
}                       % \thispagestyle{plain}. This undoes that.

% Create content for coverpage
\newenvironment{covercontent}[1][.7\textwidth]{%
  \newlength\@content@width
  \setlength{\@content@width}{#1}
  \begin{minipage}{\@content@width}%
    \vspace{0pt} % to make the top align option of minipage work
}{% 
  \end{minipage}%
  \hspace{.05\textwidth}%
  \begin{minipage}{.95\textwidth - \@content@width}%
  % \begin{minipage}[t]{.95\textwidth - #1}%
    \vspace{0pt} % to make the top align option of minipage work
    \centering%
    \vqword{Problem}%
    % \gradetablestretch{2}%
    \pointtable%
  \end{minipage}%
  \newpage%
}

% Set header and footer
\pagestyle{head}
\runningheader
  {\@coursenumber}
  {\textsc{\mytitle}\ -- Page \thepage\ of \numpages}
  {%
    \ifbool{@initials}{%
      Initials:\makebox[.75in]{\enspace\hrulefill}%
    }{%
      \@semester%
    }%
  }
\runningheadrule

% Tests generally shouldn't be indented
\setlength{\parindent}{0pt}

% Style solutions
\SolutionEmphasis{\color{@solutioncolor}}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution:}\par\noindent}
\ifbool{@boxed@solutions}{%
  %
}{%
  \colorsolutionboxes \definecolor{SolutionBoxColor}{HTML}{FFFFFF}%
}

% Use hyperrefs for pointtable
\AtEndPreamble{\usepackage[hidelinks]{hyperref}}