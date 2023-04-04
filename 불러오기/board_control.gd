extends Control


# Your list of items
var items = ["save file is not exist"]
var load_dic = []

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
		load_dic = parent_node.file_names_and_contents_dic
		items = []
		for key in parent_node.file_names_and_contents_dic:
			items.append(key)
	else:
		items = ["save file is not exist"]
	
	# Set the minimum button size
	var button_min_width = 380
	var button_min_height = 50

	# Create a new DynamicFont resource
	var font = DynamicFont.new()
	font.font_data = load("res://NotoSansKR-Black.otf") # Replace with your font file path
	font.size = 18 # Set the desired font size
	
	for item in items:
		var button = Button.new()
		button.text = item
		button.rect_min_size = Vector2(button_min_width, button_min_height) # Set the minimum size

		# Assign the DynamicFont resource to the button's font property
		button.add_font_override("font", font)

		button.connect("pressed", self, "_on_button_pressed", [item])
		grid_container.add_child(button)

	
	
func _on_button_pressed(item):
	create_board()
	if item in load_dic:
		print(load_dic[item])
	else:
		print("Error: Key %s not found in load_dic." % item)
	print("Button for item %s was pressed." % item)

