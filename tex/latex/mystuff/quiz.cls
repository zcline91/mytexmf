\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{quiz}[2022/05/10 v1.0]

\newif\ifgroup
\groupfalse

\DeclareOption{group}{\AtBeginDocument{\grouptrue}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\LoadClass{exam}

\RequirePackage[margin=1in]{geometry}

\def\coursenumber#1{\gdef\@coursenumber{#1}}
\def\@coursenumber{\@latex@warning@no@line{No \noexpand\coursenumber given}}
\def\coursename#1{\gdef\@coursename{#1}}
\def\@coursename{\@latex@warning@no@line{No \noexpand\coursename given}}
\def\semester#1{\gdef\@semester{#1}}
\def\@semester{\@latex@warning@no@line{No \noexpand\semester given}}
\def\instructor#1{\gdef\@instructor{#1}}
\def\@instructor{\@latex@warning@no@line{No \noexpand\instructor given}}

\def\@maketitle{%
  \parbox{.25\textwidth}{\raggedright \@coursenumber \\ \@coursename}%
  \parbox{.5\textwidth}{\centering \large \scshape \@title}%
  \parbox{.25\textwidth}{\raggedleft \@instructor \\ \@semester}%
  \\[1cm]%
  \ifgroup%
    \makebox[\textwidth]{Names:\enspace\hrulefill}%
  \else%
    \makebox[\textwidth]{Name:\enspace\hrulefill}%
  \fi%
}

\AtBeginDocument{%
  \edef\mytitle{\@title}%
  \edef\mycoursenumber{\@coursenumber}%
  \edef\mysemester{\@semester}%
  \maketitle%
  \thispagestyle{empty}
}
\pagestyle{head}
\firstpageheader{}{}{}
\runningheader{\mycoursenumber}{\textsc{\mytitle}\ - Page \thepage\ of \numpages}{\mysemester}
\runningheadrule

\setlength{\parindent}{0pt}