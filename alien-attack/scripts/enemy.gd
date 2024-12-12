extends Area2D
@export var speed = 200
@onready var visible_notifier =$VisibleNotifier

func _physics_process(delta):
	rocket_movement(delta)
	
func rocket_movement(delta):
	global_position.x += -speed * delta



func _on_visible_notifier_screen_exited():
	print("Enemy has left the building!")
	queue_free()
