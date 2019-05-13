%
%	HustGSClassPaper.sty
%	本文件是华中科技大学研究生课程论文模板
%	@author ywang
% 	@date 2019/05/13
%	@version v1.0.0
%
%	base on skinaze@HustGraduPaper.sty
%
%	本模板遵循MIT License
%



%	---	定义的新的类
\def\HGSCP@name{HustGSClassPaper}
\def\HGSCP@date{2019/05/13}
\def\HGSCP@version{v1.0.0}
\def\HGSCP@introduction{Adapt HUST style to article}
\ProvidesClass{\HGSCP@name}[\HGSCP@date~\HGSCP@version~\HGSCP@introduction]
\NeedsTeXFormat{LaTeX2e}



%
%	---	定义类的选项
%
\RequirePackage{xstring}%使用条件语句

%字体组
\def\HGSCP@fontset{}
\def\HGSCP@noto{}
\DeclareOption{autofont}{}%自动设置字体
\DeclareOption{adobefont} {
	\def\HGSCP@fontset{,fontset=adobe}
}%使用Adobe 公司的四款中文字体
\DeclareOption{fandolfont} {
	\def\HGSCP@fontset{,fontset=fandol}
}%使用Fandol 中文字体
\DeclareOption{founderfont} {
	\def\HGSCP@fontset{,fontset=founder}
}%使用方正公司的中文字体
\DeclareOption{macfont} {
	\def\HGSCP@fontset{,fontset=mac}
}%使用Mac OS X 系统下的华文字体
\DeclareOption{ubuntufont} {
	\def\HGSCP@fontset{,fontset=ubuntu}
}%使用Ubuntu 系统下的文泉驿和文鼎字体
\DeclareOption{winfont} {
	\def\HGSCP@fontset{,fontset=windows}
}%使用简体中文Windows 系统下的中文字体
\DeclareOption{winnewfont} {
	\def\HGSCP@fontset{,fontset=windowsnew}
}%使用简体中文Windows Vista或之后系统下的中易字体和微软雅黑字体
\DeclareOption{winoldfont} {
	\def\HGSCP@fontset{,fontset=windowsold}
}%使用简体中文Windows XP或之前系统下的中易字体
\DeclareOption{notofont} {
	\def\HGSCP@noto{
		\setCJKmainfont{NotoSerifCJKsc-Regular.otf}[
			BoldFont = NotoSerifCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKsansfont{NotoSansCJKsc-Regular.otf}[
			BoldFont = NotoSansCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKmonofont{NotoSansMonoCJKsc-Regular.otf}[
			BoldFont = NotoSansMonoCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKfamilyfont{zhsong}{NotoSerifCJKsc-Regular.otf}[
			BoldFont = NotoSerifCJKsc-Bold.otf,
			AutoFakeBold = false
		]
		\setCJKfamilyfont{zhhei}{NotoSansCJKsc-Regular.otf}[
			BoldFont = NotoSansCJKsc-Bold.otf,
			AutoFakeBold = false
		]
	}
	\def\HGSCP@fontset{}
}%使用思源宋体和思源黑体
\DeclareOption{nofont} {
	\def\HGSCP@fontset{,fontset=none}
}%不配置中文字体，需要用户自己配置

%页脚样式
\def\HGSCP@footlinelength{6.7cm}
\DeclareOption{footline}{\def\HGSCP@footlinelength{6.7cm}}%有页脚线
\DeclareOption{nofootline}{\def\HGSCP@footlinelength{0cm}}%无页脚线

%引用样式
\def\HGSCP@citestyle{normal}
\DeclareOption{normalcite}{\def\HGSCP@citestyle{normal}}%使用正文式引用样式
\DeclareOption{supercite}{\def\HGSCP@citestyle{super}}%使用上标型引用样式
\def\HGSCP@citebst{gbt7714-2005}
\DeclareOption{gbtcite}{\def\HGSCP@citebst{gbt7714-2005}}%使用GBT7714-2005样式
\DeclareOption{gbt15cite}{\def\HGSCP@citebst{gbt7714-2015}}%使用GBT7714-2015样式
\DeclareOption{tsinghuacite}{\def\HGSCP@citebst{thuthesis}}%使用清华样式

\ProcessOptions
\ExecuteOptions{autofont,normalcites,gbtcite}
\relax



%
%	---	载入Class
%
\LoadClass[a4paper]{article}

%页面基本设置
\RequirePackage[AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}[2017/08/08]
\RequirePackage[zihao=-4,UTF8,heading=true\HGSCP@fontset]{ctex}[2016/12/27]



%
%	---	定义页边距
%
\RequirePackage{geometry}
\geometry{left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm}
\geometry{headsep=1em,footskip=2em}
\geometry{headheight=14pt}



%
%	---	定义字体
%
%用于设置非常用字体
\setmainfont{Times New Roman}
\RequirePackage{fontspec}

%论文封面使用华文中宋
\setCJKfamilyfont{hwzs}{STZhongsong}
\newcommand{\huawenzhongsong}{\CJKfamily{hwzs}}
\newfontfamily\hwzsAll{STZhongsong}[
	BoldFont={STZhongsong},
	BoldFeatures={FakeBold=4}
]

%思源字体定义与使用
\HGSCP@noto



%
%	---	定义页眉页脚
%
%使用fancyhdr库
\RequirePackage{fancyhdr}

%设置页眉样式
\newcommand{\headstyle}{
	\fancyhead[C]{\huawenzhongsong \zihao{5} 华 \space 中 \space 科 \space 技 \space 大 \space 学 \space 研 \space 究 \space 生 \space 课 \space 程 \space 论 \space 文}
}

%设置页脚样式
\newcommand{\footstyle}{\fancyfoot[C]{\huawenzhongsong \zihao{5} \thepage}
	\fancyfoot[L]{\rule[5pt]{\HGSCP@footlinelength}{0.4pt}}
	\fancyfoot[R]{\rule[5pt]{\HGSCP@footlinelength}{0.4pt}}
}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

%定义一种新的格式叫做main
\fancypagestyle{main}{%
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}



%
%	---	定义标题和段落样式
%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.62}

%设置各个标题样式

%不需要使用part和chapter层级
\ctexset{section={format={\centering \heiti \bfseries \zihao{-2}}}} %节
\newcommand{\sectionbreak}{\clearpage} %小节从新的一页开始
\ctexset{subsection={format={\raggedright \heiti \bfseries \zihao{4}}}} %小节
\ctexset{subsubsection={format={\raggedright \heiti \bfseries \zihao{-4}}}} %小小节
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
	{0ex \@plus1ex \@minus.2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
	{0ex \@plus1ex \@minus .2ex}%
	{1em}%
	{\normalfont\normalsize\bfseries}}

\RequirePackage[indentafter]{titlesec}

%设置新的标题层级subsubsubsection
\titleclass{\subsubsubsection}{straight}[\subsubsection]

%设置编号
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}

%设置标题样式
\titleformat{\subsubsubsection}{\raggedright \heiti \bfseries \zihao{-4}}{\thesubsubsubsection}{1em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%设置目录样式
\RequirePackage{tocloft}

%重新设置目录等级，支持hyperref宏包
\RequirePackage{hyperref}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@subparagraph{6}

%参考tocloft，定义\l@subsubsubsection
\newcommand{\l@subsubsubsection}[2]{%
	\ifnum \c@tocdepth > 3 \relax
	\vskip \cftbeforesubsubsubsecskip
	{\leftskip \cftsubsubsubsecindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubsubsubsecindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubsubsubsecnumwidth\relax
		\let\@cftbsnum \cftsubsubsubsecpresnum
		\let\@cftasnum \cftsubsubsubsecaftersnum
		\let\@cftasnumb \cftsubsubsubsecaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubsubsubsecfont #1}\nobreak
		\cftsubsubsubsecfillnum{#2}}%
	\fi}
\newlength{\cftbeforesubsubsubsecskip}
\setlength{\cftbeforesubsubsubsecskip}{\z@ \@plus.2\p@}
\newlength{\cftsubsubsubsecindent}
\newlength{\cftsubsubsubsecnumwidth}
\setlength{\cftsubsubsubsecindent}{7em}
\setlength{\cftsubsubsubsecnumwidth}{4em}
\newcommand{\cftsubsubsubsecfont}{\normalfont}
\newcommand{\cftsubsubsubsecpresnum}{}
\newcommand{\cftsubsubsubsecaftersnum}{}
\newcommand{\cftsubsubsubsecaftersnumb}{}
\newcommand{\cftsubsubsubsecleader}{\normalfont\cftdotfill{\cftsubsubsubsecdotsep}}
\newcommand{\cftsubsubsubsecdotsep}{\cftdotsep}
\newcommand{\cftsubsubsubsecpagefont}{\normalfont}
\newcommand{\cftsubsubsubsecafterpnum}{}
\newcommand{\cftsubsubsubsecfillnum}[1]{%
	{\cftsubsubsubsecleader}\nobreak
		\makebox[\@pnumwidth][\cftpnumalign]{\cftsubsubsubsecpagefont #1}\cftsubsubsubsecafterpnum\par
	}

%重写tocloft相关定义，解决tocloft中无法修改目录等级的问题
\renewcommand*{\l@paragraph}[2]{%
	\ifnum \c@tocdepth > 4 \relax
	\vskip \cftbeforeparaskip
	{\leftskip \cftparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftparanumwidth\relax
		\let\@cftbsnum \cftparapresnum
		\let\@cftasnum \cftparaaftersnum
		\let\@cftasnumb \cftparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftparafont #1}\nobreak
		\cftparafillnum{#2}}%
	\fi}
\renewcommand*{\l@subparagraph}[2]{%
	\ifnum \c@tocdepth > 5 \relax
	\vskip \cftbeforesubparaskip
	{\leftskip \cftsubparaindent\relax
		\rightskip \@tocrmarg
		\parfillskip -\rightskip
		\parindent \cftsubparaindent\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima \cftsubparanumwidth\relax
		\let\@cftbsnum \cftsubparapresnum
		\let\@cftasnum \cftsubparaaftersnum
		\let\@cftasnumb \cftsubparaaftersnumb
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\cftsubparafont #1}\nobreak
		\cftsubparafillnum{#2}}%
	\fi}

%重新设置缩进
\setlength{\cftparaindent}{11em}
\setlength{\cftparanumwidth}{5em}
\setlength{\cftsubparaindent}{13em}
\setlength{\cftsubparanumwidth}{6em}

%设置目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

%设置附录
\RequirePackage[title,titletoc]{appendix}
\renewcommand{\appendixname}{附录}

%设置标题的引用
\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}



%
%	---	设置脚注格式
%
%脚注每页重新计数
\@addtoreset{footnote}{page}



%
%	---	设置图表格式
%
%设置图表标题的计数方式
\renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@table}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}

%设置标题的样式
\RequirePackage{caption}
\DeclareCaptionFont{hust}{\normalsize \heiti}
\captionsetup{labelsep=quad}
\captionsetup{font={hust,singlespacing}}
\captionsetup[figure]{position=bottom,skip={0pt}}
\captionsetup[table]{position=top,skip={0pt}}
\setlength{\textfloatsep}{6pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%重新设置图表autoref
%\newcommand{\figureautorefname}{图}
\def\figureautorefname~#1\null{%
	图~#1~\null
}
%\newcommand{\tableautorefname}{表}
\def\tableautorefname~#1\null{%
	表~#1~\null
}

%使用tabularx库并定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}

%添加复杂的表格需求库
\RequirePackage{booktabs}

%设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

%添加图需要的库
\RequirePackage{graphicx}

%重新定义图和表的浮动环境，使其方便使用
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}



%
%	---	设置公式格式
%
%使用ams的数学库
\RequirePackage{amsmath}

%设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt} 
}

%公式编号带章节
\numberwithin{equation}{section}

%重新设置公式autoref
%\newcommand{\equationautorefname}{等式}
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}



%
%	---	定义列表项的样式
%
\RequirePackage{enumitem}
\setlist{noitemsep}



%
%	---	定义新的标题页面
%
%用于解析参数
\RequirePackage{kvsetkeys}

%添加几个新的文档属性
\def \@classname {}
\def \@stunum {}
\def \@classnum {}
\def \@instructor {}
\def \@school {}
\newcommand{\classname}[1]{\def \@classname {#1}}
\newcommand{\stunum}[1]{\def \@stunum {#1}}
\newcommand{\classnum}[1]{\def \@classnum {#1}}
\newcommand{\instructor}[1]{\def \@instructor {#1}}
\newcommand{\school}[1]{\def \@school {#1}}

%设置maketitle的参数解析
\newcommand{\arg@maketitle}[2]{
	\IfStrEqCase{#1}{
		{line length}{\def\HGSCP@titlelength{#2}}
		{line font}{
			\IfStrEqCase{#2}{
				{huawenzhongsong}{\def\HGSCP@titlelinefont{\huawenzhongsong}}
				{songti}{\def\HGSCP@titlelinefont{\songti}}
				{heiti}{\def\HGSCP@titlelinefont{\heiti}}
				{fangsong}{\def\HGSCP@titlelinefont{\fangsong}}
				{kaishu}{\def\HGSCP@titlelinefont{\kaishu}}
				{lishu}{\def\HGSCP@titlelinefont{\lishu}}
				{youyuan}{\def\HGSCP@titlelinefont{\youyuan}}
			}[\ClassWarning{\HGSCP@name}{There's no such value for #1 (maketitle)}]
		}
	}[\ClassWarning{\HGSCP@name}{There's no such argument for maketitle}]
}
\newcommand{\maketitlearg}[1]{
	\IfSubStr{#1}{=}{
		\kv@parse{#1}{\arg@maketitle}
	}{
		\def\HGSCP@titlelength{#1}
	}
}

%重置命令maketitle
\renewcommand{\maketitle}[1][12em]{
	\def\HGSCP@titlelength{12em}
	\def\HGSCP@titlelinefont{}
	\maketitlearg{#1}
	\begin{titlepage}
		\renewcommand\arraystretch{1.5}
		\begin{flushright}
			\begin{tabular}{|c|c|}
				\hline
				{\zihao{4} \huawenzhongsong \makebox[4em][s]{分 \hfill 数：}}&\makebox[8em][s]{ }\\
				\hline
				{\zihao{4} \huawenzhongsong	\makebox[4em][s]{评卷人：}}&\makebox[8em][s]{ }\\
				\hline
			\end{tabular}
		\end{flushright}
		\renewcommand\arraystretch{1}
		\begin{center}
			\vspace*{3em}
			\includegraphics[height=1.61cm]{HUSTBlack.eps}\\
			\vspace*{2em}
			{\zihao{-0} \huawenzhongsong \bfseries 研究生（\HGSCP@titlelinefont\@classname）课程论文}\\
			\vspace{2em}
			{\zihao{2} \heiti \bfseries \@title}\\
			\vspace{6em}
			{\zihao{3} \huawenzhongsong 
				\begin{tabular}{lc}
					\makebox[6em][s]{学 \hfill 号} &
					\underline{\makebox[\HGSCP@titlelength]{\HGSCP@titlelinefont\@stunum}} \\
					\makebox[6em][s]{姓 \hfill 名} &
					\underline{\makebox[\HGSCP@titlelength]{\HGSCP@titlelinefont\@author}} \\
					\makebox[6em][s]{专 \hfill 业} &
					\underline{\makebox[\HGSCP@titlelength]{\HGSCP@titlelinefont\@classnum}} \\
					\makebox[6em][s]{课程指导教师} &
					\underline{\makebox[\HGSCP@titlelength]{\HGSCP@titlelinefont\@instructor}} \\
					\makebox[6em][s]{院（系、所）} &
					\underline{\makebox[\HGSCP@titlelength]{\HGSCP@titlelinefont\@school}} \\	
			\end{tabular}}\\
			\vspace{12em}
			{\zihao{4} \huawenzhongsong \@date}\\
		\end{center}
	\end{titlepage}
}



%
%	---	定义新的中英文摘要环境
%
%中文摘要环境
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
	\clearpage 
	\phantomsection
	\addcontentsline{toc}{section}{摘要}
	\begin{center} \heiti \bfseries \zihao{-2} 摘 \hspace{2em} 要 \end{center}
	
}{
	\vspace{1em}
	\par\noindent {\heiti\zihao{4}\bfseries 关键词：} \cnkeyword
	\clearpage
}

%英文摘要环境
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage 
	\phantomsection
	\addcontentsline{toc}{section}{Abstract}
	\begin{center} \bfseries \zihao{-2} Abstract \end{center}
	
}{
	\vspace{1em}
	\par\noindent {\zihao{4}\bfseries Key Words: } \enkeyword
	\clearpage
}



%
%	---	定义新的目录页面
%
\hypersetup{
	%colorlinks = true,
	%linkcolor  = black,
	pdfborder = 000,%去掉链接红框
	pdfstartview=FitH%打开页面以窗口宽度显示
} 
\renewcommand{\cfttoctitlefont}{\hfill \heiti \zihao{-2} \bfseries}
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{\cftdotsep} %设置Section引导点
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
\renewcommand{\cftpartfont}{\songti \bfseries} %设置Part字体
\renewcommand{\cftsecfont}{\songti \bfseries} %设置Section字体

%设置tableofcontents参数解析
\newcommand{\arg@tableofcontents}[2]{
	\IfStrEqCase{#1}{
		{pagenum}{
			\IfStrEqCase{#2}{
				{yes}{\def\HGSCP@plainfooterstyle{\footstyle}}
				{true}{\def\HGSCP@plainfooterstyle{\footstyle}}
				{no}{\def\HGSCP@plainfooterstyle{}}
				{false}{\def\HGSCP@plainfooterstyle{}}
			}[\ClassWarning{\HGSCP@name}{There's no such value for #1 (tableofcontents)}]
		}
		{toc in toc}{
			\IfStrEqCase{#2}{
				{yes}{\def\HGSCP@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
				}}
				{true}{\def\HGSCP@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
				}}
				{no}{\def\HGSCP@addtoctotoc{}}
				{false}{\def\HGSCP@addtoctotoc{}}
			}[\ClassWarning{\HGSCP@name}{There's no such value for #1 (tableofcontents)}]
		}
		{level}{\setcounter{tocdepth}{#2}}
		{section indent}{\renewcommand{\cftsecindent}{#2}}
		{subsection indent}{\renewcommand{\cftsubsecindent}{#2}}
		{subsubsection indent}{\renewcommand{\cftsubsubsecindent}{#2}}
		{subsubsubsection indent}{\renewcommand{\cftsubsubsubsecindent}{#2}}
		{paragraph indent}{\renewcommand{\cftparaindent}{#2}}
		{subparagraph indent}{\renewcommand{\cftsubparaindent}{#2}}
		{indent}{
			\IfStrEqCase{#2}{
				{normal}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{3.8em}
					\renewcommand{\cftsubsubsubsecindent}{7em}
					\renewcommand{\cftparaindent}{11em}
					\renewcommand{\cftsubparaindent}{13em}
				}
				{noindent}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{0em}
					\renewcommand{\cftsubsubsecindent}{0em}
					\renewcommand{\cftsubsubsubsecindent}{0em}
					\renewcommand{\cftparaindent}{0em}
					\renewcommand{\cftsubparaindent}{0em}
				}
				{hustnoindent}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsecnumwidth}{3em}
					\renewcommand{\cftsubsecindent}{0em}
					\renewcommand{\cftsubsecnumwidth}{3em}
					\renewcommand{\cftsubsubsecindent}{0em}
					\renewcommand{\cftsubsubsecnumwidth}{4em}
					\renewcommand{\cftsubsubsubsecindent}{0em}
					\renewcommand{\cftsubsubsubsecnumwidth}{5em}
					\renewcommand{\cftparaindent}{0em}
					\renewcommand{\cftparanumwidth}{6em}
					\renewcommand{\cftsubparaindent}{0em}
					\renewcommand{\cftsubparanumwidth}{6em}
				}
				{sameforsubandsubsub}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsubsecindent}{1.5em}
					\renewcommand{\cftparaindent}{1.5em}
					\renewcommand{\cftsubparaindent}{1.5em}
				}
			}[\ClassWarning{\HGSCP@name}{There's no such value for #1 (tableofcontents)}]
		}
		{dot sep}{\renewcommand{\cftdotsep}{#2}}
		{section dot sep}{\renewcommand{\cftsecdotsep}{#2}}
		{subsection dot sep}{\renewcommand{\cftsubsecdotsep}{#2}}
		{subsubsection dot sep}{\renewcommand{\cftsubsubsecdotsep}{#2}}
		{subsubsubsection dot sep}{\renewcommand{\cftsubsubsubsecdotsep}{#2}}
		{paragraph dot sep}{\renewcommand{\cftparadotsep}{#2}}
		{subparagraph dot sep}{\renewcommand{\cftsubparadotsep}{#2}}
	}[\ClassWarning{\HGSCP@name}{There's no such argument for tableofcontents}]
}
\AtBeginDocument{
	%设置新的生成目录命令
	\let \oldtableofcontents \tableofcontents
	\renewcommand{\tableofcontents}[1][pagenum=false,toc in toc=false]{
		\def\HGSCP@plainfooterstyle{}
		\def\HGSCP@addtoctotoc{}
		\kv@parse{#1}{\arg@tableofcontents}
		%修改hdr原plain格式
		\fancypagestyle{plain}{%
			\fancyhf{} %清空原有样式
			\headstyle
			\HGSCP@plainfooterstyle
		}
		%设置目录hdr和页码选项
		\clearpage
		\pagestyle{plain}
		\HGSCP@addtoctotoc
		\oldtableofcontents
		\clearpage
		\pagestyle{main}
	}
	%旧的命令
	\newcommand{\maketoc}[1][nopagenum]{
		\IfStrEqCase{#1}{{nopagenum}{\tableofcontents[pagenum=false,toc in toc=false]}
			{pagenum}{\tableofcontents[pagenum=true,toc in toc=false]}
			{pagenumtoc}{\tableofcontents[pagenum=true,toc in toc=true]}
		}
	}
}



%
%	---	定义新的致谢环境
%
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{致谢}
	\section*{致谢}
}{
	\clearpage
}



%
%	---	重新定义参考文献页
%
%设置参考文献
\RequirePackage{natbib}
\setcitestyle{numbers,square,comma}
\ctexset{bibname={参考文献}}

%正常引用和上标引用
\let \normalcite \cite
\newcommand{\supercite}[2][]{
	\unskip
	\def\HGSCP@temp{#1}
	\ifx\HGSCP@temp\empty{\unskip\textsuperscript{\normalcite{#2}}}
	\else{\unskip\textsuperscript{\normalcite[#1]{#2}}}\fi
}
\IfStrEqCase{\HGSCP@citestyle}{
	{normal}{}
	{super}{\let \cite \supercite}
}

%设置参考文献样式
\IfStrEqCase{\HGSCP@citebst}{
	{gbt7714-2005}{\bibliographystyle{gbt7714-2005}}
	{gbt7714-2015}{\bibliographystyle{gbt7714-2015}}
	{thuthesis}{
		\bibliographystyle{thuthesis-numeric}
		\def\thudot{\unskip.}
	}
}

%设置新的参考文献
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	%添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{参考文献}
	\oldbibliography{#1}
}



%
%	---	定义新的签名页面
%
%设置signature的参数解析
\newcommand{\arg@signature}[2]{
	\IfStrEqCase{#1}{
		{blank lines}{\def\HGSCP@blanklines{#2}}
	}[\ClassWarning{\HGP@name}{There's no such argument for signature}]
}
\newcommand{\signaturearg}[1]{
	\IfSubStr{#1}{=}{
		\kv@parse{#1}{\arg@signature}
	}{
		\def\HGSCP@blanklines{#1}
	}
}

%设置命令
\newcommand{\signature}[1][12em]{
	\def\HGSCP@blanklines{12em}
	\signaturearg{#1}
	\thispagestyle{empty}

	\vspace*{\HGSCP@blanklines}
	
	\leftline{\zihao{4} \songti \bfseries 研 \space 究 \space 生 \space 签 \space 字 \space \underline{\makebox[8em]{}}}
	
	\clearpage
}

%旧的命令
\newcommand{\makesignature}[2][]{\signature[blanklines=#2]}



%
%	---	其他设置
%
%pdf文件信息设置
\AtBeginDocument{
	\hypersetup{
		pdfinfo={
			Title={\@title},
			Author={\@author},
			Subject={华中科技大学研究课程论文}
		}
	}
}
