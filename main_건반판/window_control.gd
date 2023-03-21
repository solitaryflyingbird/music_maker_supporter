extends Control

onready var my_window = $MyWindow

func _ready():
	pass
func open_window():
	my_window.popup_centered()
func close_window():
	my_window.hide()
