# res://scripts/VirtualKey.gd
extends Button

@export var key_code: int = KEY_W

func _ready():
	print("按键创建: ", text, " 键码: ", key_code)

func _on_pressed():
	Kcall.send_key(key_code,true)
	print("按下: ", text, " (", key_code, ")")

func _on_button_up():
	Kcall.send_key(key_code,false)	
	print("释放: ", text)
