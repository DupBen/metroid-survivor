extends Area2D


signal max_collisions_reached

@export var max_collisions := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	max_collisions -= 1
	if max_collisions <= 0: 
		emit_signal("max_collisions_reached")
