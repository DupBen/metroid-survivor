class_name Bomb
extends Area2D

@onready var collision := $HitBox/CollisionShape2D

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	collision.set_deferred("disabled", false)
	await get_tree().create_timer(.5).timeout
	queue_free()
