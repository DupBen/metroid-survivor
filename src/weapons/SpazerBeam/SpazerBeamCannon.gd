class_name PhaserBeamCannon
extends Node2D

@export var fire_rate := 0.75

@onready var beam = preload("res://src/weapons/SpazerBeam/SpazerBeam.tscn")
@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = fire_rate
	timer.start()
	

func _on_timer_timeout() -> void:
	var bullet = beam.instantiate()
	bullet.direction = Globals.Player.face_direction
	bullet.global_position = Globals.Player.global_position
	get_tree().get_root().add_child(bullet)
