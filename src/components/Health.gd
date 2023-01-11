class_name Health
extends Node2D


@export var health : int


func _ready():
	pass


func damage(amount: int) -> void:
	health -= amount
	print("Health ", health)
