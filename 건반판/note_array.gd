extends Node2D


var note_array = []
onready var note_label = get_node("note_label")
# Called when the node enters the scene tree for the first time.
func _array_append(n):
	note_array.append(n)
	note_label.array_to_text(note_array)
func array_remove():
	var array_length = note_array.size()
	print(array_length)
	if array_length > 0:
		note_array.remove(array_length - 1)
		note_label.array_to_text(note_array)

func _ready():
	print(note_array)
	pass 


#	pass
