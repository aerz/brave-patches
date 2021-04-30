WORKDIR = $(PWD)
BRAVEDIR = $(HOME)/.cache/paru/clone/brave

patch/gtk-dark:
	@if [ ! -d $(BRAVEDIR) ]; then \
		git clone https://aur.archlinux.org/brave.git $(BRAVEDIR); \
	fi
	patch $(BRAVEDIR)/PKGBUILD $(WORKDIR)/PKGBUILD.patch
	cp $(WORKDIR)/patches/gtk-dark-mode-switch-fix.patch $(BRAVEDIR)/gtk-dark-mode-switch-fix.patch
	cd $(BRAVEDIR) && git add -A . && git commit -m "Apply GTK dark mode switch patch"
