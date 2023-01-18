extends Node2D


var current_exp := 0
var exp_collected := 0
var current_level := 1


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_collect_area_entered(exp: Experience) -> void:
	calculate_exp(exp.collect())
	

func calculate_exp(exp: int) -> void:
	var exp_required = get_exp_for_level()
	exp_collected += exp
	if current_exp + exp_collected >= exp_required:
		exp_collected -= exp_required - current_exp
		current_level += 1
		Events.emit_signal("levelled_up", current_level)
		current_exp = 0
		exp_required = get_exp_for_level()
		calculate_exp(0)
	else:
		current_exp += exp_collected
		exp_collected = 0
	
func get_exp_for_level() -> int:
	var level = current_level
	if current_level < 10:
		level = current_level * 4
	elif current_level < 30:
		level = 50 + (current_level - 9) * 8
	elif current_level < 50:
		level = 100 + (current_level - 29) * 12
	elif current_level < 80:
		level = 150 + (current_level - 49) * 16
	else:
		level = 200 + (current_level - 79) * 32
		
	return level
