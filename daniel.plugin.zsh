function glogs() {
  if [[ "$1" ]]; then
    git log --color=always --all --grep="$1"
  else
    echo "Please enter a search term"
  fi
}

function glh() {
    local line_range=$1
    local file_name=$2

    if [[ "$line_range" =~ ^[0-9]+-[0-9]+ ]]; then
      if [[ "$file_name" ]]; then
        local first=$(echo $line_range | cut -f1 -d-)
        local last=$(echo $line_range | cut -f2 -d-)
        git log -u -L$first,$last:$file_name
      else
        echo "Please enter a valid file name"
      fi
    elif [[ "$line_range" =~ ^[0-9]+ ]]; then
        echo "Please enter a dash-separated line range"
    else
      echo "Please enter a valid line range first"
    fi
}

function agv() {
  if [[ "$1" ]]; then
    vim -p $(ag -l "$1")
  else
    echo "Please enter a search term"
  fi
}

function agvg() {
  if [[ "$1" ]]; then
    vim -p $(ag -l "$1" .github)
  else
    echo "Please enter a search term"
  fi
}

function agvb() {
  vim -p $(ag -l "breakpoint")
}

function agvp() {
  if [[ "$1" ]]; then
    vim -p $(ag -G '.*\.py' -l "$1")
  else
    echo "Please enter a search term"
  fi
}

function agvpp() {
  if [[ "$1" ]]; then
    vim -p $(ag -G '.*\.py' --ignore-dir=tests -l "$1")
  else
    echo "Please enter a search term"
  fi
}

function agc() {
  if [[ "$1" ]]; then
    ag -w -G '.*\.py' --ignore-dir=tests "class $1"
  else
    echo "Please enter a search term"
  fi
}

function agd() {
  if [[ "$1" ]]; then
    ag -w -G '.*\.py' --ignore-dir=tests "def $1"
  else
    echo "Please enter a search term"
  fi
}

function gpto() {
    local branch=$(git symbolic-ref --short HEAD)
    git push --set-upstream origin $branch
}

alias gepetto="gpto"

function shell_plus() {
    if [ -f ./manage.py ]; then
        ./manage.py 'shell_plus'
    else
        ..; ./manage.py shell_plus
    fi
}

function gcos () {
  if [[ "$1" ]]; then
      local branch=$(git branch | grep "$1" | tail -1 | xargs)
      git checkout $branch
  else
      echo "no branch found"
  fi
}

function vfuz() {
  term=$(find . -type f | fzy)
  if [[ "$term" ]]; then
    vim $term
  else
    echo "Please enter a search term"
  fi
}


function vpnend() {
  for line in $(openvpn3 sessions-list | grep -Po 'Path: \K[^ ]*')
  do
    echo "ending session:"
    echo $line
    openvpn3 session-manage  --session-path $line --disconnect
  done
}
