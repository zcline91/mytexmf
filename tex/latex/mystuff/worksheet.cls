%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[2022/07/28 v1.11]

%--------------Initial Code--------------
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\newbool{@boxed@solutions}
\global\setbool{@boxed@solutions}{false}

%---------Declaration of Options---------
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
\RequirePackage{calc}
\RequirePackage[fit]{truncate}

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

% Save title for use in header
\AtBeginDocument{
  \edef\mytitle{\@title}
}

% Custom maketitle
\def\@maketitle{%
  \begin{center}%
    {\Large \@title } \\[-0.6em] %
    \rule{%
      \minof{%
        \maxof{%
          \maxof{%
            \widthof{\Large \@title}%
          }{%
            \widthof{\@coursenumber{} -- \@coursename{}}%
          }%
        }{%
          \widthof{\@semester{} -- \@instructor{}}%
        }%
        + 2em%
      }{%
        \textwidth
      }%
    }{.5pt} \\[-0.5em] %
    \vskip 1ex%
    {\small%
      \@coursenumber{} -- \@coursename{} \\ %
      \@semester{} -- \@instructor{}%
    }%
  \end{center}%
  \par \vskip 1.5em}

% Set header and footer
\pagestyle{headandfoot}
\runningheader{%
  \@coursenumber%
}{%
  \truncate{%
  \textwidth - \widthof{\@semester} - \widthof{\@coursenumber} - 3em%
  }{\mytitle}%
}{%
  \@semester%
}
\runningheadrule
\runningfooter{}{\thepage}{}

% Style solutions
\SolutionEmphasis{\color{@solutioncolor}}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution:}\par\noindent}
\ifbool{@boxed@solutions}{%
  %
}{%
  \colorsolutionboxes \definecolor{SolutionBoxColor}{HTML}{FFFFFF}%
}
