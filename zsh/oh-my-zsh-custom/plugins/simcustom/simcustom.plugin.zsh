# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.
#
# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  #rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
  rg --files-with-matches --no-messages "$1" | fzf --preview "bat --style=numbers --color=always --line-range :500 --language=java {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 500 '$1' || rg --ignore-case --pretty --context 500 '$1' {}"
}

fifs0() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg -S --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

ff() {
  grep -Ri "$1" | fzf 
}

ffp() {
  grep -Ri -A $2 -B $2 "$1" | fzf
}


# Example usage:
# search_code "getJobs"
# search_code "getJobs" "test"

fifs() {
  if [ -z "$1" ]; then
    echo "Search term is mandatory."
    return 1
  fi

  search_term="$1"
  exclude_pattern=""

  if [ -n "$2" ]; then
    exclude_pattern="| grep -Ev $2 "
  fi

  rg -S --files-with-matches --no-messages "$search_term" | fzf --preview "bat --paging=always --pager='less -RS' --style=numbers --color=always --line-range :500 --language=java {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 500 '$search_term' || rg --ignore-case --pretty --context 500 '$search_term' {}"
}


