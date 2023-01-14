extends Node2D

@onready var beam = preload("res://src/weapons/Beam.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var bullet = beam.instantiate()
	var samus = get_parent() as Samus
	if not samus:
		return
	print("owner pos", samus.global_position)
	print("owner pos", samus.face_direction)
	bullet.global_position = samus.global_position
	bullet.direction = samus.face_direction
	owner.add_child(bullet)
	
