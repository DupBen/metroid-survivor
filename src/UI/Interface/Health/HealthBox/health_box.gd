extends AspectRatioContainer

@export var box_size = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Border.custom_minimum_size = Vector2(box_size, box_size)
	$Border/Box.size = Vector2(box_size - 1, box_size - 1)
	$Border/Box.position = Vector2(1, 1)
	print("box size", $Border/Box.size)

