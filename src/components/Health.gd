class_name Health
extends Node2D


signal died

@export var health : int


func _process(delta: float) -> void:
	if health <= 0:
		emit_signal("died")


func damage(amount: int) -> void:
	health -= amount
