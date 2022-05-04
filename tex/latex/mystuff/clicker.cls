\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clicker}[2022/05/04 v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\RequirePackage{enumitem}
\RequirePackage{xcolor}

\definecolor{clickeranswergreen}{HTML}{30B309}
\colorlet{answer}{clickeranswergreen}
\colorlet{distractor}{lightgray}

\newcounter{question}

\newenvironment{qframe}{%
  \refstepcounter{question} %
  \begin{frame}{Question \thequestion}%
}{%
  \end{frame}%
}

\newenvironment{choices}{%
  \begin{enumerate}[label=\Alph*.]%
}{%
  \end{enumerate}%
}

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

\newcommand{\answer}{\only<2|handout:0>{\color{answer}} \item}
\newcommand{\distractor}{\only<2|handout:0>{\color{distractor}} \item}
