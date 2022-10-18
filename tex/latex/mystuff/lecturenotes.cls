%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2022/06/13 First Attempt]

%--------------Initial Code--------------
\RequirePackage{etoolbox}
\newbool{@student}
\global\setbool{@student}{false}

%---------Declaration of Options---------
\DeclareOption{student}{\global\setbool{@student}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{coursedoc}}

%----------Execution of Options----------
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{coursedoc}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mdframed}
\RequirePackage{marginnote}

%----------------Main Code---------------
% Define colors to be used for different types of text
\colorlet{aircol}{Plum}
\colorlet{questcol}{blue}
\colorlet{notecol}{BrickRed}
\colorlet{mnotecol}{BrickRed}

% Define different types of text in lecture notes
\newcommand{\air}[1]{%
  \ifbool{@student}{%
    #1%
  }{%
    \textcolor{aircol}{#1}%
  }%
}
\newcommand{\quest}[1]{%
  \ifbool{@student}{%
    #1%
  }{%
    \underline{\textcolor{questcol}{#1}}%
  }%
}
\newcommand{\bnote}[1]{%
  \ifbool{@student}{}{%
    \textcolor{notecol}{(#1)}%
  }%
}
\newcommand{\mnote}[1]{%
  \ifbool{@student}{}{%
    \marginnote{\footnotesize \textcolor{mnotecol}{#1}}%
  }%
}

\newcommand{\term}[1]{\textbf{#1}}

\theoremstyle{plain}
\newtheorem*{thm}{Theorem}
\newtheorem*{lem}{Lemma}
\newtheorem*{prop}{Proposition}
\newtheorem*{cor}{Corollary}

\theoremstyle{definition}
\newtheorem*{defn}{Definition}

\theoremstyle{remark}
\newtheorem*{rem}{Remark}
\newtheorem*{note}{Note}
\newtheorem*{notation}{Notation}

\newtheoremstyle{exercise}%
  {-.5em}%
  {.5em}%
  % {\addtolength{\leftskip}{2.5em}}%
  {}%
  {}%
  {\bfseries}%
  {}%
  {\newline}%
  {}%
\theoremstyle{exercise}
\newtheorem{exercise}{Example}

\newenvironment{eg}%
  {\begin{mdframed}\begin{exercise}}%
  {\end{exercise}\end{mdframed}}