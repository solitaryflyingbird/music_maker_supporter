extends Area2D


var in_mouse = 0

# Called when the node enters the scene tree for the first time.
var player
var timer
func _ready():
	player = $player
	timer = $Timer
func play_node():
	player.play()
	timer.start()
func stop_node():
	print(timer.time_left)
	player.stop()
	timer.stop()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if in_mouse:
			play_node()
			print("click")
	elif player.playing:
		stop_node()

func _on_gun_ban_mouse_entered():
	in_mouse = 1

func _on_gun_ban_mouse_exited():
	in_mouse = 0

func _on_Timer_timeout():
	stop_node()
