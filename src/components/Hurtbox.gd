@tool
class_name Hurtbox
extends Area2D
signal damage(amount)

@export var health : Health
@onready var collison : CollisionShape2D = $CollisionShape2D
@onready var timer : Timer = $IFramesTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
	
	
func _get_configuration_warnings():
	var warnings := PackedStringArray([])
	if not health:
		warnings.append("%s requires a Health component to which to apply damage. Please add one in the inspector." % name)
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

