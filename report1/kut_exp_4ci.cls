\LoadClass[twoside]{ltjsreport}
\ProvidesClass{kut_exp_4ci}[2023.06.23 K.MIZOGUCHI]
\usepackage{silence}
\WarningFilter{caption}{Unknown document}
\usepackage[top=20truemm,bottom=20truemm,left=15truemm,right=15truemm,headheight=10truemm,footskip=10truemm,showframe]{geometry}
\usepackage{fancyhdr,lastpage,abstract,listings,float,wrapfig,tabularx,multirow,multicol}
\usepackage{hyperref,graphics,graphicx,framed}
\usepackage[symbol]{footmisc}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\usetikzlibrary{calc,arrows.meta,fit,positioning,shapes}
\newcolumntype{A}{>{\centering\bfseries}X}
\newcolumntype{B}{>{\centering\bfseries\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedright\arraybackslash}X}
\newcolumntype{L}{>{\raggedleft\arraybackslash}X}
\bibliographystyle{junsrt}
\hypersetup{
    colorlinks=true,
    citecolor=black,
    linkcolor=black,
    urlcolor=black
}
\renewcommand{\chaptermark}[1]{\markboth{第\ \thechapter\ 章\,\, #1}{}}
\fancypagestyle{report}{
    \fancyhf{}
    \fancyhead[RO]{\leftmark\hspace{1em}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{1em}\thepage\hspace{1em}}
    \fancyhead[LE]{\hspace{1em}\thepage\hspace{1em}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{1em}\leftmark}
    % \fancyfoot[RO,LE]{\thepage\ /\ \pageref{LastPage}}
    \pagenumbering{arabic}
}
\fancypagestyle{appendixstyle}{
    \fancyhf{}
    \fancyhead[RO,LE]{付録}
    \fancyfoot[RO,LE]{\thepage\ /\ \pageref{LastPage}}
    \renewcommand{\headrulewidth}{0mm}
}
\fancypagestyle{toc}{
    \fancyhf{}
    \fancyhead[RE]{目次\hspace{1em}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{1em}\thepage\hspace{1em}}
    \fancyhead[LO]{\hspace{1em}\thepage\hspace{1em}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{1em}目次}
    % \fancyfoot[RO,LE]{\thepage\ /\ \pageref{LastPage}}
    \pagenumbering{roman}
}

\renewcommand{\figurename}{図}
\renewcommand{\tablename}{表}
\renewcommand{\lstlistingname}{src.}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\renewcommand{\contentsname}{目次}
\renewcommand{\listfigurename}{図目次}
\renewcommand{\listtablename}{表目次}
\renewcommand{\lstlistlistingname}{ソースコード}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\renewcommand{\labelenumi}{\textbf{\theenumi}.\ }
\renewcommand{\eqref}[1]{式(\ref{#1})}
\newcommand{\figref}[1]{図\ref{#1}}
\newcommand{\tblref}[1]{表\ref{#1}}
\newcommand{\srcref}[1]{src.\ref{#1}}
\newcommand{\chapref}[1]{第\ref{#1}章}
\makeatletter
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{lstlisting}{chapter}
\@addtoreset{footnote}{page}
\renewcommand{\chapter}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \global\@topnum\z@
    \secdef\@chapter\@schapter}
\makeatother
\AtBeginDocument{
    \renewcommand{\thelstlisting}{\thechapter-\arabic{lstlisting}}
}
\newcommand\YAMLcolonstyle{\color{red}\mdseries}
\newcommand\YAMLkeystyle{\color{black}\bfseries}
\newcommand\YAMLvaluestyle{\color{blue}\mdseries}

\makeatletter

% here is a macro expanding to the name of the language
% (handy if you decide to change it further down the road)
\newcommand\language@yaml{yaml}

\expandafter\expandafter\expandafter\lstdefinelanguage
\expandafter{\language@yaml}
{
keywords={true,false,null,y,n},
sensitive=false,
comment=[l]{\#},
morecomment=[s]{/*}{*/},
moredelim=[l][\color{orange}]{\&},
moredelim=[l][\color{magenta}]{*},
moredelim=**[il][\YAMLcolonstyle{:}\YAMLvaluestyle]{:},   % switch to value style at :
morestring=[b]',
morestring=[b]",
literate =    {---}{{\ProcessThreeDashes}}3
{>}{{\textcolor{red}\textgreater}}1
{|}{{\textcolor{red}\textbar}}1
{\ -\ }{{\mdseries\ -\ }}3,
}

% switch to key style at EOL
\lst@AddToHook{EveryLine}{\ifx\lst@language\language@yaml\YAMLkeystyle\fi}
\makeatother

\newcommand\ProcessThreeDashes{\llap{\color{cyan}\mdseries-{-}-}}

\lstset{
    %backgroundcolor={\color[gray]{.90}},
    breaklines = true,
    breakindent = 10pt,
    basicstyle = \ttfamily\small,
    commentstyle = {\ttfamily \color[rgb]{0,0.45,0}},
    classoffset = 0,
    keywordstyle = {\bfseries \color{red}},
    stringstyle = {\ttfamily \color{blue}},
    frame = single,
    %他オプション：leftline，topline，bottomline，lines，single，shadowbox
    framesep = 5pt,
    numbers = left,
    stepnumber = 1,
    numberstyle = \small,
    tabsize = 4,
    captionpos = t,
    otherkeywords = {}
}
\makeatletter
\def\rtime#1{\def\@rtime{#1}}
\def\studentid#1{\def\@studentid{#1}}
\def\group#1{\def\@group{#1}}
\def\llab#1{\def\@llab{#1}}
\def\name#1{\def\@name{#1}}
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}
        \vspace*{\stretch{1}}
        {\normalsize 情報学群実験第4C/4i 実験レポート 第\@rtime 回}\\
        \vspace{2em}
        {\Huge \@title}\\
        \vspace{2em}
        {\Large\@studentid\hspace{1\zw}\@name\footnote{高知工科大学 情報学群 \@llab}}\\
        \vspace{1em}
        {\large Group \@group}\\
        \vspace{1em}
        {\Large \@date}
        \vspace{\stretch{2}}
        \thispagestyle{empty}
    \end{center}
    \renewcommand{\footnoterule}{%
        \kern -3pt
        \hrule width 0pt height 0pt
        \kern 2pt
    }
}
\makeatother
\AtBeginDocument{
    \begin{titlepage}
        \thispagestyle{empty}
        \maketitle
    \end{titlepage}
    \pagenumbering{roman}\thispagestyle{toc}
    \tableofcontents
    \newpage
    \pagestyle{report}
    \setcounter{page}{1}
}
