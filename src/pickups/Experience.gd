class_name Experience
extends Area2D


@export var exp = 1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var audio = $AudioStreamPlayer

var _target = null:
	get = get_target, set = set_target 
var speed = -1


func _physics_process(delta: float) -> void:
	if not _target:
		return

	global_position = global_position.move_toward(_target.global_position, speed)
	speed += 4 * delta
	
	
func collect() -> int:
	sprite.texture = null
	audio.play()
	collision.set_deferred("disabled", true)
	return exp


func _on_audio_stream_player_finished() -> void:
	queue_free()


func set_target(target) -> void:
	_target = target
	
	
func get_target() -> Node:
	return _target
