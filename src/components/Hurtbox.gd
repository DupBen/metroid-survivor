@tool
class_name Hurtbox
extends Area2D


signal damage(amount)

@export var health : Health

@onready var collison := $CollisionShape2D as CollisionShape2D
@onready var timer := $IFramesTimer as Timer


func _ready() -> void:
    pass


func _process(_delta) -> void:
    pass


func _get_configuration_warnings():
    var warnings := PackedStringArray([])
    if not health is Health:
        warnings.append("%s requires a Health component for which to apply damage. Please add one in the inspector." % name)
    return warnings


func _on_area_entered(hitbox: Hitbox) -> void:
    if not hitbox is Hitbox: 
        return
    print('Hurt box entered')
    collison.call_deferred('set', 'disabled', true)
    timer.start()
    emit_signal("damage", hitbox.damage)
    if health:
        health.damage(hitbox.damage)


func _on_i_frames_timer_timeout() -> void:
    collison.call_deferred('set', 'disabled', false)

