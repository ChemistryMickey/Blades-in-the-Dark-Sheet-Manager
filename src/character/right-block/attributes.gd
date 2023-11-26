extends VBoxContainer

func save() -> Dictionary:
	var save_dict = {"Attributes": {}};
	var attributes = DatabaseLoader.json_dicts["attributes"].keys();
	for attr in attributes:
		save_dict["Attributes"][attr] = {
			"Exp": get_node("{attr}/header/SpinBox".format({"attr": attr})).value,
			"Skills": get_skill_levels(attr)
		};
	
	return save_dict;

func get_skill_levels(attr: String) -> Dictionary:
	var skills = DatabaseLoader.json_dicts["attributes"][attr].keys();
	var out_dict = {};
	for i in range(skills.size()):
		out_dict[skills[i]] = 0;
		for n in range(4):
			if get_node("{attr}/skills/rank{n}/CheckBox{i}".format({"attr": attr, "n": n + 1, "i": i + 1})).button_pressed:
				out_dict[skills[i]] = n + 1;
	return out_dict;
	
func set_skill_levels(skill_dict: Dictionary, attr: String) -> void:
	var skills = DatabaseLoader.json_dicts["attributes"][attr].keys();
	for i in range(skills.size()):
		for n in range(skill_dict[skills[i]]):
			get_node("{attr}/skills/rank{n}/CheckBox{i}".format({"attr": attr, "n": n + 1, "i": i + 1})).button_pressed = true;

func load_sheet(sheet_dict: Dictionary) -> void:
	# Clear checkboxes
	Utilities.clear_checkboxes_recursive(self);
	
	# Actually load up
	var attributes = DatabaseLoader.json_dicts["attributes"].keys();
	for attr in attributes:
		get_node("{attr}/header/SpinBox".format({"attr": attr})).value = sheet_dict["Attributes"][attr]["Exp"];
		set_skill_levels(sheet_dict["Attributes"][attr]["Skills"], attr);
		
	
