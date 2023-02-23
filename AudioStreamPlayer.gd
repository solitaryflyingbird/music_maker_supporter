extends AudioStreamPlayer



func _ready():
	var generator = AudioStreamGeneratorNode.new()
	generator.set_process_callback(self, "_process_audio")
	add_child(generator)
	generator.play()

func _process_audio(audio_buffer):
	var sample_rate = audio_buffer.get_mix_rate()
	var buffer_size = audio_buffer.get_frame_count()
	var phase = 0.0
	var frequency = 440.0
	var amplitude = 0.5
	for i in range(buffer_size):
		var sample = sin(phase * 2 * PI)
		sample *= amplitude
		audio_buffer.set_frame(i, sample, sample)
		phase += frequency / sample_rate
