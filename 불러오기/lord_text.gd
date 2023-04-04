extends Node
var load_data_index = []
var file_names_and_contents
var file_names_and_contents_dic
func _ready():
	process_folder()

func process_folder():
	file_names_and_contents_dic = {}
	var folder_path := "res://save/"
	
	# Create a Directory instance and open the folder
	var dir := Directory.new()
	var err := dir.open(folder_path)
	
	# Check if the folder was opened successfully
	if err == OK:
		# Get the list of file names and contents
		file_names_and_contents = get_text_files_contents(dir, folder_path)
		for file_data in file_names_and_contents:
			file_names_and_contents_dic[file_data.name] = file_data.content
			load_data_index.append([file_data.name, file_data.content])
	else:
		print("Error opening folder:", folder_path)

func get_text_files_contents(dir: Directory, folder_path: String) -> Array:
	var file_data_array := []
	

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
			if len(file_content) != 0:
				file_data_array.append({"name": file_name, "content": file_content})
		file_name = dir.get_next()
	
	# Cleanup
	dir.list_dir_end()
	return file_data_array
