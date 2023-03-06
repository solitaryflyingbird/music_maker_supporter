extends Label


func text_append(new_text: String):
	text += new_text
func _text_change(n):
	text = n
func array_to_text(array):
	var my_string = ""
	for i in array:
		my_string = my_string + str(i)
	text = my_string
	
func text_remove():
	if text != "":
		text = text.substr(0, text.length() - 1)
	print(text)

func _ready():
	text = ""
	text_remove()

