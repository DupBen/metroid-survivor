class_name Health
extends Node2D


signal died
signal player_health(health)

@export var health : int


func damage(amount: int) -> void:
	print('taking damage')
	health -= amount

	if health <= 0:
		emit_signal("died")
