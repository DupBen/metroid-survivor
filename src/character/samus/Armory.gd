extends Node2D
class_name Armory


var weapons = []


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	for weapon in weapons:
		pass
		#print("Weapon: ", weapon)


func add_weapon(weapon) -> void:
	weapons.append(weapon)
	add_child(weapon.instantiate())
