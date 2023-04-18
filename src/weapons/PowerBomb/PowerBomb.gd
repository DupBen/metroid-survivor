class_name PowerBomb
extends Area2D

@onready var collision := $HitBox/CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio_stream_player.play()


func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	collision.set_deferred("disabled", false)
	animated_sprite_2d.play("detonate")
	var audio_file = load("res://src/assets/sounds/sfx/ammo_powerbomb_shot.wav")
	audio_stream_player.stream = audio_file
	audio_stream_player.play()
	await get_tree().create_timer(3).timeout
	queue_free()
