extends Node2D

var player
var play_timer
var rest_timer
var note_player 
var is_space_pressed = false
var is_playing = false
var note_length_arr = []


export(NodePath) var note_arr
var note_bar = 0
var now_note


func _ready():
	player = $player
	play_timer = $play_timer
	note_player = $note_player
	rest_timer = $rest_timer
	
	######

	note_arr = get_node(note_arr)
	note_arr = note_arr.note_arr
	now_note = note_player.note_dict[note_arr[0]]
	player.stream = now_note
	
	
	
func next_note():
	if len(note_arr) > note_bar+1:
		note_bar+=1
		now_note = note_player.note_dict[note_arr[note_bar]]
		player.stream = now_note
	else:
		note_bar+=1
		

func _process(delta):
	if len(note_arr) > note_bar:
		#print(len(note_arr), note_bar)
		if Input.is_action_pressed("ui_select"):
			play_note()
			is_space_pressed = true
			
		elif Input.is_action_just_released("ui_select"):
			is_space_pressed = false
			if is_playing:
				stop_note()



func play_note():
	if (not is_playing) and (is_space_pressed == false): 
		play_timer.start()
		player.play()
		is_playing = true
		is_space_pressed = true
		if note_bar == 0:
			return;
		var rest_length = (2 - rest_timer.time_left)*8
		rest_length = (round_int(rest_length))
		note_length_arr.append(rest_length)
		
func round_int(number):
	var remainder = int(number*10) % 10
	if remainder < 5:
		return int(number)
	else:
		return int(number)+1

func stop_note():
	player.stop()
	var note_length = (2 - play_timer.time_left)*8
	note_length = (round_int(note_length))	
	note_length_arr.append([note_arr[note_bar], note_length])
	print(note_length_arr)
	play_timer.stop()
	rest_timer.start()
	is_playing = false
	next_note()

func _on_play_timer_timeout():
	stop_note()
