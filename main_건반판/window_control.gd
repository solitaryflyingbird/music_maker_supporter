extends Control

onready var my_window = $MyWindow
onready var file_name = $MyWindow/file_name
export(NodePath) var note_lenfth_arr
func _ready():
	note_lenfth_arr = get_node(note_lenfth_arr)
func open_window():
	my_window.popup_centered()
func close_window():
	my_window.hide()
func print_text():
	var x = file_name.text
	print(x)

func convert_data_types_to_characters(data_array: Array) -> String:
	var result = ""
	var character = ""
	for element in data_array:
		result += str(element)
	return result



func _on_save_button_pressed():
	var content = note_lenfth_arr.note_length_arr
	content = convert_data_types_to_characters(content)
	var name = file_name.text
	print(content, file_name.text)
	export_file(name, content)
	print_text()
	
func export_file(file_name: String, content: String) -> void:
	var file = File.new()
	var project_path = "res://"
	var file_path = project_path + file_name

	file.open(file_path, File.WRITE)
	file.store_string(content)
	file.close()

	print("File exported:", file_path)
