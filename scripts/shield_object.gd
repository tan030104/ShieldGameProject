extends Area2D

class_name shield

signal shield_throw

var velocity: Vector2 = Vector2.ZERO
var speed:= 400.0
@export var is_thrown := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Real shield hided when load
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Make the real shield appear when left click
	if Input.is_action_pressed("left_click", true):
		$".".visible = true
	else: $".".visible = false
	
	if Input.is_action_just_pressed("left_click"):
		is_thrown = true
		shield_throw.emit()

func _physics_process(delta):
	if is_thrown == true:
		position += velocity * delta
	
	#if get_overlapping_bodies().size() > 0:
	#	print("Shield is colliding with:", get_overlapping_bodies())
	

func throw_shield_at(target_pos: Vector2):
	if is_thrown == true:
		velocity = (target_pos - global_position).normalized() * speed
		
		
		
	
	
	
