extends Node2D


var note_array = []

# Called when the node enters the scene tree for the first time.
func _array_append():
	note_array.append(1)
func _ready():
	note_array.append(1)
	print(note_array)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
