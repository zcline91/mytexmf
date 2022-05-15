%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursedoc}[2022/05/11 v1]

%--------------Initial Code--------------

%---------Declaration of Options---------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%----------Execution of Options----------
% \ExecuteOptions{}
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{article}
% \RequirePackage[margin=1in]{geometry}
\RequirePackage{fancyhdr}
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

% Save title for use in header
\AtBeginDocument{%
  \edef\mytitle{\@title}
}

% Custom maketitle
\def\@maketitle{%
  \begin{center}%
    {\Large \@title } \\[-0.6em] %
    \rule{%
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
    }{.5pt} \\[-0.5em] %
    \vskip 1ex%
    {\small%
      \@coursenumber{} -- \@coursename{} \\ %
      \@semester{} -- \@instructor{}%
    }%
  \end{center}%
  \par \vskip 1.5em}

% Set header and footer
\pagestyle{fancy}
\fancyhf{}
\chead{\mytitle}
\rhead{\@semester}
\lhead{\@coursenumber}
\cfoot{\thepage}
% This is so the headheight isn't too small if 12pt is used.
\setlength{\headheight}{15pt}
