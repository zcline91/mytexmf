<!-- omit in toc -->
# My TeXMF

This is my texmf directory with custom document classes and packages.
Feel free to use any of these as you see fit.

- [Motivation](#motivation)
- [Set-Up](#set-up)
- [Custom Classes](#custom-classes)
  - [`coursedoc.cls`](#coursedoccls)
    - [Example](#example)
  - [`lecturenotes.cls`](#lecturenotescls)
    - [Example](#example-1)
  - [`quiz.cls`](#quizcls)
    - [Example](#example-2)
  - [`test.cls`](#testcls)
    - [Example](#example-3)
  - [`worksheet.cls`](#worksheetcls)
    - [Example](#example-4)
  - [`syllabus.cls`](#syllabuscls)
    - [Example](#example-5)
  - [`clicker.cls`](#clickercls)
    - [Example](#example-6)
- [Custom Packages](#custom-packages)
  - [`zmacros.sty`](#zmacrossty)
  - [`bubeamertheme.sty`](#bubeamerthemesty)


## Motivation

If you want custom $\LaTeX$ .cls and .sty files to be available outside of the directory they're stored in (so if you want to be able to use the package without copying it into every directory of every $\TeX$ project, possibly creating different versions), you need to create a texmf directory somewhere on your computer and point your distribution to it.

---
## Set-Up

- Clone the repository onto any local machine you want to use the custom packages on, typically into the home directory (~). (Or just copy the desired files.)
- After cloning, for MikTeX, go to the MikTeX console and add the root mytexmf directory in the settings/directories section. (I'm not exactly sure about the installation process for other $\LaTeX$ distributions.)
---
## Custom Classes

### `coursedoc.cls`
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


### `lecturenotes.cls`

A subclass of [`coursedoc.cls`](#coursedoccls) for lecture notes.
This has all the same class options as `coursedoc`, and adds the options `student`, which will print a student version of the lecture notes, hiding notes that the lecturer includes for themself, and suppressing color differences (discussed below).

The main addition to the `coursedoc` class is new color comands and environments. The color commands are for differentiating the main notes, from "in the air" comments and self-notes to the lecturer. The colornames for these environments are in parentheses below, and can be set using `\colorlet{<name>}{<color>}`.
- `\air{}` (`aircol` - defaults to Plum): Something to say out loud, but not write on the board. This color difference will be suppressed by the `student` option.
- `\quest{}` (`questcol` - defaults to blue): Something to ask the students to keep them engaged, either with Think-Pair-Share or more open-ended. The argument is also underlined. These visual differences are suppressed by the `student` option.
- `\bnote{}` (`notecol` - defaults to BrickRed): A note to the lecturer (such as a cue to pull up a certain visualization or draw something on the board, or if using slides, to change slides). The contents will be entirely removed by the `student` option.
- `\mnote{}` (`mnotecol` - defaults to BrickRed): Same as `\bnote` but in the margin of the page so it's more out of the way. This is good for quick notes, like to mark down the solution to a problem.

In addition to the colored environments above, some amsthm environments are defined:
- `thm`: theorems
- `lem`: lemmas
- `prop`: propositions
- `cor`: corollaries
- `defn`: definitions
- `rem`: remarks
- `note`: notes
- `notation`: notation
- `exercise`: examples

There is also a convenience environment `eg` that places a frame around an `exercise` environment for creating examples.
The `proof` environment is also available since amsthm is loaded by default.

#### Example

```latex
\documentclass[12pt,letterpaper]{lecturenotes}

\title{12.3: The Dot Product}
\coursenumber{Math211}
\coursename{Calculus III}
\instructor{Prof. Cline}
\semester{Spring 2022}

\begin{document}
\maketitle 

\begin{defn}
  The dot product of two vectors\ldots
\end{defn}

\air{The definition for two-dimensional vectors is similar.}

\begin{eg}
  For the vectors\ldots
\end{eg}

\section{Geometric Interpretation}

\ldots

\end{document}
```

---
### `quiz.cls`
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
\documentclass[12pt,letterpaper,group,answers]{quiz}

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

### `test.cls`

This is another extension of the exam class, used for creating in-class tests.
It is similar to [`quiz.cls`](#quizcls) in that the `questions` and `parts` environments from the exam class should be used, but different in that the `addpoints` options is passed to the exam class, so that points can be specified in the environments above and a grading table can be created by default.
 
There is a `covercontent` environment which includes its contents in a minipage next to a grading table and starts a new page.
This environment should be called once at the start of the document.

The same `solutionsbox` environment as quiz should be used for solutions environments, with the same class options available for styling solutions.
There is no `group` class option as there is for the quiz class.
There is, however, options `initials` and `no-initials`, which specifies how the right header will appear (either as a spot for students to write their initials, or the semester).

The following should be set in the preamble:
- `\title`
- `\coursenumber`
- `\coursename`
- `\instructor`
- `\semester`
- `\date`
- `\timelimit`
  
#### Example
```latex
\documentclass[12pt,letterpaper,initials]{test}

\title{Test 1}
\coursenumber{Math216}
\coursename{Statistics I}
\instructor{Prof. Cline}
\semester{Spring 2022}
\date{7/4/1776}
\timelimit{80 minutes}

\begin{document}
\addtitle 

\begin{covercontent}
  This test contains \numpages\ pages (including this cover page) and \numquestions\ problems\ldots
\end{covercontent}

\begin{questions}
  \question[5] Here's a test question.
  \begin{solutionbox}{3in}
    The solution is 42!
  \end{solutionbox}
  \newpage 
  \question Here's another question with parts:
  \begin{parts}
    \part[2] the first part
    \part[3] the second part
  \end{parts}
\end{questions}
\end{document}
```
---

### `worksheet.cls`
An extension of the exam class, this provides a way to create worksheets for class work, and corresponding solutions. As with [`quiz.cls`](#quizcls), the environments `questions` and `parts` are used to create questions, and the spacing/solutions are provided by the `solutionbox` environment.

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
\end{document}
```
---

### `syllabus.cls`

An extension of the article class for creating syllabi.
It uses the following options for a custom `\maketitle` that need to be defined in the preamble:
- `\coursenumber`
- `\coursename`
- `\instructor`
- `\semester`
- `\office`
- `\emailaddress`
- `\officehours`

It also styles sections and (sub)subsections.

#### Example
```latex
\documentclass[11pt,letterpaper]{syllabus}

\coursenumber{Math216}
\coursename{Statistics I}
\instructor{Prof. Cline}
\semester{Spring 2022}
\emailaddress{z.cline@bucknell.edu}
\office{Olin 368}
\officehours{M 4-5; W 2-3; R 11-12; F 12-1}

\begin{document}
\maketitle 

\section*{Course Overview}
  \begin{multicols}{2}
    \subsection*{Catalog Course Description}
      Statistics \ldots
    \subsection*{Course Philosophy}
      \ldots
    \subsection*{Learning Objectives}
      \ldots
  \end{multicols}
\section*{Text and Software}
  \ldots

\end{document}
```

---

### `clicker.cls`

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

## Custom Packages

### `zmacros.sty`
This is a place to store commonly used macros, e.g. `\Z` for integers or `\mc` for `\mathcal`. Examples:
- `\ds`: a shorthand for `\displaystyle` in math environments
- `\img`: a shorthand for `\includegraphics` which defaults to a width of `\linewidth`. An optional argument can provide a fractional amount of `\linewidth`. E.g., the command `\img[.5]{<path>}` prints the image at half the width of the line.

---
### `bubeamertheme.sty`
This provides a minimal theme for beamer slides with Bucknell coloring.

---