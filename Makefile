CONFIGS = \
	Makefile \
	Xdefaults \
	bashrc \
	inkpot.vim \
	procmailrc \
	screenrc \
	securemodelines.vim \
	toprc \
	vimrc

default : all

all : $(CONFIGS)

clean :
	rm *~ ftp-install-script || true

install-file-% : %
	install $* $(HOME)/.$*

install-file-inkpot.vim : inkpot.vim
	install $< $(HOME)/.vim/colors/$<

install-file-securemodelines.vim : securemodelines.vim
	install $< $(HOME)/.vim/plugin/$<

install: $(foreach f, $(CONFIGS), install-file-$(f) )

