;; -*- no-byte-compile: t; -*-
;;; lang/cc/packages.el

(package! cmake-mode
  :recipe (:host github :repo "emacsmirror/cmake-mode" :files (:defaults "*"))
  :pin "b08b5d9045308362a623a4f576896d55ffecfd52")
(package! cuda-mode :pin "7dd07a20c36b41c8cb38cdec989673b73d03e144")
(package! demangle-mode :pin "04f545adab066708d6151f13da65aaf519f8ac4e")
(package! disaster :pin "16bba9afb92aacf06c088c29ba47813b65a80d87")
(unless (modulep! +tree-sitter)
  (package! modern-cpp-font-lock :pin "43c6b68ff58fccdf9deef11674a172e4eaa8455c"))
(package! opencl-mode :pin "204d5d9e0f5cb2cbe810f2933230eb08fe2c7695")

(when (package! glsl-mode :pin "9b2e5f28e489a1f73c4aed734105618ac0dc0c43")
  (when (modulep! :completion company)
    (package! company-glsl
      :recipe (:host github :repo "Kaali/company-glsl")
      :pin "404cd0694ab34971f9c01eb22126cd2e7d3f9dc4")))

(if (modulep! +lsp)
    (unless (modulep! :tools lsp +eglot)
      ;; ccls package is necessary only for lsp-mode.
      (package! ccls :pin "41399b0eba03f9b80769ced71501ba702db4cd62"))
  (when (package! irony :pin "40e0ce19eb850bdf1f77225f11713cc816250d95")
    (package! irony-eldoc :pin "73e79a89fad982a2ba072f2fcc1b4e41f0aa2978")
    (when (and (modulep! :checkers syntax)
               (not (modulep! :checkers syntax +flymake)))
      (package! flycheck-irony :pin "42dbecd4a865cabeb301193bb4d660e26ae3befe"))
    (when (modulep! :completion company)
      (package! company-irony :pin "b44711dfce445610c1ffaec4951c6ff3882b216a")
      (package! company-irony-c-headers :pin "72c386aeb079fb261d9ec02e39211272f76bbd97")))
  (when (package! rtags :pin "f472b5d0a05270d5c93945b6a71771ab69068147")
    (when (modulep! :completion ivy)
      (package! ivy-rtags))
    (when (modulep! :completion helm)
      (package! helm-rtags))))
