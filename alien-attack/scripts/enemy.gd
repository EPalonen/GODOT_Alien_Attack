extends Area2D

signal enemy_died


@export var speed = 200
@onready var visible_notifier =$VisibleNotifier

func _physics_process(delta):
	rocket_movement(delta)
	
func rocket_movement(delta):
	global_position.x += -speed * delta



func _on_visible_notifier_screen_exited():
	print("Enemy has left the building!")
	queue_free()

func die():
	queue_free()
	

func _on_area_entered(area):
	die()
	emit_signal("enemy_died")


func _on_body_entered(body):
	body.take_damage()
	die()
