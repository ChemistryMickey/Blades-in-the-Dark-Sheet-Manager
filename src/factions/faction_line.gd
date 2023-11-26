extends HBoxContainer
class_name Faction_line

@export var subfaction_status: int = 0;
@export var subfaction_name: String = "";

func set_properties(subfaction: String, tier: int, hold: String, level: int) -> void:
	$subfaction.text = subfaction;
	$tier.text = str(tier);
	$hold.text = hold;
	$status.value = level;
	subfaction_status = level;
	subfaction_name = subfaction;

func _on_status_value_changed(value):
	subfaction_status = value;
