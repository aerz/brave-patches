WORKDIR    = $(PWD)
PARU_CACHE = $(HOME)/.cache/paru/clone
BRAVEDIR   = $(PARU_CACHE)/brave

patch/gtk-dark:
	@if [ ! -d $(BRAVEDIR) ]; then \
		cd $(PARU_CACHE) && paru -G brave; \
	fi
	patch $(BRAVEDIR)/PKGBUILD $(WORKDIR)/PKGBUILD.patch
	cp $(WORKDIR)/patches/gtk-dark-mode-switch-fix.patch $(BRAVEDIR)/gtk-dark-mode-switch-fix.patch
	cd $(BRAVEDIR) && git add -A . && git commit -m "Apply GTK dark mode switch patch"
