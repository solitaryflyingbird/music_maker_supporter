extends Control

# Your list of items
var items = ["AAAA", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

# Reference to the GridContainer
onready var grid_container = $ScrollContainer/GridContainer

func _ready():
	create_board()

func create_board():
	# Set the minimum button size
	var button_min_width = 380
	var button_min_height = 50
	
	for item in items:
		var button = Button.new()
		button.text = item
		button.rect_min_size = Vector2(button_min_width, button_min_height) # Set the minimum size
		button.connect("pressed", self, "_on_button_pressed", [item])
		grid_container.add_child(button)


func _on_button_pressed(item):
	print("Button for item %s was pressed." % item)
