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

define mmap
    info proc mappings
end
document mmap
proc mappings
end

