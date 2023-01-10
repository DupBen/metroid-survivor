class_name HurtBox
extends Area2D
signal damage(amount)

@onready var collison := $CollisionShape2D
@onready var timer := $IFramesTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(hitbox:HitBox):
	print('Hurt box entered')
	collison.call_deferred('set', 'disabled', true)
	timer.start()
	emit_signal("damage", hitbox.damage)


func _on_i_frames_timer_timeout():
	collison.call_deferred('set', 'disabled', false)