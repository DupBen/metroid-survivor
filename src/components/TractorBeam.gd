extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("set_target"):
		area.set_target(get_parent())
