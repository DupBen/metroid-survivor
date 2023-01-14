extends Area2D

const SPEED := 250
var direction: Vector2

var velocity := Vector2.ZERO
var beam_distance := 0.15
var long_beam_distance := 0.5

@onready var timer := $Timer


func _ready() -> void:
	#rotation = direction.angle()
	#Globals.GameSFX.play(Globals.sfx['beam'])
	pass


func _physics_process(delta) -> void:
	velocity.x = direction.x * SPEED * delta
	velocity.y = direction.y * SPEED * delta
	translate(velocity)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_collision_counter_max_collisions_reached() -> void:
	queue_free()
