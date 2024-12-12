extends Area2D

@export var speed = 300
@onready var visible_notifier = get_node("VisibleNotifier") #same as $VisibleNotifier

#func _ready():
	#visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	rocket_movement(delta)
	
func rocket_movement(delta):
	global_position.x += speed * delta

#func _on_screen_exited():
	#print("Rocket has left the building!")
	#queue_free()
	#


func _on_area_entered(area):
	queue_free()

		 
		
	
