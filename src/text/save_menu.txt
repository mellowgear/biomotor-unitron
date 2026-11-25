; strings at 20DF5B-20DF80 (DrawSaveSlotList): the list header by wSaveMenuMode, the empty-slot line, and
; single characters read with ld L,(...): "L" after each slot's two levels, the four emblem glyphs (event flags 0x10-0x13)

SaveMenuLoadText:
    text " Load"
    done

SaveMenuSaveText:
    text " Save"
    done

SaveMenuClearText:
    text " Clear"
    done

SaveSlotEmptyText:
    text ""
    line "     ★NONE★"
    done

SaveSlotLvChar:
    text "L"

SaveSlotEmblemChars:
    text "{6E}{6D}{70}{6F}"
