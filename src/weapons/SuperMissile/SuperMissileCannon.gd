class_name SuperMissileCannon
extends Node2D

@export var fire_rate := 3.5

@onready var beam = preload("res://src/weapons/SuperMissile/SuperMissile.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = fire_rate
	timer.start()
	

func _on_timer_timeout() -> void:
	var missile = beam.instantiate()
	var samus = get_parent()
	if not samus:
		return
	missile.direction = samus.face_direction
	missile.global_position = samus.global_position
	get_tree().get_root().add_child(missile)
