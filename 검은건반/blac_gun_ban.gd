extends Area2D


export var in_mouse = 0
export(Resource) var note_sound
export(Resource) var white_sprite
export(Resource) var black_sprite
export var note_name = ""
export(NodePath) var array
# Called when the node enters the scene tree for the first time.
var player
var timer
var sprite
func _ready():
	player = $player
	player.stream = note_sound
	timer = $Timer
	array = get_node(array)
	sprite = $Sprite

func play_node():
	player.play()
	timer.start()
	sprite.texture = white_sprite
	sprite.modulate = Color(1, 0.5, 0.5, 1)
func stop_node():
	var length
	length = 2 - timer.time_left
	player.stop()
	timer.stop()
	print(array)
	array._array_append(note_name, note_sound)
	print(array.note_array)
	sprite.texture = black_sprite
	sprite.modulate = Color(1, 1, 1, 1)

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
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
