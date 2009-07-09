CONFIGS = \
	Makefile \
	Xdefaults \
	bashrc \
	screenrc \
	toprc \
	vimrc \
	conkyrc-snowmobile \
	conkyrc-snowcone \
	xbindkeysrc-snowcone \
	rc.lua-snowmobile \
	theme.lua-snowmobile

default : all

all : $(CONFIGS)

clean :
	rm *~ ftp-install-script || true

install-file-% : %
	install $* $(HOME)/.$*

install-file-conkyrc-snowmobile : conkyrc-snowmobile
	test `hostname` != 'snowmobile' || install $< $(HOME)/.conkyrc

install-file-conkyrc-snowcone : conkyrc-snowcone
	test `hostname` != 'snowcone' || install $< $(HOME)/.conkyrc

install-file-xbindkeysrc-snowcone : xbindkeysrc-snowcone
	test `hostname` != 'snowcone' || install $< $(HOME)/.xbindkeysrc

install-file-rc.lua-snowmobile : rc.lua-snowmobile
	test `hostname` != 'snowmobile' || install $< $(HOME)/.config/awesome/rc.lua

install-file-theme.lua-snowmobile : theme.lua-snowmobile
	test `hostname` != 'snowmobile' || install $< $(HOME)/.config/awesome/theme.lua

install: $(foreach f, $(CONFIGS), install-file-$(f) )

