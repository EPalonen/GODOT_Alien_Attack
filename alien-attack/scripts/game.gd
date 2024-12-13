extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui =  $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_hit_sound =  $PlayerHitSound

var game_over_scene_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)
	
func _on_death_zone_area_entered(area):
	area.gueue_free()


func _on_player_took_damage():
	player_hit_sound.play()
	lives -= 1
	hud.set_lives_label(lives)
	

	if lives == 0:
		print("GAMEOVER!")
		player.die()
		await get_tree().create_timer(1).timeout
		
		var game_over_scene_scene = game_over_scene_scene.instantiate()
		game_over_scene_scene.set_score(score)
		ui.add_child(game_over_scene_scene)
		
		
	

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_died", on_enemy_died)
	add_child(enemy_instance)
	
func on_enemy_died():
	score += 150
	print(score)
	hud.set_score_label(score)
	enemy_hit_sound.play()


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("enemy_died", on_enemy_died)
