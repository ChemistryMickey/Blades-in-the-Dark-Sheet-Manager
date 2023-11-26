extends Control
class_name Personal_clock

@export var cur_segments: int = 0;
@export var max_segments: int = 0;
@export var desc: String = "";
@export var toggle_for_removal: bool = false;

func _ready() -> void:
	$HBoxContainer/segments.max_value = max_segments;
	$HBoxContainer/segments.value = cur_segments;
	$HBoxContainer/segments.suffix = "/%d" % max_segments;
	$HBoxContainer/descEdit.text = desc;

func _on_check_box_toggled(button_pressed):
	$ColorRect.visible = button_pressed;
	toggle_for_removal = button_pressed;
