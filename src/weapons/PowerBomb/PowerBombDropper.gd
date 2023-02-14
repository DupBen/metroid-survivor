class_name PowerBombDropper
extends Node2D


@onready var bomb: PackedScene = preload("res://src/weapons/PowerBomb/PowerBomb.tscn")
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	var bombToDrop = bomb.instantiate()
	var samus = get_parent()
	if not samus:
		return
#		drop in area around samus?
	bombToDrop.global_position = samus.global_position
	get_tree().get_root().add_child(bombToDrop)
