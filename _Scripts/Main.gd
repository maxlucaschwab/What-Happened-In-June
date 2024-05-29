extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameState.inDialogue == false:
		$Cam_area/CollisionShape2D/Camera2D.position = get_local_mouse_position()
	else: 
		$Cam_area/CollisionShape2D/Camera2D.position = Vector2(GameState.position[0], GameState.position[1])
