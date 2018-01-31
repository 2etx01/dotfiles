set disassembly-flavor intel
set pagination off
set history save on
set history filename ~/.gdb_history
set history size 32768
set history expansion on

source ~/.ctf-tools/gdb/at.py
python import sys
python sys.path.append('~/.local/lib/python3.4/site-packages/')
python from libheap import *

set prompt \001\033[1;35m\002[gdb]\> \001\033[0m\002

define vmmap
    info proc mappings
end
document vmmap
proc mappings
end

define aslr
    if $argc == 0
        show disable-randomization
    else 
        if $argc == 1
            set disable-randomization $arg0
            echo ASLR turn $arg0 \n
        end
    end
end
document aslr
end

define q
	set confirm off
	quit
end
document quit
end
