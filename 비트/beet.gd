extends Node2D

var player
var play_timer
var is_space_pressed = false
var is_playing = false

func _ready():
	player = $player
	play_timer = $play_timer

func _process(delta):
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
	play_timer.stop()
	is_playing = false



func _on_play_timer_timeout():
	stop_note()
