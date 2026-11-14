$pdf_mode = 1;                  # 1 = pdflatex (change to 4 for lualatex)
$out_dir = 'build';             # Directs all build artifacts and PDF into build/
$emulate_aux = 1;               # Required for TeX Live on Linux to manage subdirs
@default_files = ('main.tex');  # Your root file name
