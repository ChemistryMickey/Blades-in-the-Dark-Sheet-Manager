extends HBoxContainer

func save() -> Dictionary:
	var save_dict = {
		"Heat": $heatAndWanted/heat.value,
		"Wanted": $heatAndWanted/wanted.value,
		"Coin": 0,
		"Vault": 0
		};
	
	for child in $HBoxContainer/VBoxContainer/coinBoxes.get_children():
		if child is CheckBox:
			save_dict["Coin"] += int(child.button_pressed);
	for child in $HBoxContainer/VBoxContainer2/vaultBoxes.get_children():
		if child is CheckBox:
			save_dict["Vault"] += int(child.button_pressed);
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	Utilities.clear_checkboxes_recursive(self)
	$heatAndWanted/heat.value = sheet_dict["Crew"]["Heat"];
	$heatAndWanted/wanted.value = sheet_dict["Crew"]["Wanted"];
	
	for i in range(sheet_dict["Crew"]["Coin"]):
		get_node("$HBoxContainer/VBoxContainer/coinBoxes/CheckBox%d" % [i + 1]).button_pressed = true;
	for i in range(sheet_dict["Crew"]["Wanted"]):
		get_node("$HBoxContainer/VBoxContainer2/vaultBoxes/CheckBox%d" % [i + 1]).button_pressed = true;
