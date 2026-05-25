extends Control

func _ready() -> void:
	# 应用鼠标穿透：只让按键区域可点击，其他区域穿透
	
	DisplayServer.window_set_mouse_passthrough($SolidArea.polygon)
	pass
