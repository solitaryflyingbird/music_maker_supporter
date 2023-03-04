extends Node2D


var note_array = []
onready var note_label = get_node("note_label")
# Called when the node enters the scene tree for the first time.
func _array_append(n):
	note_array.append(n)
	note_label.text_append(str(n))



func _ready():
	print(note_array)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
