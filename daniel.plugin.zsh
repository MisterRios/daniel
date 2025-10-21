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
    nvim -p $(ag -l "$1")
  else
    echo "Please enter a search term"
  fi
}

function agvg() {
  if [[ "$1" ]]; then
    nvim -p $(ag -l "$1" .github)
  else
    echo "Please enter a search term"
  fi
}

function agvb() {
  nvim -p $(ag -l "breakpoint")
}

function agvp() {
  if [[ "$1" ]]; then
    nvim -p $(ag -G '.*\.py' -l "$1")
  else
    echo "Please enter a search term"
  fi
}

function agvpp() {
  if [[ "$1" ]]; then
    nvim -p $(ag -G '.*\.py' --ignore-dir=tests -l "$1")
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

function agct() {
  if [[ "$1" ]]; then
    ag -w -G '.*\.py' "class $1" tests
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

function agproj() {
  if [[ "$1" ]]; then
    cdproject;echo "searching project for $1";ag "$1";cd -
  else
    echo "Please enter a search term"
  fi
}


# vim opening for files found with fd using a path
function fdpv() {
  if [[ "$1" ]]; then
    nvim -p $(fd -p "$1")
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

function vfz() {
  term=$(find . -type f | fzf)
  if [[ "$term" ]]; then
    nvim $term
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

# To allow greeting plugin to work on mac
function shuf() {
  awk 'BEGIN {srand(); OFMT="%.17f"} {print rand(), $0}' "$@" |
               sort -k1,1n | cut -d ' ' -f2-;
  }
