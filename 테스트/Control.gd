extends Control

func _ready():
	# Create the Label node
	var label = Label.new()
	

	
	# Set the text of the Label node
	label.set_text("[color=blue]"+"xxx"+"[/color]")
	
	# Set the position of the Label node
	label.set_position(Vector2(0, 0))
	
	# Add the Label node as a child of the current node
	add_child(label)
