extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	#When left clicked
	#if Input.is_action_just_pressed("left_click"):
	#	print("Left click!")

	#Get mouse realtime position when click
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
