\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jurnalft}[2025/07/29 Versi awal kelas dokumen]

% Pemanggilan kelas dasar
\LoadClass[11pt]{article}

\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{hyperref}
\RequirePackage{indentfirst}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage[english]{babel}

% Atur Margin
\RequirePackage[a4paper, papersize={21cm, 29.7cm}]{geometry}
\geometry{
	top=2cm,left=1.5cm,right=1.5cm,bottom=2.5cm
}
\setlength{\headheight}{32pt}   % Pastikan cukup untuk header multi-baris
\setlength{\headsep}{20pt}      % Tambahkan jarak antara header dan isi halaman

\newcommand{\namaJurnal}[1]{\newcommand{\@namaJurnal}{#1}}
\newcommand{\edisiJurnal}[1]{\newcommand{\@edisiJurnal}{#1}}
\newcommand{\volJurnal}[1]{\newcommand{\@volJurnal}{#1}}
\newcommand{\nomorVolume}[1]{\newcommand{\@nomorVolume}{#1}}
\newcommand{\jurnalDoi}[1]{\newcommand{\@jurnalDoi}{#1}}

\newcommand{\tanggalTerbit}[1]{\newcommand{\@tanggalTerbit}{#1}}
\newcommand{\tanggalTerima}[1]{\newcommand{\@tanggalTerima}{#1}}
\newcommand{\tanggalSetuju}[1]{\newcommand{\@tanggalSetuju}{#1}}

\newcommand{\kataKunci}[1]{\newcommand{\@kataKunci}{#1}}

\namaJurnal{Jurnal GENETIKA (Generasi Teknologi Informasi dan Informatika)}

\newcommand{\startingPage}[1]{
	\setcounter{page}{#1}
	\newcommand{\@startingPage}{#1}
}

\newcommand{\cetakLogo}{
	\noindent
	\begin{minipage}{0.82\textwidth}
		\flushleft
		\textit{\textbf{\@namaJurnal}} \\ \@edisiJurnal, Volume \@volJurnal, No. \@nomorVolume, Hal. \@startingPage-\pageref{LastPage} \\
		DOI : \href{https://dx.doi.org/\@jurnalDoi}{\@jurnalDoi} \\
		e-ISSN : 1234-5678 – p-ISSN : 8765-4321
	\end{minipage}
	\hfill
	\begin{minipage}{0.15\textwidth}
		\flushright
		\href{https://dx.doi.org/\@jurnalDoi}{
		\includegraphics[height=1.8cm]{cekUpdate.jpg}
	}
	\end{minipage}
	\textcolor{gray}{\rule{\textwidth}{6pt}}
	
}

\newcommand{\cetakHeader}{
	\cetakLogo
	\thispagestyle{firstPage}
}

%Style header dan Footer
\fancypagestyle{firstPage}{
	\fancyhf{}
	
	\fancyfoot[C]{- \thepage \space -}
	\renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{shf}{
	\fancyhf{} % Clear Style
	
	\fancyhead[L]{Jurnal Genetika\\ \@edisiJurnal}	
	\fancyhead[R]{ 
		\\ Vol. \@volJurnal, No. \@nomorVolume 
		\\ Hal. \@startingPage-\pageref{LastPage}
	}	
	
	\fancyhead[C]{- \thepage \space -}
	
	\renewcommand{\headrulewidth}{1pt}
}

\pagestyle{shf}

\newsavebox{\abstrakbox}
\newenvironment{abstrak}
{%
	\par\vspace{10pt}%
	\begingroup%
	\setlength{\fboxsep}{10pt}% Padding antara teks dan warna latar
	
	% Simpan isi abstrak dalam box untuk diberi warna
	\begin{lrbox}{\abstrakbox}%
		\begin{minipage}[t]{0.65\textwidth}%
			\noindent\textbf{ABSTRAK}\par\vspace{4pt}%
		}
		{%
		\end{minipage}%
	\end{lrbox}%
	
	% Tampilkan hasil dengan latar belakang berwarna
	\noindent
	\colorbox{gray!15}{\usebox{\abstrakbox}}%
	\hfill%
	\begin{minipage}[t]{0.3\textwidth}
		\noindent
		\textbf{SEJARAH ARTIKEL} \par
		Diterima \@tanggalTerima \\
		Disetujui \@tanggalSetuju \\
		Diterbitkan \@tanggalTerbit \par
		\vspace{10pt}
		\noindent
		\textbf{KATA KUNCI}  \par
		\@kataKunci
	\end{minipage}%
	\endgroup%
	\par\vspace{10pt}%
}


\RequirePackage{xparse}
\RequirePackage{expl3}

% Aktifkan mode LaTeX3
\ExplSyntaxOn

% ============================
% Inisialisasi Variabel Global
% ============================
\seq_new:N \g_penulis_list_seq
\seq_new:N \g_afiliasi_list_seq
\tl_new:N \g_korespondensi_tl
\tl_new:N \g_judul_artikel_tl

% ===========================
% Definisi Perintah Kustom
% ===========================

% Tambah penulis: \tambahPenulis{Nama}{KodeAfiliasi}
\NewDocumentCommand{\tambahPenulis}{m m}{
	\seq_gput_right:Nn \g_penulis_list_seq {#1\textsuperscript{#2}}
}

% Tambah afiliasi: \tambahAfiliasi{Kode}{Nama Afiliasi}
\NewDocumentCommand{\tambahAfiliasi}{m m}{
	\seq_gput_right:Nn \g_afiliasi_list_seq {\textsuperscript{#1}~#2\par}
}

% Set email korespondensi
\NewDocumentCommand{\setKorespondensi}{m}{
	\tl_gset:Nn \g_korespondensi_tl {
		\textsuperscript{*}Korespondensi: \href{mailto:#1}{#1}\par
	}
}

% Set judul artikel
\NewDocumentCommand{\setJudulArtikel}{m}{
	\tl_gset:Nn \g_judul_artikel_tl {#1}
}

% Cetak semua elemen
\NewDocumentCommand{\cetakDaftarPenulis}{}{
	\begin{flushleft}
		{\Large \bfseries \g_judul_artikel_tl \par}
		\vspace{1em}
		\seq_use:Nn \g_penulis_list_seq {,~}
		\par\vspace{1em}
		\seq_use:Nn \g_afiliasi_list_seq {}
		\vspace{1em}
		\g_korespondensi_tl
	\end{flushleft}
}

\ExplSyntaxOff

% ===================================
% PENGATURAN SECTION (Ukuran & Jarak)
% ===================================

\titleformat{\section}
{\normalsize\bfseries}   % Ukuran dan gaya font
{\thesection.}            % Penomoran (1, 2, ...)
{0.5em}                    % Jarak antara nomor dan judul
{}                       % Tambahan sebelum judul

\titlespacing{\section}
{0pt}                    % Indentasi kiri
{1.51ex}                 % Jarak sebelum section
{0.7ex}                  % Jarak sesudah section


\titleformat{\subsection}
{\normalsize\bfseries}   % Ukuran dan gaya font
{\thesubsection}            % Penomoran (1, 2, ...)
{0.5em}                    % Jarak antara nomor dan judul
{}                       % Tambahan sebelum judul

\titlespacing{\subsection}
{0pt}                    % Indentasi kiri
{1.51ex}                 % Jarak sebelum section
{0.7ex}                  % Jarak sesudah section

\renewcommand{\figurename}{Gambar}
\renewcommand{\tablename}{Tabel}



