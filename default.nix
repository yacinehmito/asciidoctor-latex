with import <yarnpkgs>;
let 
  tex = texlive.combine {
    inherit (texlive)
      # For asciidoctor-latex
      scheme-basic
      xetex
      xetex-def
      latex

      # Explicit dependencies of the default preamble
      tcolorbox
      lipsum
      xcolor
      mhchem
      fontspec
      ucharclasses
      wrapfig

      # Transitive dependencies of the default preamble
      pgf
      environ
      etoolbox
      trimspaces
      chemgreek
      xunicode

      # Mysteriously required stuff
      ms
      l3kernel
      l3packages
      l3experimental
      euenc
      zapfding

      # For tufte
      tufte-latex

      # Mysteriously required stuff
      hardwrap
      xltxtra
      titlesec
      textcase
      setspace
      realscripts

      # tufte-latex' optional dependencies
      bera
      psnfss
      oberdiek
      ifxetex
      microtype
      mathpazo
      # soul

      # Unicode math
      unicode-math
      # Dependencies
      filehook
      lualatex-math

      lm-math
      tex-gyre-math
      xits
      Asana-Math
      cm-unicode
      tex-gyre
      ;
  };
in
stdenv.mkDerivation {
  name = "asciidoctor-latex";
  buildInputs = [ zlib libiconv ruby.dev tex ];
  shellHook = ''
    export PATH=$(pwd)/.bin:$PATH
    export BUNDLE_BIN=$(pwd)/.bin
    export GEM_PATH=$(pwd)/.gem
    export GEM_HOME=$(pwd)/.gem
  '';
}
