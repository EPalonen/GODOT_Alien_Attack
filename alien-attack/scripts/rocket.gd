extends Area2D

@export var speed = 300


func _physics_process(delta):
	rocket_movement(delta)
	
func rocket_movement(delta):
	global_position.x += speed * delta
