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

#Vim8
RUN apt-get install ncurses-dev
RUN wget https://github.com/vim/vim/archive/master.zip
RUN unzip master.zip
RUN cd vim-master && cd src/ && ./configure && make && make install

#vim plugins
# RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN curl -LSso ~/.vimrc https://raw.githubusercontent.com/reidev275/devenv/master/.vimrc
RUN curl -LSso ~/.bashrc https://raw.githubusercontent.com/reidev275/devenv/master/.bashrc

RUN git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
RUN git clone https://github.com/ElmCast/elm-vim.git ~/.vim/bundle/elm-vim
RUN git clone https://github.com/wookiehangover/jshint.vim.git ~/.vim/bundle/jshint.vim
RUN git clone https://github.com/raichoo/purescript-vim.git ~/.vim/bundle/purescript-vim
RUN git clone https://github.com/jelera/vim-javascript-syntax.git ~/.vim/bundle/vim-javascript-syntax



#vim colors
RUN mkdir ~/.vim/colors
RUN curl -LSso ~/.vim/colors/moriarty.vim https://raw.githubusercontent.com/aliou/moriarty.vim/master/colors/moriarty.vim

#nodejs
# RUN curl -sl https://deb.nodesource.com/setup_7.x && apt-get install -y nodejs
# RUN npm install npm -g

#front end build tools
RUN npm install -g uglify-js && \
    npm install -g node-sass && \
 	npm rebuild node-sass

# purescript
RUN npm install -g purescript && \
	npm install -g pulp bower


# elm
RUN npm install -g elm && \
	npm install -g elm-oracle && \
	npm install -g elm-test
