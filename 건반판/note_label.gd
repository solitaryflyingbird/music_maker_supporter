extends Label


func text_append(new_text: String):
	text += new_text
func _text_change(n):
	text = n
	
func text_remove():
	if text != "":
		text = text.substr(0, text.length() - 1)

func _ready():
	text = ""


