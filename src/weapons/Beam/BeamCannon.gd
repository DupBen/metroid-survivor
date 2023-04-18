class_name BeamCannon
extends Node2D

@export var fire_rate := 0.75

@onready var beam = preload("res://src/weapons/Beam/Beam.tscn")
@onready var timer = $Timer
@onready var samus = Globals.Samus

func _ready() -> void:
	timer.wait_time = fire_rate
	timer.start()


func _physics_process(delta: float) -> void:
	if samus.has_node("TeRt") or true:
		print('here')
		timer.wait_time = fire_rate * .5


func _on_timer_timeout() -> void:
	var bullet = beam.instantiate()
	if not samus:
		return
	bullet.direction = samus.face_direction
	bullet.global_position = samus.global_position
	get_tree().get_root().add_child(bullet)
