extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func text_append(new_text: String):
	text += new_text
func _text_change(n):
	text = n
# Called when the node enters the scene tree for the first time.
func _ready():

	text = "Hello, world!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
