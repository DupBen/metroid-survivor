class_name Zoomer
extends CharacterBody2D


@export var speed := 10.0

@onready var player := get_tree().get_first_node_in_group('player')


func  _physics_process(_delta: float) -> void:
	var direction := global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()


func _on_health_died() -> void:
	var exp = preload("res://src/pickups/Experience.tscn").instantiate()
	exp.global_position = position
	get_tree().get_root().add_child(exp)
	queue_free()
