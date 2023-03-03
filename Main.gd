extends Node

@export var mob_scene: PackedScene
var score

func _ready():
	new_game()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game():
	score = 0
	$Goober.start($StartingPos.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpawn")
	mob_spawn_location.progress_ratio = randi()
	var mob_direction = mob_spawn_location.rotation + PI/2
	
	mob.position = mob_spawn_location.position
	mob_direction += randf_range(-PI/4, PI/4)
	mob.rotation = mob_direction
	
	var mob_velocity = Vector2(randf_range(100, 400), 0)
	mob.linear_velocity = mob_velocity.rotated(mob_direction)
	
	add_child(mob)

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
