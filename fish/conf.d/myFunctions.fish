
function rcpy;
    set counter 0
    for x in (fdfind -i -I -t f $argv[1])
    	set counter (math $counter + 1)
        cp $x $argv[2]
    end
    echo "Copied $counter files"
end


function fuzzyVim;
    set path (fd -H -t f | fzf --preview 'bat --color=always {}' --reverse )
    if not test "$path" = ""
    	nvim $path
    end
end


function openDir;
    set path (fdfind -t d "" $HOME | fzf --reverse)
    if not test "$path" = ""
       cd $path;
       clear;
       ls;
    end
  commandline -f repaint
end

function killProcess;
    set proc (ps -e | rg " " | fzf --reverse | string split -n ' ')
    if not test "$proc[1]" = "PID"
       kill (echo $proc[1])
       echo $proc[4] killed
    end
end

function searchWord;
   set word (rg '' | fzf -e --reverse)
   echo $word
   commandline -f repaint
end

function open_async;
    open $argv[1] &
end
