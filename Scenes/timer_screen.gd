extends Node2D
@onready var lives_container: HBoxContainer = $LivesContainer
@onready var life_1: TextureRect = $LivesContainer/Life1
@onready var life_2: TextureRect = $LivesContainer/Life2
@onready var life_3: TextureRect = $LivesContainer/Life3
@onready var life_4: TextureRect = $LivesContainer/Life4
@onready var life_5: TextureRect = $LivesContainer/Life5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			life_5.hide()
		3:
			life_5.hide()
			life_1.hide()
		2:
			life_5.hide()
			life_1.hide()
			life_4.hide()
		1:
			life_5.hide()
			life_1.hide()
			life_4.hide()
			life_2.hide()
		0:
			lives_container.hide()
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
