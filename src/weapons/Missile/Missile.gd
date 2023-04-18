class_name Missile
extends Area2D

var max_speed := 250
var current_speed := 0
var torque := 5
var direction: Vector2
var velocity := Vector2.ZERO
var target
var target_aquired = false
@onready var ready_to_home = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SMOOTH_SPEED = 5.0

func _ready() -> void:
    if target:
        target_aquired = true



func _physics_process(delta) -> void:
    _handle_initial_direction()
    _handle_throttle()

    if (target_aquired and not target):
        queue_free()
    if ready_to_home:
        if not target:
            _handle_no_target(delta)
            return
        # Ease the rotation towards the target
        rotation = lerp_angle(rotation, (target.global_position - global_position).normalized().angle(), delta * SMOOTH_SPEED)
        # Move towards target
        position = position.move_toward(target.global_position, current_speed * delta)

        translate(velocity)
    else:
        _initial_burst(delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()


func _on_collision_counter_max_collisions_reached() -> void:
    print('Collisions max')
    queue_free()


func _handle_initial_direction() -> void:
    if direction.x < 0:
        sprite.set_rotation_degrees(270)
    if direction.y < 0:
        sprite.set_rotation_degrees(180)
    if direction.y > 0:
        sprite.set_rotation_degrees(0)


func _handle_throttle() -> void:
    if current_speed < max_speed:
        current_speed += torque


func _handle_no_target(delta) -> void:
    velocity.x = direction.x * current_speed * delta
    velocity.y = direction.y * current_speed * delta
    translate(velocity)


func _on_timer_timeout() -> void:
    ready_to_home = true


func _initial_burst(delta):
    var tween = get_tree().create_tween()
    tween.tween_property(self, "global_position:x", global_position.x + 16, 0.25).set_ease(Tween.EASE_OUT)

