extends Node2D

@onready var shutter_group: Control = $IntroLayer/ShutterGroup

@export var hold_time: float = 1.0
@export var slide_duration: float = 1.25


func _ready() -> void:
	play_day_start_animation()


func play_day_start_animation() -> void:
	shutter_group.visible = true
	shutter_group.position = Vector2.ZERO

	await get_tree().create_timer(hold_time).timeout

	var screen_height: float = get_viewport_rect().size.y

	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(
		shutter_group,
		"position:y",
		-screen_height,
		slide_duration
	)

	await tween.finished

	shutter_group.visible = false
