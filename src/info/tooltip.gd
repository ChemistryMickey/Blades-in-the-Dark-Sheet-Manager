extends HBoxContainer

func _make_custom_tooltip(for_text):
	var tooltip = preload("res://src/common/autoscroll-tooltip.tscn").instantiate();
	tooltip.text = for_text;
	return tooltip
