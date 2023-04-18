class_name BombDropper
extends Node2D


@onready var bomb: PackedScene = preload("res://src/weapons/Bomb/Bomb.tscn")
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	var bombToDrop = bomb.instantiate()
	bombToDrop.global_position = Globals.Player.global_position
	get_tree().get_root().add_child(bombToDrop)
