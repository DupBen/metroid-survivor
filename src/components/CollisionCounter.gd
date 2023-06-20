@tool
extends Node2D

signal max_collisions_reached

@export var hitbox : Hitbox
@export var max_collisions := 1

@export_flags_2d_physics var collision_mask

func _ready():
	if hitbox is Hitbox:
		hitbox.area_entered.connect(_on_hitbox_area_entered)
		hitbox.collision_mask += collision_mask


func _get_configuration_warnings():
	var warnings := PackedStringArray([])
	if not hitbox is Hitbox:
		warnings.append("%s requires a Hitbox to check for collisions. Please add one in the inspector." % name)
	return warnings


func _on_hitbox_area_entered(hurtbox: Hurtbox) -> void:
	if not hurtbox:
		return
	max_collisions -= 1
	if max_collisions <= 0: 
		emit_signal("max_collisions_reached")
