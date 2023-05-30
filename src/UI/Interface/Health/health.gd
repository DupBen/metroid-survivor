extends HBoxContainer

@export var total_health = 4
@export var current_health = 4

var HealthBoxScene = preload("res://src/UI/Interface/Health/HealthBox/health_box.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var number_of_nodes = get_child_count()
	print('total number of nodes ', number_of_nodes);
	if number_of_nodes < current_health:
		# spawn new health box
		var health_box = HealthBoxScene.instantiate();
		add_child(health_box)
		
