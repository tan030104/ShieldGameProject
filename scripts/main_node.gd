extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#On every frame, update real shield position to follow player
	if $Shield.is_thrown == false:
		var player_pos = $player.global_position
		$Shield.global_position = player_pos
	#pass
	
# Called when there a input event
func _input(event):
	#When left clicked
	#if Input.is_action_just_pressed("left_click"):
	#	print("Left click!")
	pass
	

	#Get mouse realtime position when click
	#if event is InputEventMouseButton:
	#	print("Mouse Click/Unclick at: ", event.position)


func _on_shield_shield_throw() -> void:
	#Get mouse global postion
	var mouse_pos = get_global_mouse_position()
	print("Shield throw at ", mouse_pos)
	
	$Shield.throw_shield_at(mouse_pos)
	$Shield/Timer.start()
	

func _on_timer_timeout() -> void:
	$Shield.is_thrown = false
