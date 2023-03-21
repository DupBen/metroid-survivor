class_name IceBeamCannon
extends Node2D

@export var fire_rate := 0.75

@onready var beam = preload("res://src/weapons/IceBeam/IceBeam.tscn")
@onready var timer = $Timer

func _ready() -> void:
    timer.wait_time = fire_rate
    timer.start()
    

func _on_timer_timeout() -> void:
    var bullet = beam.instantiate()
    var samus = get_parent()
    if not samus:
        return
    bullet.direction = samus.face_direction
    bullet.global_position = samus.global_position
    get_tree().get_root().add_child(bullet)
