class_name BombDropper
extends Node2D

@onready var bomb = preload("res://src/weapons/Bomb/Bomb.tscn")
@onready var timer = $Timer


func _on_timer_timeout() -> void:
	var bombToDrop = bomb.instantiate()
	var samus = get_parent()
	if not samus:
		return
	bombToDrop.global_position = samus.global_position
	get_tree().get_root().add_child(bombToDrop)
