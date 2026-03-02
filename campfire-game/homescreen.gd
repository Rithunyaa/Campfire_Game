extends Control  # or Node2D

const GAME_SCENE = "res://Info.tscn"  # your game scene path
const SLEEP_DURATION = 5.0  # seconds

func _ready():
	# Create a Timer node
	var return_timer = Timer.new()
	return_timer.wait_time = SLEEP_DURATION
	return_timer.one_shot = true
	add_child(return_timer)
	
	# Connect the timeout signal
	return_timer.timeout.connect(_return_to_game)
	
	# Start the timer
	return_timer.start()

func _return_to_game():
	get_tree().change_scene_to_file(GAME_SCENE)

	
