class_name MissileCannon
extends Node2D

@onready var missile = preload("res://src/weapons/Missile/Missile.tscn")
@onready var timer = $Timer
@onready var detector_radius = 2.5
@onready var detector = $Detector
var enemies_in_range = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    detector.scale = Vector2(detector_radius, detector_radius) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_timer_timeout() -> void:
    var missileNode = missile.instantiate()
    var samus = get_parent()
    if not samus:
        return
    missileNode.direction = samus.face_direction
    missileNode.global_position = samus.global_position

    if enemies_in_range.size() > 0:
        #If enemy in range target the first one
        missileNode.target = enemies_in_range[0]
    # TODO create missile animation and control the missiles start angle
    get_tree().get_root().add_child(missileNode)


func _on_detector_area_entered(area: Area2D) -> void:
    enemies_in_range.append(area.get_parent())


func _on_detector_area_exited(area: Area2D) -> void:
    enemies_in_range.erase(area.get_parent())

