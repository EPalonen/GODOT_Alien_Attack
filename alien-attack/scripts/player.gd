extends CharacterBody2D

signal took_damage


var speed = 200

var rocket_scene = preload("res://scenes/rocket.tscn")

#@onready var rocket_container =get_node("RocketContainer")
@onready var rocket_container = $RocketContainer
@onready var rocked_shot_sound = $RocketShotSound



func _physics_process(delta):
	player_movement()

func  _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func player_movement():
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
		
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
		
	global_position = global_position.clamp(Vector2(0,0), screen_size)


func shoot():
	var rocket_instance = rocket_scene.instantiate()
	#add_child(rocket_instance)
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75
	rocked_shot_sound.play()
	
	
	
func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.x > screen_size.x:
		#global_position.x = screen_size.x
	#
	#if global_position.y < 0:
		#global_position.y = 0
		#
	#if global_position.y > screen_size.y:
		#global_position.y = screen_size.y
	
	# global_position.x =clampf(global_position.x, 0, screen_size.x)
	# global_position.y =clampf(global_position.y, 0, screen_size.y)
