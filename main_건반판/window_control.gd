extends Control

onready var my_window = $MyWindow
onready var file_name = $MyWindow/file_name
func _ready():
	pass
func open_window():
	my_window.popup_centered()
func close_window():
	my_window.hide()
func print_text():
	var x = file_name.text
	print(x)


func _on_save_button_pressed():
	print_text()
