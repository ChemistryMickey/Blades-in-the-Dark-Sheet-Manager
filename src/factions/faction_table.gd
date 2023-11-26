extends VBoxContainer
class_name Faction_table

var faction_line_template = preload("res://src/factions/faction_line.tscn")

@export var faction_name: String = ""

func set_faction_name(faction_name_in: String) -> void:
	$Label.text = "[center][b]%s[/b][/center]" % faction_name_in;
	faction_name = faction_name_in;

func add_line(subfaction: String, tier: int, hold: String, level: int = 0) -> void:
	var new_line = faction_line_template.instantiate();
	new_line.set_properties(subfaction, tier, hold, level);
	$lines.add_child(new_line)
	$lines.add_child(HSeparator.new());
	
