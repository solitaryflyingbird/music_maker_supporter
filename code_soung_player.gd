
extends Node2D

var player
var timer
func _ready():
	player = $AudioStreamPlayer
	timer = $Timer
func play_node():
	player.play()
	timer.start()
func stop_node():
	print(timer.time_left)
	player.stop()
	timer.stop()
	
""""
func _input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		play_node()
	elif player.playing:
		stop_node()
"""


func _on_Timer_timeout():
	stop_node()
