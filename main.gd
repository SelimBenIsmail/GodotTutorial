extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

	
func _on_score_timer_timeout():
	score += 1


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	var direction  = mob_spawn_location.rotation + PI/2
	
	mob.position = mob_spawn_location.position
	var velocity = Vector2(randf_range(150.0, 250.0),0.0)
	mob.linear_velocity = velocity.rotated(direction)
	mob.get_node("AnimatedSprite2D").flip_h = mob.linear_velocity.x < 0
	
	add_child(mob)
