extends VBoxContainer

var is_instantiated = false
var total_health = 99
var current_health = 99
var health_per_block = 100

var last_health = 0

var HealthBoxScene = preload("res://src/UI/Interface/Health/HealthBox/health_box.tscn")

@onready var root = get_tree().get_root()
# TODO This should be updated.
@onready var samus = root.get_node('Sandbox').get_node("Samus")


func _ready():
	total_health = samus.health
	current_health = samus.health


func _process(delta):
	_refresh()


func _should_refresh():
	current_health = samus.health
	if (last_health == current_health):
		return false

	last_health = current_health
	return true


func _refresh():
	if(_should_refresh()):
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


