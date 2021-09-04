all: dl _all

dl:
	mkdir -p dl

ALL += dl/LibreSprite.AppImage
dl/LibreSprite.AppImage:
	wget https://github.com/LibreSprite/LibreSprite/releases/download/continuous/LibreSprite-4fc8d53-x86_64.AppImage -O dl/LibreSprite.AppImage

ALL += dl/sublime_text_4.tar.xz
dl/sublime_text_4.tar.xz:
	wget https://download.sublimetext.com/sublime_text_build_4113_x64.tar.xz -O dl/sublime_text_4.tar.xz

_all: $(ALL)
