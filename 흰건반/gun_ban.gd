extends Area2D


var in_mouse = 0
var black_crash = 0
export(Resource) var note_sound
export(NodePath) var black_gun
export(NodePath) var black_gun2

export var note_name = ""
export(NodePath) var array
# Called when the node enters the scene tree for the first time.
var player
var timer
var black_in_mouse
func _ready():
	player = $player
	player.stream = note_sound
	timer = $Timer
	array = get_node(array)
	if black_gun != null:
		black_gun = get_node(black_gun)
	if black_gun2 != null:
		black_gun2 = get_node(black_gun2)

func play_node():
	player.play()
	timer.start()


func stop_node():
	var length
	length = 2 - timer.time_left
	player.stop()
	timer.stop()
	array._array_append(note_name, note_sound)
	print(array.note_array)

func _gun_check():
	if black_gun != null or black_gun2 != null:
		if black_gun != null and black_gun.in_mouse == 1:
			return 1
		if black_gun2 != null and black_gun2.in_mouse ==1:
			return 1
	return 0 

func _input(event):
	black_in_mouse = _gun_check()

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and black_in_mouse==0:
		if in_mouse:
			play_node()
	elif player.playing and event is InputEventMouseButton:
		stop_node()

func _on_gun_ban_mouse_entered():
	in_mouse = 1

func _on_gun_ban_mouse_exited():
	in_mouse = 0

func _on_Timer_timeout():
	stop_node()


