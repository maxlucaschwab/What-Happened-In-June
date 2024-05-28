extends Node2D

@onready var idleCursor = preload("res://_Assets/Interactables/mouse.png")
@onready var hoverCursor = preload("res://_Assets/Interactables/mouserollover.png")
@onready var Icon = self.get_node("Icon")
@onready var actionable_finder: Area2D = $Actionable_Finder


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.
	
func _unhandled_input(_event: InputEvent) -> void:
	var actionables = actionable_finder.get_overlapping_areas()
	if Input.is_action_just_pressed("ui_select"):
		if actionables.size() > 0:
			actionables[0].action()
			return
	if actionables.size() > 0:
		self.Icon.texture = hoverCursor
	else:
		self.Icon.texture = idleCursor

func _process(_delta):
	self.position = self.get_global_mouse_position()

