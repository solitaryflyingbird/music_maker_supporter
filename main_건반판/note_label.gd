extends RichTextLabel



func array_to_text(array):
	var my_string = ""
	for i in array:
		my_string = my_string + str(i)
	bbcode_text = my_string
func array_to_text_color(array, number):
	var label = Label.new()
	number+=1
	var color = "red"
	var my_string = ""
	for i in range(array.size()):
		if i < number:
			my_string += "[color=" + color + "]" + str(array[i]) + "[/color]"
		else:
			my_string = my_string + str(array[i])
	bbcode_text = my_string


func _ready():
	pass



