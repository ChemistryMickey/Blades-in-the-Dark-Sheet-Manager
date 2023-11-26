extends ScrollContainer

var faction_table_template = preload("res://src/factions/faction_table.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var factions = DatabaseLoader.json_dicts["factions"];
	for faction in factions:
		var new_table: Faction_table = faction_table_template.instantiate();
		new_table.set_faction_name(faction);
		for subfaction in factions[faction]:
			new_table.add_line(
				subfaction, 
				factions[faction][subfaction]["Tier"], 
				factions[faction][subfaction]["Hold"]
			)
		$container.add_child(new_table);
		
func save() -> Dictionary:
	var save_dict = {"Faction Statuses": {}};
	for table in $container.get_children():
		if table is Faction_table:
			save_dict["Faction Statuses"][table.faction_name] = {}
			for child in table.get_children():
				if child is VBoxContainer:
					for line in child.get_children():
						if line is Faction_line:
							save_dict["Faction Statuses"][table.faction_name][line.subfaction_name] = line.subfaction_status;
	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	for child in $container.get_children():
		child.queue_free();
		
	var factions = DatabaseLoader.json_dicts["factions"];
	for faction in sheet_dict["Faction Statuses"]:
		var new_table = faction_table_template.instantiate();
		new_table.set_faction_name(faction);
		for subfaction in sheet_dict["Faction Statuses"][faction]:
			new_table.add_line(
				subfaction,
				factions[faction][subfaction]["Tier"], 
				factions[faction][subfaction]["Hold"],
				sheet_dict["Faction Statuses"][faction][subfaction]
			)
		$container.add_child(new_table);

