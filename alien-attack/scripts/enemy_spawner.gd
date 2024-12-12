extends Node2D

signal enemy_spawned(enemy_instance)
 
var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions
@onready var timer =  $Timer

func  _ready():
	randomize_timer()

func randomize_timer():
	# Set the wait time to a random value between 1 and 3 seconds (for example)
	timer.wait_time = randf_range(1.5, 2.0)  # Random time between 1 and 3 seconds
	timer.start()  # Start the timer

func _on_timer_timeout():
	spawn_enemy()
	randomize_timer()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	#add_child(enemy_instance)
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
