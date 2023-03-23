extends Node

func _ready():
	export_file("my_exported_file.txt", "This is the content of my exported file.")

func export_file(file_name: String, content: String) -> void:
	var file = File.new()
	var project_path = "res://"
	var file_path = project_path + file_name

	file.open(file_path, File.WRITE)
	file.store_string(content)
	file.close()

	print("File exported:", file_path)
