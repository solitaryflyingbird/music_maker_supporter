extends Node2D

var player
var play_timer
var rest_timer
var note_player 


var is_space_pressed = false
var is_playing = false
var note_length_arr = []
var note_name_arr = []
var sound_data_arr = []
var play_start = false
var beet_play_ready = false


export(NodePath) var note_arr
var note_bar = 0
var now_note


func _ready():
	beet_play_ready = false
	player = $player
	play_timer = $play_timer
	note_player = $note_player
	rest_timer = $rest_timer

	
	######

	note_arr = get_node(note_arr)

func play_ready():
	if len(note_arr.note_array)>0:
		note_name_arr = note_arr.note_array
		sound_data_arr = note_arr.sound_array
		note_bar = 0
		note_length_arr = []
		player.stream =sound_data_arr[note_bar]
		play_start = true
		note_arr.array_to_text()
	
	
func next_note():
	if len(sound_data_arr) > note_bar+1:
		note_bar+=1
		now_note = sound_data_arr[note_bar]
		player.stream = now_note
	else:
		note_bar+=1
		

func _process(delta):
	pass



func play_note():
	play_timer.start()
	player.play()
	is_playing = true
	is_space_pressed = true
	
	if note_bar == 0:
		return;
	var rest_length = max((2 - rest_timer.time_left)*8, 1)
	rest_length = (round_int(rest_length))
	note_length_arr.append(rest_length)
	print(note_length_arr)
	
		
func round_int(number):
	var remainder = int(number*10) % 10
	if remainder < 5:
		return int(number)
	else:
		return int(number)+1

func stop_note():
	player.stop()
	var note_length = max( (2 - play_timer.time_left)*8, 1)
	note_length = (round_int(note_length))	
	note_length_arr.append([note_name_arr[note_bar], note_length])
	play_timer.stop()
	rest_timer.start()
	is_playing = false
	if len(sound_data_arr) == note_bar+1:
		play_start = false

	next_note()

func _on_play_timer_timeout():
	stop_note()


func _on_play_button_button_up():
	if play_start == false:
		return;
	stop_note()


func _on_play_button_button_down():
	if play_start == false:
		return;
	play_note()
	note_arr.array_color(note_bar)

