class_name Samus
extends CharacterBody2D


const SPEED := 50.0

@export var armor := 5

@onready var sprite := $Sprite2D as Sprite2D
@onready var hurtbox := $Hurtbox as Hurtbox
@onready var armory := $Armory as Armory
@onready var modifiers: Node2D = $Modifiers

var face_direction := Vector2.RIGHT

var passives = []

func _ready() -> void:
	Globals.Samus = self

	const beam_cannon = preload("res://src/weapons/Beam/BeamCannon.tscn")
#	const missile_cannon = preload("res://src/weapons/Missile/MissileCannon.tscn")
#	const super_missile_cannon = preload("res://src/weapons/SuperMissile/SuperMissileCannon.tscn")
#	const bomb_dropper = preload("res://src/weapons/Bomb/BombDropper.tscn")
#	const power_bomb_dropper = preload("res://src/weapons/PowerBomb/PowerBombDropper.tscn")
#	const grapple_beam_launcher = preload("res://src/weapons/GrappleBeam/GrappleBeamLauncher.tscn")
	armory.add_weapon(beam_cannon)
	Events.levelled_up.connect(_on_levelled_up)


func _physics_process(_delta: float) -> void:
	move()
#	print($Health.health)

func _on_levelled_up(level: int)-> void:
	print("Level: ", level)


func move() -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	velocity = direction.normalized() * SPEED

	check_face_direction(direction.x)
	move_and_slide()


func check_face_direction(input_direction) -> void:
	if input_direction > 0:
		sprite.flip_h = false
		face_direction = Vector2.RIGHT
	if input_direction < 0:
		sprite.flip_h = true
		face_direction = Vector2.LEFT

func fire():
	pass
