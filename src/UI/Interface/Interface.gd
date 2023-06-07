extends CanvasLayer


# Health Blocks
# Exterior: White (#FFFFFF)
# Interior: Pink  (#e860a8)
func findCamera(node: Node) -> Camera2D:
	if node is Camera2D:
		return node

	for child in node.get_children():
		var camera = findCamera(child)
		if camera:
			return camera

	return null

func _ready():
	var scene_root = get_tree().get_root()
	var camera = findCamera(scene_root)
	if camera:
		print("Found camera:", camera)
	else:
		print("No camera found in the scene.")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_health(health):
	print('player health', health)
