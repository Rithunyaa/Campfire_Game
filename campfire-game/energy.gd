extends Sprite2D

@onready var energy_bar = $AnimatedEnergy
var current_frame = 0
var max_frames = 6
var timer = 0.0
var seconds_per_frame = 10.0  

const SWITCH_FRAME = 5
const SLEEP_SCENE = "res://sleep.tscn"
const GAME_SCENE = "res://GameScene.tscn"  
const SLEEP_DURATION = 5.0 

func _ready():
	energy_bar.play("energy")
	energy_bar.pause()
	energy_bar.frame = current_frame

func _process(delta):
	timer += delta
	if timer >= seconds_per_frame:
		timer = 0
		current_frame += 1
		if current_frame >= max_frames:
			current_frame = max_frames - 1
		energy_bar.frame = current_frame
		
		
		if energy_bar.frame == SWITCH_FRAME:
			go_to_sleep()

func go_to_sleep():
	# 
	get_tree().change_scene_to_file(SLEEP_SCENE)
	var return_timer = Timer.new()
	return_timer.wait_time = SLEEP_DURATION
	return_timer.one_shot = true
	add_child(return_timer)
	return_timer.start()
	

func _return_to_game():
	get_tree().change_scene(GAME_SCENE)
