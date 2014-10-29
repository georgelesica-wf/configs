# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="intheloop"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



### Tom’s Stuff 
export EDITOR='vim'
unsetopt share_history

# Allow up/down arrow in  CTRL-R  (Same as CTRL-R/S)
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward


# virtualenvwrapper
# Don't let Mac  python (in /usr/bin) supercede brew's python (/usr/local/bin)
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

# Sets the working directory for all virtualenvs
export WORKON_HOME=$HOME/.virtualenvs

# Set the java location (http://stackoverflow.com/questions/1348842/what-should-i-set-java-home-to-on-osx)
export JAVA_HOME=$(/usr/libexec/java_home)

# Sources the virtualenvwrapper so all the commands are available in the shell
source /usr/local/bin/virtualenvwrapper.sh

export MAVEN_OPTS="-Xmx4096m -Xss1024m -XX:MaxPermSize=128m"
export ANT_OPTS="-Xmx4096m -Xss1024m"

# Workspace shortcuts
alias bigsky="cd ~/Workspace/bigsky"
alias bs="bigsky"
alias reference-viewer="cd ~/Workspace/wf-js-reference-viewer"
alias common="cd ~/Workspace/wf-common"
alias uicomponents="cd ~/Workspace/wf-uicomponents"
alias viewer="cd ~/Workspace/wf-js-viewer"
alias annotations="cd ~/Workspace/wf-js-annotations"
alias docviewer="cd ~/Workspace/wf-js-document-viewer"
alias viewer-services="cd ~/Workspace/wf-viewer-services"
alias server_composition='cd ~/Workspace/server_composition'
alias server-composition='cd ~/Workspace/server_composition'
alias wDOM='cd ~/Workspace/wDOM'
# End workspace shortcuts

# Bower shortcuts
alias blann="bower link wf-js-annotations"
alias bluic="bower link ui-components"
alias blvw="bower link wf-js-viewer"
alias blcom="bower link wf-common"
alias bldom='bower link wDOM'
alias blall="blann && bluic && blvw && blcom && bldom"
# End Bower shortcuts

# Environment/Compile shortcuts
alias bigsky-server-verbose="which bigsky-server-verbose && workon sky; (python manage.py runserver 0.0.0.0:8001 2>&1)"
alias bigsky-server="which bigsky-server && workon sky; (python manage.py runserver 0.0.0.0:8001 2>&1) | tee /tmp/bigsky.log | grep -v DEBUG | grep -v INFO"
alias bss='bigsky-server'

## https://github.com/Workiva/bigsky/blob/master/auth/models.py#L736
alias reset-environment="which reset-environment && bsmyaccount && python tools/erase_reset_data.py --admin='george' --password='blerg'"
alias reset-admin="which reset-admin && python tools/remote_api/create_test_docs.py --nodocuments --admin='george' --password='blerg' --servername=localhost:8001"
alias reset-environment-with-features="reset-environment --enabled_settings=enable_presentations,enable_doc_viewer,enable_charts,enable_two_column,enable_risk,enable_csr,enable_books_viewer_comments,enable_books_viewer_shared_comments,enable_table_bullets"


alias bigsky-update="which bigsky-update && bigsky && git pull && git submodule update --init && workon sky && pip install -Ur requirements_dev.txt && ./tools/link_assets.py sky.docviewer assets"
alias bsup='bigsky-update'

alias bigsky-annotation-services-local-pip='which bigsky-annotation-services-local-pip && workon sky && { pip uninstall -y wf-annotation-services; pip install -e ../wf-annotation-services; } && ant link-libs'
alias aslpip='bigsky-annotation-services-local-pip'
alias bigsky-annotation-services-stock-pip='which bigsky-annotation-services-stock-pip && workon sky && { pip uninstall -y wf-annotation-services; pip install wf-annotation-services; } && ant link-libs'
alias asspip='bigsky-annotation-services-stock-pip'

alias bigsky-viewer-services-local-pip='which bigsky-viewer-services-local-pip && workon sky && { pip uninstall -y wf-viewer-services; pip install -e ../wf-viewer-services; } && ant link-libs'
alias vslpip='bigsky-viewer-services-local-pip'
alias bigsky-viewer-services-stock-pip='which bigsky-viewer-services-stock-pip && workon sky && { pip uninstall -y wf-viewer-services; pip install wf-viewer-services; } && ant link-libs'
alias vsspip='bigsky-viewer-services-stock-pip'

alias bigsky-server-composition-local-pip='which bigsky-server-composition-local-pip && workon sky && { pip uninstall -y server-composition; pip install -e ../server-composition; } && ant link-libs'
alias sclpip='bigsky-server-composition-local-pip'
alias bigsky-server-composition-stock-pip='which bigsky-server-composition-stock-pip && workon sky && { pip uninstall -y server-composition; pip install server-composition; } && ant link-libs'
alias scspip='bigsky-server-composition-stock-pip'

##The below needs genericified in link_assets.py --2014-07-16
alias bigsky-get-deps="bigsky && pip install -Ur requirements_dev.txt && ant link-libs && ./tools/link_assets.py sky.docviewer assets"

alias pfz='pip freeze'

#CLI shortcuts
alias zshrc='sublime ~/.zshrc'
alias zshrc-source='. ~/.zshrc'

alias bsmyaccount="echo George,Lesica,george,blerg,,Workiva,george.lesica@workiva.com,666-666-6667,555-555-5556,444-444-4445,333-333-3334,2131 North Loop Drive,,,Ames,IA,50011 > ~/Workspace/bigsky/tools/bulkdata/accounts.csv"
### End personal stuff



### Stock Aliases
# Alias all the repos - These minimize the typing you need to do to get to your dev enivronments
alias ws='cd ~/Workspace'
alias dv='cd ~/Workspace/wf-js-document-viewer'
alias docviewer='cd ~/Workspace/wf-js-document-viewer'
alias devtools='cd ~/Workspace/dev-tools'
alias bs='cd ~/Workspace/bigsky'
alias ss='cd ~/Workspace/smallsky'
alias ssc='cd ~/Workspace/server_composition'
alias smallsky='ss'
alias ui='cd ~/Workspace/wf-uicomponents'
alias anno='cd ~/Workspace/wf-js-annotations'
alias bsrv='cd ~/Workspace/bigsky/apps/rv'
alias books='cd ~/Workspace/books'
alias rv='cd ~/Workspace/wf-js-reference-viewer'
alias vw='cd ~/Workspace/wf-js-viewer'
alias viewer='cd ~/Workspace/wf-js-viewer'
alias common='cd ~/Workspace/wf-common'
alias vs='cd ~/Workspace/wf-viewer-services'
alias viewers='vs'
alias annos='cd ~/Workspace/wf-annotation-services'
alias paw='cd ~/Workspace/wf-js-paw'
alias pitcher='cd ~/Workspace/wf-pitcher'
alias catcher='cd ~/Workspace/wf-catcher'

## Misc
alias bower='noglob bower' # Prevent the shell from expanding things like * for bower commands
alias reload=". ~/.zshrc" # If you change your zshrc, run this to make the changes apply to your current shell.
alias loc='find . -name $1 2>/dev/null'  # Use like find, but filter out that pesky STDERR.

## Bigsky helpers
alias bstestvs='workon sky && ./manage.py test apps.viewer'
alias bsvspip='workon sky && { pip uninstall -y wf-viewer-services; pip install -e ../wf-viewer-services; } && ant link-libs' # Links your local copy of viewer-services into BigSky
alias bssscpip='workon sky && { pip uninstall -y server-composition; pip install -e ../server_composition; } && ant link-libs' # Links your local copy of server_composition into BigSky
alias bslinkdocviewerassets='workon sky && ./tools/link_assets.py sky.docviewer assets' # Sets up the doc viewer dependencies inside of BigSky
alias bsdocviewerpip='workon sky && pip uninstall -y sky-docviewer; pip install -e ../wf-js-document-viewer; } && ant link-libs && bslinkdocviewerassets' # Links your local copy of doc viewer into BigSky
alias bslinkbooksassets='workon sky && ./tools/link_assets.py wf.apps.books assets' # Sets up books dependencies inside of BigSky
alias bsbookspip='workon sky && { pip uninstall -y wf-books; pip install -e ../books; } && ant link-libs && bslinkbooksassets'  # links your local copy of books into BigSky
# https://wiki.webfilings.com/display/DEV/How+to+Upload+and+Enable+Fonts
alias bsfonts='workon sky && python tools/remote_api/upload_font.py ../font/fonts/general --wf-enable; bell'
alias killvenv="rm -rf $WORKON_HOME/sky && bs && mkvirtualenv sky -a /Users/tomconnell/Workspace/bigsky"

alias sky="workon sky"
alias skyup="workon sky && git checkout master && git pull && git pull wf-origin master && git submodule update --init && pip install -Ur requirements_dev.txt" # Updates bigsky and all the dev requirements.  Production would just use requrements.txt.

alias bsunpip='workon sky && pip uninstall -y server-composition wf-viewer-services sky-docviewer wf-books' # Remove all locally linked environments from BigSky
alias pipr='pip install -Ur requirements_dev.txt || pip install -r requirements.txt' # Install all python requirements for BigSky

alias repip='bs && workon sky && pip install -Ur requirements_dev.txt'
alias loadbsfonts='bs && workon sky && python tools/remote_api/upload_font.py ../font/fonts/general && python tools/remote_api/upload_font.py ../font/fonts/restricted --wf-enable'

alias bsdoc='bs && workon sky && python tools/Doctor/bin/doctor.py' # I don't know what this does

# Docviewer
#ant link-doc-viewer # do every time doc viewer branch changes


## Bower and npm aliases
alias lsbowerlinks='ls -al ~/.local/share/bower/links'
alias cdbowerlinks='cd ~/.local/share/bower/links'

# Link local packages into the pwd.  So, if you were in  ~/workspace/wf-js-viewer, the package would be linked in bower_components/
alias bowerlinkall="bower link wf-js-viewer && bower link wf-js-annotations && bower link wf-common && bower link wf-js-reference-viewer && bower link wf-uicomponents && bower link wf-js-paw && ls -l bower_components"
alias bowerlinkcore="bower link wf-js-annotations && bower link wf-common && bower link wf-uicomponents && bower link wf-js-viewer"
alias blrv="bower link wf-js-reference-viewer"
alias blvw="bower link wf-js-viewer"
alias blui="bower link wf-uicomponents"
alias blpaw="bower link wf-js-paw"
alias blcommon="bower link wf-common"
alias blanno="bower link wf-js-annotations"

alias init="rm -rf bower_components node_modules; npm install && bower install" # Reset your pwd's npm and bower modules, without blowing away working directory changes, like ./init.sh
alias lsbc="ls bower_components"
alias llbc="ll bower_components"
alias lsbcr='ls `find . -name bower_components | xargs`' # recursive, useful in bigsky
alias llbcr='ll `find . -name bower_components | xargs`' # recursive, useful in bigsky
alias rebower='rm -rf bower_components/$* && bower install'
alias renpm='rm -rf node_modules/$* && npm install'

## Git shortcuts
# http://superuser.com/questions/44787/looping-through-subdirectories-and-running-a-command-in-each
alias glwf='for dir in wf-*; do (echo "> inside $dir" && cd "$dir" && git status && git pull); done' # Git pulls all of pwd's wf-* directories.
alias glwfmaster='for dir in wf-*; do (echo "> inside $dir" && cd "$dir" && git status && git checkout master && git pull); done' # Git pulls all of pwds wf-* directories after checking out master.
alias gsu='git submodule update --init'
alias glom='git pull origin master'
alias loadfonts="workon bigsky && bigsky && python tools/remote_api/upload_font.py ../font/fonts/general"
alias lasttag="git describe --tags --abbrev=0"

## Setup HVR



## Bigsky helpers
alias bstestappsviewer='workon sky && ./manage.py test apps.viewer'
alias bstestviewerservices='workon sky && vs && ../bigsky/manage.py test viewer_services'
alias bstestannotationservices='workon sky && annos && ../bigsky/manage.py test annotation_services'

function bsrepip() {
  pipName=${1?"First arg needs to be the pip name of the lib"}
  # if none supplied, default to $1
  folderName=${2:-$pipName}
  workon sky && {
    set -x;
    pip uninstall -y $pipName;
    pip install -e "../$folderName";
  } &&
  ant link-libs
  set +x
}

alias bspipviewerservices='bsrepip wf-viewer-services'
alias bspipannotationservices='bsrepip wf-annotation-services'
alias bspipssc='bsrepip server-composition server_composition'

alias bslinkdocviewerassets='workon sky && ./tools/link_assets.py sky.docviewer assets'
alias bspipdocviewer='bsrepip sky-docviewer wf-js-document-viewer && bslinkdocviewerassets'

alias bspipbooks='bsrepip wf-books books && bslinkbooksassets'



### End Stock Aliases

# Bigsky
alias bs='cd ~/Workspace/bigsky && workon sky'
alias bsant='bs &&
    SUPPORTPATH=/Users/patkujawa/workspace/support && \
    PYEXECPATH=`which python2.7` && \
    cp build-user.properties.mac build-user.properties && \
    sed -E -i .bak -e "s%SUPPORT=(.+)%SUPPORT=$SUPPORTPATH%" build-user.properties && \
    sed -E -i "" -e "s%python.executable=(.+)%python.executable=$PYEXECPATH%" build-user.properties && \
    cp settingslocal.py.dev settingslocal.py && \
    time ant full'
alias bsrun='bs && ./manage.py runserver 0.0.0.0:8001'
alias bsaccount='echo George,Lesica,george,blerg,,Workiva,george.lesica@workiva.com,666-666-6667,555-555-5556,444-444-4445,333-333-3334,2131 North Loop Drive,,,Ames,IA,50011 > ~/Workspace/bigsky/tools/bulkdata/accounts.csv'
alias bsreset='bs && bsaccount && mkdir -p datastore && chmod og+w datastore && python tools/erase_reset_data.py --admin="george" --password="blerg"'
alias bsfonts='bs && python tools/remote_api/upload_font.py ../font/fonts/general && python tools/remote_api/upload_font.py ../font/fonts/restricted --wf-enable'

# HVR
alias books='cd ~/Workspace/books && workon books'
alias bslinkdocviewerassets='bs && ./tools/link_assets.py sky.docviewer assets'
alias bsdocviewerpip='bs && \
    { pip uninstall -y sky-docviewer; pip install -e ../wf-js-document-viewer; } && \
        ./tools/link_assets.py sky.docviewer assets'
alias bsdocviewerinstall='bslinkdocviewerassets && bsdocviewerpip'

# Binders
alias bslinkbooksassets='bs && ./tools/link_assets.py wf.apps.books assets'
alias bsbookspip='bs && \
    { pip uninstall -y wf-books; pip install -e ../books; } && \
        ./tools/link_assets.py wf.apps.books assets'
alias bsbooksinstall='bslinkbooksassets && bsbookspip'
