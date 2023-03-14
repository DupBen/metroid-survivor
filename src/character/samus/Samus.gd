class_name Samus
extends CharacterBody2D


const SPEED := 50.0
const beam_cannon = preload("res://src/weapons/Beam/BeamCannon.tscn")
const missile_cannon = preload("res://src/weapons/Missile/MissileCannon.tscn")
const super_missile_cannon = preload("res://src/weapons/SuperMissile/SuperMissileCannon.tscn")
const bomb_dropper = preload("res://src/weapons/Bomb/BombDropper.tscn")

@export var armor := 5

@onready var sprite := $Sprite2D as Sprite2D
@onready var hurtbox := $Hurtbox as Hurtbox

var face_direction := Vector2.RIGHT
var weapons = []
var passives = []

func _ready() -> void:
#    weapons.append(beam_cannon)
    weapons.append(missile_cannon)
#    weapons.append(super_missile_cannon)
#    weapons.append(bomb_dropper)
    for weapon in weapons:
        add_child(weapon.instantiate())

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
