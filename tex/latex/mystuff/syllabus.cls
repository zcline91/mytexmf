%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{syllabus}[2022/08/15 v1]

%--------------Initial Code--------------

%---------Declaration of Options---------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%----------Execution of Options----------
% \ExecuteOptions{}
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{article}
% \RequirePackage[margin=1in]{geometry}
\AtBeginDocument{%
  \RequirePackage{fancyhdr}%
}
% \RequirePackage{calc}
% \RequirePackage[fit]{truncate}

%----------------Main Code---------------
% Add some new maketitle options
\def\coursenumber#1{\gdef\@coursenumber{#1}}
\def\@coursenumber{\@latex@warning@no@line{No \noexpand\coursenumber given}}
\def\coursename#1{\gdef\@coursename{#1}}
\def\@coursename{\@latex@warning@no@line{No \noexpand\coursename given}}
\def\semester#1{\gdef\@semester{#1}}
\def\@semester{\@latex@warning@no@line{No \noexpand\semester given}}

% % Save title for use in header
% \AtBeginDocument{%
%   \edef\mytitle{\@title}
% }

% Custom maketitle
\def\@maketitle{%
  \begin{center}%
    {\LARGE \textbf{\@coursename\ (\@coursenumber) -- \@semester} }%
  \end{center}%
  \par \vskip 1.5em}

\AtBeginDocument{
  % Set header and footer
  \pagestyle{fancy}
  \fancyhf{}
  % \fancyhead[R]{\@semester}
  % \fancyhead[L]{\@coursenumber}
  \fancyhead[C]{\textsc{\@coursename\ -- \@semester}}
  \fancyfoot[C]{\thepage}
  % This is so the headheight isn't too small if 12pt is used.
  \setlength{\headheight}{15pt}
}
