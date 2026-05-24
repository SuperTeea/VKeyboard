extends Control

func _ready() -> void:
	# 获取所有按键节点的矩形并计算鼠标穿透区域
	var key_rects: Array[Rect2] = []
	var key_nodes = get_tree().get_nodes_in_group("Key")
	
	for node in key_nodes:
		if node is Control:
			key_rects.append(node.get_global_rect())
	
	if not key_rects.is_empty():
		# 合并所有按键矩形为一个区域
		var combined_rect = _combine_rects(key_rects)
		var polygon: PackedVector2Array = [
			combined_rect.position,
			Vector2(combined_rect.end.x, combined_rect.position.y),
			combined_rect.end,
			Vector2(combined_rect.position.x, combined_rect.end.y)
		]
		
		# 应用鼠标穿透：只让按键区域可点击，其他区域穿透
		DisplayServer.window_set_mouse_passthrough(polygon)

func _combine_rects(rects: Array[Rect2]) -> Rect2:
	"""合并多个矩形为一个包围盒"""
	if rects.is_empty():
		return Rect2()
	
	var result = rects[0]
	for i in range(1, rects.size()):
		result = result.merge(rects[i])
	return result
	
