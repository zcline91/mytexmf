%-------------Identification-------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clicker}[2022/05/04 v1.0]

%--------------Initial Code--------------

%---------Declaration of Options---------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

%----------Execution of Options----------
% \ExecuteOptions{}
\ProcessOptions\relax

%-------------Package Loading------------
\LoadClass{beamer}
\RequirePackage{enumitem}
\RequirePackage{xcolor}

%----------------Main Code---------------
% Define colors to be used on solution slides
\definecolor{clickeranswergreen}{HTML}{30B309}
\colorlet{answer}{clickeranswergreen}
\colorlet{distractor}{lightgray}

% Add a counter for clicker question number and define frame
% which uses counter in title while incrementing.
\newcounter{question}
\newenvironment{qframe}{%
  \refstepcounter{question} %
  \begin{frame}{Question \thequestion}%
}{%
  \end{frame}%
}

% environment for multiple choice questions, which instead of 
% \item, will use \answer and \distractor
\newenvironment{choices}{%
  \begin{enumerate}[label=\Alph*.]%
}{%
  \end{enumerate}%
}
\newcommand{\answer}{\only<2|handout:0>{\color{answer}} \item}
\newcommand{\distractor}{\only<2|handout:0>{\color{distractor}} \item}

% commands for a true/false statement which is true (resp. false)
\newcommand{\true}{%
  {\Large %
    \begin{center}%
      \only<1>{\textbf{True}}%
      \only<2|handout:0>{\textcolor{answer}{\textbf{True}}} %
      or %
      \only<1>{\textbf{False}}%
      \only<2|handout:0>{\textcolor{distractor}{\textbf{False}}}%
      :%
    \end{center}%
  }%
}
\newcommand{\false}{%
  {\Large %
    \begin{center}%
      \only<1>{\textbf{True}}%
      \only<2|handout:0>{\textcolor{distractor}{\textbf{True}}} %
      or %
      \only<1>{\textbf{False}}%
      \only<2|handout:0>{\textcolor{answer}{\textbf{False}}}%
      :%
    \end{center}%
  }%
}
