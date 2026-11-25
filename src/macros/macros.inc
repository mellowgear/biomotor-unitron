; Macros, in Toshiba's macro preprocessor syntax (?macro ... ?endm; unitron asm expands them).
; Each expands to exactly the original bytes.

; task_wait: make the next line this task's resume point (task +8), then return to the
; scheduler if the task is still waiting (task +0xC != 0, e.g. a message is printing).
; RunTasks (0x206286) calls each task's +8 function; XIZ = the running task.
; Expands to "R: ld XWA,R / ld (XIZ+8),XWA / cpb (XIZ+0xC),0 / ret NZ", R = this resume point.
?macro task_wait
labels resume
?resume:
	ld	XWA,?resume
	ld	(XIZ+8),XWA
	cpb	(XIZ+0xC),0
	ret	NZ
?endm
