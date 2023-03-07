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

func stop_note():
	player.stop()
	print(play_timer.time_left)
	play_timer.stop()
	is_playing = false
	is_playing = false # Reset the flags


func _on_play_timer_timeout():
	print(play_timer.time_left)
	stop_note()
