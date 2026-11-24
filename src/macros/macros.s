; Macros (expanded by tlcs900/asm.py). Each expands to exactly the original bytes.

; task_wait: make the next line this task's resume point (task +8), then return to the
; scheduler if the task is still waiting (task +0xC != 0, e.g. a message is printing).
; RunTasks (0x206286) calls each task's +8 function; XIZ = the running task.
.macro task_wait
\@:
    LD        XWA,\@                             [5]
    LD        (XIZ+8),XWA                        [3]
    CPB       (XIZ+0xC),0                        [4]
    RET       NZ                                 [2]
.endm
