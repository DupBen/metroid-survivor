class_name Zoomer
extends CharacterBody2D


@export var speed := 10.0

@onready var player := get_tree().get_first_node_in_group('player')
var start_pos = Vector2.ZERO
func _ready() -> void:
    start_pos = global_position
    
func  _physics_process(_delta: float) -> void:
    var direction := global_position.direction_to(player.global_position)
    velocity = direction * speed
    move_and_slide()


func _on_health_died() -> void:
    queue_free()
    global_position = start_pos
