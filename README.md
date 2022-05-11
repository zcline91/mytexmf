# My TeXMF

If you want custom latex cls and sty files to be available outside of the directory they're stored in (so if you want to be able to use the package without copying it into every directory of every TeX project, possibly creating different versions), you need to create a texmf directory somewhere on your computer and point your distribution to it.

This is my texmf directory that can be cloned onto any computer I need it on, typically in the home directory (~).

---
## Set-Up

- Clone the repository onto any local machine you want to use the custom packages on, typically into the home directory (~).
- After cloning, for MikTeX, go to the MikTeX console and add the root mytexmf directory in the settings/directories section.
---
## Custom Classes

### clicker.cls

This class is for creating clicker questions for use in a classroom. It is an extension of the beamer class, so beamer styles and commands can be used throughout. The class adds the following:

- `qframe` environment: an extension of frame but with no title. Instead, the title is an automatically incremented "Question #".
- `choices` environment: an enumerate environment for multiple choice questions, automatically labeled. Instead of `\item`, use `\answer` for the correct choice and `\distractor` for incorrect choices. These will then be colored differently on the solution slide for the question.
- `true` command: creates a "True or False:" centered label for true/false questions. The correct answer (true) will be highlighted on the solution slide.
- `false` command: same as `true` command, but with a correct answer of false
- `answer` color: the color that correct answers will be printed with on solution slides (see `choices`, `true`, and `false`). The default is `clickeranswergreen`. This can be set to any color with `\colorlet{answer}{<color>}`. If a custom color is desired, first define it using `\definecolor{<colorname>}...`
- `distractor` color: the color incorrect answers will be printed. The default is `lightgray`. Can also be custom set (see `answer`)

Additionally, if a version without solutions, just questions, is desired, passing the option `handout` to the class will generate this.

#### Example
```latex
\documentclass{clicker}
\mode<presentation>{}

\usepackage{bubeamertheme}

\title{Test 1 Clicker Questions}
\subtitle{Math216 -- Statistics I}
\author{Prof. Cline}
\institute{Bucknell University}
\date{Spring 2022}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\begin{qframe}
  This is a question 

  \begin{choices}
    \answer Correct answer 
    \distractor Incorrect answer
    \distractor Incorrect answer
    \distractor Incorrect answer
  \end{choices}
\end{qframe}

\end{document}
```

---
### quiz.cls
This extension of the exam class is for creating quizzes. Use the `questions` and `parts` environments from the exam class. A header and footer are automatically created for pages 2 and on when the class is loaded. The title/header for the first page can be loaded with `\addtitle`, which uses the following parameters that must be defined in the preamble:
- `\title`
- `\coursenumber`
- `\coursename`
- `\instructor`
- `\semester`

If a solutions version is also desired, spacing between questions should be set with 
```latex
\begin{solutionbox}{<height>} 
  <solution> 
\end{solutionbox}
```
To create a version with solutions, pass the option `answers`. The following options can be passed to style the solutions:
- `black-solutions`
- `blue-solutions`
- `red-solutions`
- `boxed-solutions`
  
By default, the solutions will not be boxed and will be printed in blue.

If the quiz will be a group quiz, pass the option `group`. This just changes the "Name" field to "Names".

#### Example
```latex
\documentclass[12pt, letterpaper, group, answers]{quiz}

\title{Quiz 1}
\coursename{Statistics I}
\coursenumber{Math216}
\instructor{Prof. Cline}
\semester{Spring 2022}

\begin{document}
  \addtitle
  \begin{questions}
    \question[4] This is a question.
    \begin{solutionbox}{3in}
      This is a solution.
    \end{solutionbox}
    \newpage 
    \question[5] Here's another.
  \end{questions}
\end{document}
```

---

### coursedoc.cls
This extension of the article class is for generic course documents. It uses the following options for a custom `\maketitle` that need to be defined in the preamble:
- `\title`
- `\coursenumber`
- `\coursename`
- `\instructor`
- `\semester`

#### Example
```latex
\documentclass[12pt]{coursedoc}

\title{Homework Assignment 1}
\coursenumber{Math216}
\coursename{Statistics I}
\instructor{Prof. Cline}
\semester{Spring 2022}

\begin{document}
\maketitle 
\begin{enumerate}
  \item This is a homework question. \newpage
  \item Here is another.
\end{enumerate}
\end{document}
```
---
### worksheet.cls
An extension of the exam class, this provides a way to create worksheets for class work, and corresponding solutions. As with the quiz class, the environments `questions` and `parts` are used to create questions, and the spacing/solutions are provided by the `solutionbox` environment.

Solutions can be styled similarly to in the `quiz.cls` environment, and are included by passing the option `answers`.

Unlike the `quiz.cls` command `\addtitle`, this class uses the regular `\maketitle`.

The following should be set in the preamble:
- `\title`
- `\coursenumber`
- `\coursename`
- `\instructor`
- `\semester`

#### Example
```latex
\documentclass[12pt,letterpaper,answers]{worksheet}

\title{Ch. 16 Worksheet}
\coursenumber{Math216}
\coursename{Statistics I}
\instructor{Prof. Cline}
\semester{Spring 2022}

\begin{document}
\maketitle 

\begin{questions}
  \question Here's a question on the worksheet.
  \begin{solutionbox}{3in}
    The solution to the problem:
    \[f'(x) = 3e^{3x} - \frac 1 x.\]
  \end{solutionbox}
  \newpage 
  \question Here's another question.
\end{questions}
```
---
## Custom Packages

### zmacros.sty
This is a place to store commonly used macros, e.g. `\Z` for integers or `\mc` for `\mathcal`. Some highlights:
- `\ds`: a shorthand for `\displaystyle` in math environments
- `\img`: a shorthand for `\includegraphics` which defaults to a width of `\linewidth`. An optional argument can provide a fractional amount of `\linewidth`. E.g., the command `\img[.5]{<path>}` prints the image at half the width of the line.

---
### bubeamertheme.sty
This provides a minimal theme for beamer slides with Bucknell coloring.

---