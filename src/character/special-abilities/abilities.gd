extends VBoxContainer

const n_abilities: int = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	const ability_line_template = preload("res://src/character/special-abilities/ability_line.tscn");
	
	for n in range(n_abilities):
		var new_ability = ability_line_template.instantiate();
		new_ability.database = "special-abilities";
		self.add_child(new_ability);
		
		var new_separator = HSeparator.new();
		self.add_child(new_separator);

func save() -> Dictionary:
	var save_dict = {
		"Abilities" = []
	};
	for child in self.get_children():
		if child is AbilityLine:
			save_dict["Abilities"].append(child.save())
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	var children = self.get_children();
	var incr = 0;
	for child in children:
		if child is AbilityLine:
			child.load_sheet(sheet_dict["Abilities"][incr]);
			incr += 1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
