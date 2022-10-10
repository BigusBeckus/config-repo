# Kubernetes
alias kubectl="minikube kubectl --"

# Docker
alias dps="docker ps"
alias de="docker exec"
alias dei="docker exec -i"
alias deit="docker exec -it"

# Shortcuts
alias c="code"
alias c.="code ."

# Git but weird
alias git-clear-permission-changes="git diff -p -R --no-ext-diff --no-color | grep -E \"^(diff|(old|new) mode)\" --color=never | git apply"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nxr="npx run"
alias nxd="npx run dev"

# pnpm
alias pi="pnpm install"
alias pid="pnpm install -D"
alias pd="pnpm run dev"

# yarn
alias ya="yarn add"
alias yad="yarn add -d"
alias yd="yarn dev"
alias yi="yarn install"

# Yarn (Orbit)
alias ydn="yarn down"
alias yr="yarn rebuild"
alias yc="yarn console"
alias yhc="yarn hasura:console"
alias yel="yarn express:log"
alias yhl="yarn hasura:log"
alias yal="yarn all:log"
alias ym="yarn migrate"
alias yhm="yarn hasura:migrate"
