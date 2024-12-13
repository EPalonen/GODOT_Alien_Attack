extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)
 
var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn") 

@onready var spawn_positions = $SpawnPositions
@onready var timer =  $Timer
@onready var timer_path_enemy = $TimerPathEnemy

func  _ready():
	randomize_timer()

func randomize_timer():
	# Set the wait time to a random value between 1 and 3 seconds (for example)
	timer.wait_time = randf_range(1, 1)  # Random time between 1 and 3 seconds
	timer.start()  # Start the timer

func _on_timer_timeout():
	spawn_enemy()
	randomize_timer()

func _on_timer_path_enemy_timeout():
	spawn_path_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	#add_child(enemy_instance)
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)


func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
	

	
