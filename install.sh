# update vim8
yum install -y gcc gcc-c++ ruby ruby-devel lua lua-devel  \
    ctags git python python-devel \
    tcl-devel ncurses-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed
    
# update git
yum remove -y git
yum groupinstall -y "Development Tools"
yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y git2u-all

tar -xzf vim-8.1.2251.tar.gz
cd vim-8.1.2251
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib64/python2.7/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local
make && make install
ln -s /usr/bin/vim /usr/local/bin/vim

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# syntastic
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

# nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# ultisnips
git clone git://github.com/SirVer/ultisnips.git ~/.vim/bundle/ultisnips
git clone git://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets

# YCM
yum install -y python-devel
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
mkdir -p ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
cp -f libclang-9.0.0-x86_64-unknown-linux-gnu.tar.bz2 ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer

# airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# autoclose
git clone https://github.com/Townk/vim-autoclose.git  ~/.vim/bundle/vim-autoclose

# fugitive
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# vimrc
cp  -f .vimrc ~/




