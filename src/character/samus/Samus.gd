class_name Samus
extends CharacterBody2D

const SPEED = 50.0

@export var armor := 5


@onready var sprite : Sprite2D = $Sprite2D
@onready var hurtbox : Hurtbox = $Hurtbox


func _ready() -> void:
	pass


func _physics_process(_delta: float) -> void:
	move()


func move() -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	velocity = direction.normalized() * SPEED
	
	face_direction()
	move_and_slide()


func face_direction() -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	if direction.x > 0: 
		sprite.flip_h = false
	if direction.x < 0:
		sprite.flip_h = true

