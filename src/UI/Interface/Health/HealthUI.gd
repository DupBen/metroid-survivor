extends VBoxContainer

@export var total_health = 99
@export var current_health = 99
@export var health_per_block = 99

var last_health = current_health

var HealthBoxScene = preload("res://src/UI/Interface/Health/HealthBox/health_box.tscn")

func _process(delta):
	if(_should_refresh()):
		_refresh()


func _should_refresh():
	if (last_health == current_health):
		return false
		
	last_health = current_health
	return true


func _refresh():
	var total_health_blocks = total_health / health_per_block
	var current_health_blocks = current_health / health_per_block
	_delete_child_nodes($HealthBlocks)
	_spawn_health_blocks(current_health_blocks)
	_update_energy_label(current_health_blocks)


func _delete_child_nodes(node: Node) -> void:
	for child in node.get_children():
		_delete_child_nodes(child)
		child.queue_free()


func _spawn_health_blocks(current_health_blocks):
	for index in current_health_blocks:
		# Spawn new health box
		var health_box = HealthBoxScene.instantiate()
		$HealthBlocks.add_child(health_box)


func _update_energy_label(current_health_blocks):
	$HealthLabel/EnergyValue.text = str(current_health - (current_health_blocks * health_per_block))
