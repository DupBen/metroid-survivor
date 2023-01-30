class_name Bomb
extends Area2D

@onready var collision := $HitBox/CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio_stream_player.play()


func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	animated_sprite_2d.play("countdown")
	await get_tree().create_timer(.25).timeout
	collision.set_deferred("disabled", false)
	animated_sprite_2d.play("detonate")
	var audio_file = load("res://src/assets/sounds/sfx/bomb_explode.wav")
	audio_stream_player.stream = audio_file
	audio_stream_player.play()
	await get_tree().create_timer(.5).timeout
	queue_free()
