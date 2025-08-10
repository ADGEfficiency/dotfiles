function search -d "Search files with fzf and open in editor"
    set term_height (tput lines)
    set min_height 20
    
    if test "$term_height" -ge "$min_height"
        set files (fzf --preview 'bat --style=numbers --color=always {}' --height 60% -m)
    else
        set files (fzf --no-preview --height 40% -m)
    end
    
    if test $status -eq 0; and test -n "$files"
        eval "$EDITOR" $files
    end
end