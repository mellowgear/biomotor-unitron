; PartOffsetsBody (part_offsets_body): 1 records of 32 bytes, one line per id; keep the order and count.
; [code] Where the body image is drawn on the 0x60 x 0x58 robot canvas: x<n> y<n> = signed
; pixel offset for body image n (DrawBodyPart 0x207D9D reads column wDrawBody; one row for all
; bodies). Column 0 is never read (DrawRobotPart treats body 0 as 1).
; DrawRobotPart 0x207E21: offset = table + (image - 1) * 32 + body * 2 -> DrawPartImage.
; id: x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15
	db	0,0,32,16,32,16,32,8,40,8,32,16,32,16,24,8,32,8,32,8,32,8,32,8,24,8,40,8,40,8,32,0	; 1
