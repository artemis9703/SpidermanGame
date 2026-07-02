extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var web_collected = 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(delta: float) -> void:
	if web_collected == 3:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")
	
	if timer_end:
		Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://Scenes/timer_scene.tscn")

func web_collect() -> void:
	web_collected = web_collected +1
	return
