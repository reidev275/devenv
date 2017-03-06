# docker build -t devenv .
# docker run -itv %cd%/usr/src/app devenv bash

FROM node:7.5

MAINTAINER Reid Evans <reidev275@gmail.com>


#environment config
RUN apt-get update  && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y git
RUN apt-get install -y tmux
RUN apt-get install -y curl
RUN apt-get install -y zip unzip
RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && ~/.bash_it/install.sh --silent

#Vim8
RUN apt-get install ncurses-dev
RUN wget https://github.com/vim/vim/archive/master.zip
RUN unzip master.zip
RUN cd vim-master && cd src/ && ./configure --with-features=big && make && make install

#dotfiles
RUN curl -LSso ~/.vimrc https://raw.githubusercontent.com/reidev275/devenv/master/.vimrc
# RUN curl -LSso ~/.bashrc https://raw.githubusercontent.com/reidev275/devenv/master/.bashrc

#vim plugins
RUN mkdir -p ~/.vim/pack/plugins/start
RUN git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/pack/plugins/start/syntastic
RUN git clone https://github.com/ElmCast/elm-vim.git ~/.vim/pack/plugins/start/elm-vim
RUN git clone https://github.com/raichoo/purescript-vim.git ~/.vim/pack/plugins/start/purescript-vim
RUN git clone https://github.com/FrigoEU/psc-ide-vim.git ~/.vim/pack/plugins/start/psc-ide-vim
RUN git clone https://github.com/jelera/vim-javascript-syntax.git ~/.vim/pack/plugins/start/vim-javascript-syntax
RUN git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/plugins/start/typescript-vim

#vim colors
RUN mkdir ~/.vim/colors
RUN curl -LSso ~/.vim/colors/moriarty.vim https://raw.githubusercontent.com/aliou/moriarty.vim/master/colors/moriarty.vim

#front end build tools
RUN npm install -g uglify-js && \
	npm install -g eslint && \
    npm install -g node-sass && \
 	npm rebuild node-sass

#angular
RUN npm install -g @angular/cli

# purescript
RUN npm install -g purescript && \
	npm install -g pulp bower


# elm
RUN npm install -g elm && \
	npm install -g elm-oracle && \
	npm install -g elm-test
