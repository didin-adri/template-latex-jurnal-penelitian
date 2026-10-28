# Template Jurnal GENETIKA — LaTeX

Template penulisan artikel ilmiah untuk **Jurnal GENETIKA (Generasi Teknologi Informasi dan Informatika), Universitas Muhammadiyah Buton**, menggunakan LaTeX.

Template ini dirancang untuk membantu penulis menyusun manuskrip ilmiah dengan format yang konsisten, meliputi identitas artikel, informasi penulis, abstrak, kata kunci, isi artikel, tabel, gambar, header, footer, dan daftar pustaka.

## Fitur

- Kelas dokumen khusus `jurnalft.cls`.
- Pengaturan ukuran kertas A4 dan margin halaman.
- Format header dan footer menggunakan `fancyhdr`.
- Pengelolaan judul artikel, penulis, afiliasi, dan penulis korespondensi.
- Lingkungan abstrak dengan informasi sejarah artikel dan kata kunci.
- Pengaturan format judul bagian dan subbagian.
- Dukungan tabel, gambar, dan referensi silang.
- Pengelolaan sitasi menggunakan `natbib`.
- Pengelolaan daftar pustaka menggunakan BibTeX.
- Kompatibel untuk digunakan dalam proyek Overleaf dengan berkas pendukung yang lengkap.

## Struktur Repositori

Contoh struktur berkas yang digunakan:

```text
template-jurnal-genetika/
├── jurnalft.cls
├── main.tex
├── referensi.bib
├── cekUpdate.jpg
├── gambar2.png
└── README.md
```

Keterangan:

| Berkas | Fungsi |
|---|---|
| `jurnalft.cls` | Kelas dokumen yang mengatur format jurnal. |
| `main.tex` | Berkas utama untuk menyusun artikel. |
| `referensi.bib` | Basis data referensi bibliografi. |
| `cekUpdate.jpg` | Logo atau gambar yang ditampilkan pada header. |
| `gambar2.png` | Contoh gambar yang digunakan dalam artikel. |
| `README.md` | Dokumentasi repositori. |

Nama dan jumlah berkas dapat disesuaikan dengan isi repositori yang sebenarnya.

## Persyaratan

Untuk menggunakan template, diperlukan:

- Distribusi LaTeX yang mendukung paket-paket yang digunakan.
- BibTeX untuk memproses daftar pustaka.
- Paket LaTeX `natbib`, `fancyhdr`, `graphicx`, `titlesec`, `caption`, `hyperref`, `geometry`, dan paket lain yang dipanggil dalam kelas dokumen.
- Berkas pendukung yang dirujuk oleh dokumen, termasuk gambar dan basis data bibliografi.

Overleaf dapat digunakan tanpa instalasi LaTeX lokal.

## Cara Menggunakan di Overleaf

1. Unduh repositori sebagai ZIP melalui GitHub atau impor repositori melalui fitur integrasi GitHub yang tersedia di Overleaf.
2. Pastikan semua berkas pendukung telah tersedia dalam proyek.
3. Buka `main.tex`.
4. Atur `main.tex` sebagai **Main document** jika diperlukan.
5. Pilih compiler LaTeX yang sesuai dengan konfigurasi proyek.
6. Klik **Recompile** untuk menghasilkan dokumen PDF.

Pastikan berkas `jurnalft.cls` dan seluruh gambar yang digunakan berada pada lokasi yang dapat diakses oleh `main.tex`.

## Informasi Artikel

Informasi jurnal diatur melalui perintah khusus yang didefinisikan dalam `jurnalft.cls`.

Contoh:

```latex
\documentclass{jurnalft}

\edisiJurnal{Agustus 2025}
\volJurnal{5}
\nomorVolume{1}
\jurnalDoi{10.124153/2232}
\startingPage{12}

\tanggalTerima{1 Juli 2025}
\tanggalSetuju{2 Juli 2025}
\tanggalTerbit{10 Juli 2025}
```

Ganti nilai contoh tersebut dengan informasi yang sesuai dengan artikel dan edisi jurnal yang dituju.

## Penulisan Judul dan Penulis

Template menyediakan perintah untuk mendefinisikan judul artikel, penulis, afiliasi, dan alamat korespondensi.

```latex
\setJudulArtikel{Judul Artikel Ilmiah}

\tambahPenulis{Nama Penulis Pertama}{1}
\tambahPenulis{Nama Penulis Kedua}{2}

\tambahAfiliasi{1}{Program Studi, Nama Universitas}
\tambahAfiliasi{2}{Fakultas, Nama Universitas}

\setKorespondensi{email@universitas.ac.id}
```

Untuk menampilkan informasi tersebut, gunakan:

```latex
\cetakDaftarPenulis
```

## Abstrak dan Kata Kunci

Template menyediakan lingkungan `abstrak` untuk menampilkan abstrak beserta informasi sejarah artikel dan kata kunci.

Contoh:

```latex
\kataKunci{machine learning; klasifikasi; kecerdasan buatan}

\tanggalTerima{1 Juli 2025}
\tanggalSetuju{2 Juli 2025}
\tanggalTerbit{10 Juli 2025}

\begin{document}

\begin{abstrak}
Tuliskan abstrak artikel dalam paragraf yang ringkas,
mencakup latar belakang, tujuan, metode, hasil, dan kesimpulan.
\end{abstrak}

\end{document}
```

Sesuaikan bahasa, panjang abstrak, dan format kata kunci dengan pedoman penulisan jurnal.

## Sitasi dan Daftar Pustaka

Template menggunakan `natbib` untuk mengelola sitasi serta BibTeX untuk menghasilkan daftar pustaka.

Contoh konfigurasi:

```latex
\usepackage[round,authoryear]{natbib}
\bibliographystyle{apalike}
```

Contoh sitasi dalam naskah:

```latex
Menurut \citet{rudin1976}, ...
Pendekatan tersebut telah dibahas sebelumnya \citep{lamport1994}.
```

Pada bagian akhir dokumen, gunakan:

```latex
\renewcommand{\refname}{Daftar Pustaka}
\bibliography{referensi}
```

Berkas `referensi.bib` harus tersedia di proyek dan berisi entri bibliografi dengan kunci yang sesuai dengan perintah sitasi.

Contoh entri BibTeX:

```bibtex
@book{rudin1976,
  author    = {Rudin, Walter},
  title     = {Principles of Mathematical Analysis},
  publisher = {McGraw-Hill},
  year      = {1976}
}
```

**Catatan:** `apalike` merupakan gaya bibliografi penulis–tahun, bukan implementasi resmi APA. Jika jurnal mewajibkan gaya APA tertentu, gunakan berkas gaya `.bst` yang sesuai dan tersedia dalam distribusi template.

## Tabel dan Gambar

Untuk tabel, template mendukung paket `booktabs` agar penyajian tabel lebih terstruktur.

Contoh:

```latex
\begin{table}[htbp]
    \centering
    \caption{Contoh Tabel}
    \label{tab:contoh}
    \begin{tabular}{lc}
        \toprule
        Variabel & Nilai \\
        \midrule
        A & 10 \\
        B & 20 \\
        \bottomrule
    \end{tabular}
\end{table}
```

Contoh penyisipan gambar:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\linewidth]{gambar2.png}
    \caption{Contoh gambar penelitian}
    \label{fig:contoh}
\end{figure}
```

Pastikan nama berkas gambar sesuai dengan nama dan ekstensi berkas yang tersedia dalam repositori.

## Pemecahan Masalah

### 1. BibTeX tidak menemukan berkas gaya bibliografi

Pesan yang mungkin muncul:

```text
BibTeX: I couldn't open style file apa.bst
```

Penyebabnya adalah berkas `apa.bst` tidak ditemukan atau tidak tersedia dalam proyek maupun distribusi LaTeX.

Solusi:

- Gunakan `\bibliographystyle{apalike}` jika gaya tersebut memenuhi kebutuhan jurnal.
- Jika gaya APA tertentu diwajibkan, tambahkan berkas `.bst` yang sesuai ke proyek.
- Pastikan nama berkas gaya yang dipanggil sesuai dengan berkas yang tersedia.

### 2. Peringatan `fancyhdr` mengenai `\headheight`

Pesan yang mungkin muncul:

```text
Package fancyhdr Warning: \headheight is too small
```

Peringatan ini menunjukkan bahwa tinggi header yang ditetapkan tidak mencukupi isi header.

Sesuaikan nilai `\headheight` di `jurnalft.cls`. Sebagai contoh:

```latex
\setlength{\headheight}{32pt}
```

Nilai tersebut merupakan titik awal berdasarkan kebutuhan header sekitar 31,28 pt. Sesuaikan kembali jika struktur header berubah. Pengaturan `\headsep` dapat digunakan untuk mengendalikan jarak antara header dan isi halaman.

### 3. Gambar tidak ditemukan

Periksa apakah nama dan ekstensi gambar pada `\includegraphics` sesuai dengan berkas yang diunggah. Perhatikan juga penggunaan huruf besar dan kecil pada nama berkas.

### 4. Referensi belum muncul

Pastikan setiap kunci sitasi tersedia di `referensi.bib`, nama berkas bibliografi benar, dan dokumen dikompilasi ulang hingga referensi diperbarui.

## Pengembangan

Template dapat dikembangkan lebih lanjut untuk menyesuaikan kebutuhan penerbitan jurnal, termasuk:

- Penyempurnaan tata letak halaman.
- Penyesuaian gaya bibliografi.
- Pengaturan format tabel dan gambar.
- Penambahan metadata artikel.
- Peningkatan kompatibilitas dengan Overleaf dan distribusi LaTeX lokal.

Perubahan pada `jurnalft.cls` sebaiknya diuji menggunakan artikel contoh sebelum diterapkan pada naskah yang akan diterbitkan.

## Lisensi dan Penggunaan

Lisensi penggunaan, modifikasi, dan distribusi mengikuti ketentuan yang ditetapkan oleh pemilik repositori.

Jika repositori belum menetapkan lisensi, jangan mengasumsikan bahwa kode atau aset di dalamnya bebas digunakan kembali.

## Kontribusi

Saran perbaikan dan pelaporan masalah dapat disampaikan melalui fitur **Issues** pada repositori GitHub, jika fitur tersebut diaktifkan.

---

**Catatan:** Template ini merupakan sarana penyusunan dokumen LaTeX. Penulis tetap bertanggung jawab memastikan bahwa naskah akhir memenuhi pedoman resmi Jurnal GENETIKA sebelum pengiriman.
