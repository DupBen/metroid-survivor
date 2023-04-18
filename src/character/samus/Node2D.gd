extends Node2D

@export var test : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Testing ', test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
