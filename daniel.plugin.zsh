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

function vack() {
  if [[ "$1" ]]; then
    vim -p $(ack -l "$1")
  else
    echo "Please enter a search term"
  fi
}
