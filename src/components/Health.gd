class_name Health
extends Node2D


signal died

@export var health : int


func damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		emit_signal("died")
