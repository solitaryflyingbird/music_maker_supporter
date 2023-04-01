extends Node
var load_data_index = []
func _ready():
	process_folder()
	print(load_data_index)

func process_folder():
	# Replace this with the path to the folder you want to access
	var folder_path := "res://save/"
	
	# Create a Directory instance and open the folder
	var dir := Directory.new()
	var err := dir.open(folder_path)
	
	# Check if the folder was opened successfully
	if err == OK:
		# Get the list of file names and contents
		var file_names_and_contents := get_text_files_contents(dir, folder_path)
		
		print(file_names_and_contents)
		for file_data in file_names_and_contents:
			print("File Name: ", file_data.name, " Content: ", file_data.content)
			load_data_index.append([file_data.name, file_data.content])
	else:
		print("Error opening folder:", folder_path)

func get_text_files_contents(dir: Directory, folder_path: String) -> Array:
	var file_data_array := []
	
	# List all the files in the folder
	dir.list_dir_begin()
	var file_name := dir.get_next()
	
	while file_name != "":
		if !dir.current_is_dir():
			# Check if the file has a '.txt' extension

			# Read the file's content
			var file_path := folder_path.plus_file(file_name)
			var file := File.new()
			file.open(file_path, File.READ)
			var file_content := file.get_as_text()
			file.close()
			
			# Store the file's name and content in a Dictionary and add it to the array
			file_data_array.append({"name": file_name, "content": file_content})
		
		file_name = dir.get_next()
	
	# Cleanup
	dir.list_dir_end()
	
	return file_data_array
