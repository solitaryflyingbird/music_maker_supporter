extends Node2D


export(Resource) var do
export(Resource) var re
export(Resource) var mi
export(Resource) var fa
export(Resource) var sol
export(Resource) var ra
export(Resource) var si
export(Resource) var do2

export(Resource) var do_s
export(Resource) var re_s
export(Resource) var fa_s
export(Resource) var sol_s
export(Resource) var ra_s

var note_dict

func _ready():
	note_dict = {
		"도": do,
		"레": re,
		"미": mi,
		"파": fa,
		"솔": sol,
		"라": ra,
		"시": si,
		"도2": do2,
		"도#": do_s,
		"레#": re_s,
		"파#": fa_s,
		"솔#": sol_s,
		"라#": ra_s
	}
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
