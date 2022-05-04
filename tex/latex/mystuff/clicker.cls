\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clicker}[2022/05/04 First Attempt]

% \DeclareOption{answers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\RequirePackage{enumitem}
\RequirePackage{xcolor}

\definecolor{clickeranswergreen}{HTML}{30B309}
\colorlet{answer}{clickeranswergreen}
\colorlet{distractor}{lightgray}

\newcounter{question}

\newenvironment{qframe}{\refstepcounter{question} \begin{frame}{Question \thequestion}}{\end{frame}}
\newenvironment{choices}{\begin{enumerate}[label=\Alph*.]}{\end{enumerate}}

\newcommand{\answer}{\only<2|handout:0>{\color{answer}} \item}
\newcommand{\distractor}{\only<2|handout:0>{\color{distractor}} \item}
