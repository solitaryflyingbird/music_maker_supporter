extends Area2D


var in_mouse = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if in_mouse:
			print("click")

func _on_gun_ban_mouse_entered():
	in_mouse = 1

func _on_gun_ban_mouse_exited():
	in_mouse = 0
