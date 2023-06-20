class_name Samus
extends CharacterBody2D


const SPEED := 50.0

@export var armor := 5
@export var health := 99

@onready var sprite := $Sprite2D as Sprite2D
@onready var hurtbox := $Hurtbox as Hurtbox
@onready var armory := $Armory as Armory
@onready var modifiers: Node2D = $Modifiers
@onready var animation_player := $AnimationPlayer as AnimationPlayer

var face_direction := Vector2.RIGHT

var passives = []
var is_moving = false;

func _ready() -> void:
	set_as_top_level(true)
	Globals.Player = self

	const beam_cannon = preload("res://src/weapons/Beam/BeamCannon.tscn")
	const spazer_beam_cannon = preload("res://src/weapons/SpazerBeam/SpazerBeamCannon.tscn")
#	const missile_cannon = preload("res://src/weapons/Missile/MissileCannon.tscn")
#	const super_missile_cannon = preload("res://src/weapons/SuperMissile/SuperMissileCannon.tscn")
#	const bomb_dropper = preload("res://src/weapons/Bomb/BombDropper.tscn")
#	const power_bomb_dropper = preload("res://src/weapons/PowerBomb/PowerBombDropper.tscn")
#	const grapple_beam_launcher = preload("res://src/weapons/GrappleBeam/GrappleBeamLauncher.tscn")
	armory.add_weapon(spazer_beam_cannon)
	Events.levelled_up.connect(_on_levelled_up)
	_instantiate_health()


func _physics_process(_delta: float) -> void:
	move()
	handle_animation()
	health = $Health.health
	Events.emit_signal("health_change", health)

func _on_levelled_up(level: int)-> void:
	print("Level: ", level)


func handle_animation() -> void:
	#TODO handle death animation.
	var animation = "idle_right"
	if is_moving:
		animation = "walk"
	animation_player.play(animation)


func move() -> void:
	var direction := Vector2.ZERO
	var x_dir = Input.get_axis("left", "right")
	var y_dir = Input.get_axis("up", "down")

	is_moving = x_dir != 0 || y_dir != 0

	direction.x = x_dir
	direction.y = y_dir
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

func get_health() -> int:
	return health

func _instantiate_health():
	print('instantiating samus health: ', health)
	$Health.health = health
	print('Samus.gd:InstantiateHealth::calling total health change:', health)
	Events.emit_signal("total_health_change", self, health)
