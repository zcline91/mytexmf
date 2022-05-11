%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{quiz}[2022/05/11 v1.1]

%--------------Initial Code--------------
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\newbool{@group}
\global\setbool{@group}{false}
\newbool{@boxed@solutions}
\global\setbool{@boxed@solutions}{false}

%---------Declaration of Options---------
\DeclareOption{group}{\AtBeginDocument{\global\setbool{@group}{true}}}
\DeclareOption{black-solutions}{\colorlet{@solutioncolor}{black}}
\DeclareOption{blue-solutions}{\colorlet{@solutioncolor}{blue}}
\DeclareOption{red-solutions}{\colorlet{@solutioncolor}{red}}
\DeclareOption{boxed-solutions}{\global\setbool{@boxed@solutions}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}

%----------Execution of Options----------
\ExecuteOptions{blue-solutions}
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{exam}
\RequirePackage[margin=1in]{geometry}

%----------------Main Code---------------

\RequirePackage{calc}

% Add some new maketitle options
\def\coursenumber#1{\gdef\@coursenumber{#1}}
\def\@coursenumber{\@latex@warning@no@line{No \noexpand\coursenumber given}}
\def\coursename#1{\gdef\@coursename{#1}}
\def\@coursename{\@latex@warning@no@line{No \noexpand\coursename given}}
\def\semester#1{\gdef\@semester{#1}}
\def\@semester{\@latex@warning@no@line{No \noexpand\semester given}}
\def\instructor#1{\gdef\@instructor{#1}}
\def\@instructor{\@latex@warning@no@line{No \noexpand\instructor given}}

% Save maketitle options for use in header
\AtBeginDocument{
  \edef\mytitle{\@title}
  \edef\mycoursenumber{\@coursenumber}
  \edef\mysemester{\@semester}
}

% Custom maketitle
\def\@maketitle{
  \parbox{.25\textwidth}{\raggedright \@coursenumber \\ \@coursename}%
  \parbox{.5\textwidth}{\centering \large \scshape \@title}%
  \parbox{.25\textwidth}{\raggedleft \@instructor \\ \@semester}%
  \\[1cm]%
  \ifbool{@group}{%
    \makebox[\textwidth]{Names:\enspace\hrulefill}%
  }{%
    \makebox[\textwidth]{Name:\enspace\hrulefill}%
  }%
}

% Make the title and empty the footer
\AtBeginDocument{
  \maketitle
  \thispagestyle{empty} % \maketitle automatically sets =
}                       % \thispagestyle{plain}. This undoes that.

% Set header and footer
\pagestyle{head}
\runningheader
  {\mycoursenumber}
  {\textsc{\mytitle}\ - Page \thepage\ of \numpages}
  {\mysemester}
\runningheadrule

% Quizzes generally shouldn't be indented
\setlength{\parindent}{0pt}

% Style solutions
\SolutionEmphasis{\color{@solutioncolor}}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution:}\par\noindent}
\ifbool{@boxed@solutions}{%
  %
}{%
  \colorsolutionboxes \definecolor{SolutionBoxColor}{HTML}{FFFFFF}%
}
