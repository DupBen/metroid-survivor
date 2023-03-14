class_name Missile
extends Area2D

var max_speed := 500
var current_speed := 0
var torque := 5
var direction: Vector2
var velocity := Vector2.ZERO
var target
var target_aquired = false
var target_locked = false

@onready var ready_to_home = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var _aim_line := $AimLine
@onready var _target_line := $TargetLine
@onready var _change_line := $ChangeLine

var SMOOTH_SPEED = 7.0



func _ready() -> void:
    set_as_top_level(true)
    _aim_line.set_as_top_level(true)
    _target_line.set_as_top_level(true)
    _change_line.set_as_top_level(true)
    _aim_line.visible = true
    _target_line.visible = true
    _change_line.visible = true
    
    if target:
        target_aquired = true



func _physics_process(delta) -> void:
    _handle_initial_direction()
    _handle_throttle()
    
  
    if (target_aquired and not target):
        queue_free()
    if ready_to_home:
        print("ready to HOME!")
        if not target:
            print("NO TARGET!")
            _handle_no_target(delta)
            return

        var to_rotation = global_position.angle_to_point(target.global_position)
        print('to rotation', to_rotation)
        rotation = lerp_angle(rotation, to_rotation, delta * SMOOTH_SPEED)
        position = position.move_toward(target.global_position, current_speed * delta)
        target.modulate = Color(0,1,0)

        # Debug Lines
        _aim_line.set_point_position(0, global_position)
        _aim_line.set_point_position(1, global_position)
        _target_line.set_point_position(0, global_position)
        _target_line.set_point_position(1, target.global_position)

        translate(velocity)
    else:
        _initial_burst(delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()


func _on_collision_counter_max_collisions_reached() -> void:
    queue_free()


func _handle_initial_direction() -> void:
    if direction.x < 0:
        set_rotation_degrees(180)
    if direction.y < 0:
        set_rotation_degrees(180)
    if direction.y > 0:
        set_rotation_degrees(0)
    pass


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
    tween.tween_property(self, "global_position:x", global_position.x + (16 * direction.x), 0.25).set_ease(Tween.EASE_OUT)

