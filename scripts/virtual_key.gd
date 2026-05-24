# res://scripts/VirtualKey.gd
extends Button

@export var key_code: int = KEY_W

func _ready():
	# 设置基本样式
	#custom_minimum_size = Vector2(60, 60)
	#
	print("按键创建: ", text, " 键码: ", key_code)

func _on_pressed():
	# 按下时发送按键事件
	var ev = InputEventKey.new()
	ev.keycode = key_code
	ev.pressed = true
	ev.echo = false
	Input.parse_input_event(ev)
	print("按下: ", text, " (", key_code, ")")

func _on_button_up():
	# 释放时发送按键事件
	var ev = InputEventKey.new()
	ev.keycode = key_code
	ev.pressed = false
	ev.echo = false
	Input.parse_input_event(ev)
	
	print("释放: ", text)
