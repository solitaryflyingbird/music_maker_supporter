extends Node2D

export(NodePath) var beet_arr
var note_array = []
var sound_array = []
onready var note_label = get_node("note_label")
# Called when the node enters the scene tree for the first time.
func _array_append(note_name, note_sound):
	note_array.append(note_name)
	sound_array.append(note_sound)
	note_label.array_to_text(note_array)
func array_remove():
	var array_length = note_array.size()
	if array_length > 0:
		sound_array.remove(array_length - 1)
		note_array.remove(array_length - 1)
		note_label.array_to_text(note_array)
func array_remove_all():
	sound_array = []
	note_array = []
	note_label.array_to_text(note_array)
func array_color(num):
	note_label.array_to_text_color(note_array, num)
func array_to_text():
	note_label.array_to_text(note_array)
func _ready():
	beet_arr = get_node(beet_arr)


func _on_change_button_pressed():
	print(beet_arr.note_length_arr)
	note_label.array_to_text(beet_arr.note_length_arr)
