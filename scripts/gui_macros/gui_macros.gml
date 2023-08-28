#macro GUI_MARGIN  (4)
#macro GUI_PADDING (4)

#macro GUI_BG_SPRITE (spr_gui_background)
#macro GUI_BG_BORDER (sprite_get_nineslice(GUI_BG_SPRITE).left)

#macro GUI_X1       (0 + GUI_MARGIN)
#macro GUI_X2       (gui_width() - GUI_MARGIN)
#macro GUI_MIDDLE_X (gui_width() / 2)
#macro GUI_WIDTH    (gui_width())

#macro GUI_Y1       (0 + GUI_MARGIN) 
#macro GUI_Y2       (gui_height() - GUI_MARGIN)
#macro GUI_MIDDLE_Y (gui_height() / 2)
#macro GUI_HEIGHT   (gui_height())
