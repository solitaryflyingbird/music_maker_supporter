extends Control


# Your list of items
var items = ["save file is not exist"]

# Reference to the GridContainer
onready var grid_container = $ScrollContainer/GridContainer

func _ready():
	create_board()
func remove_all_grids():
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free()

func create_board():
	remove_all_grids()
	var parent_node = get_parent()
	if parent_node.file_names_and_contents_dic:
		items = []
		for key in parent_node.file_names_and_contents_dic:
			print(key)
			items.append(key)
	else:
		items = ["save file is not exist"]
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
	create_board()
	print("Button for item %s was pressed." % item)
