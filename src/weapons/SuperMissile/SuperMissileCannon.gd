class_name SuperMissileCannon
extends Node2D

@export var fire_rate := 3.5

@onready var super_missle_scene = preload("res://src/weapons/SuperMissile/SuperMissile.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = fire_rate
	timer.start()
	

func _on_timer_timeout() -> void:
	var super_missle = super_missle_scene.instantiate()
	var samus = get_parent()

	if not samus:
		return

	super_missle.direction = samus.face_direction
	super_missle.global_position = samus.global_position
	get_tree().get_root().add_child(super_missle)
