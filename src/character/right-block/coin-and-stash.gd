extends HBoxContainer

func save() -> Dictionary:
	var save_dict = {
		"Coin": 0,
		"Stash": 0
	};
	
	for child in $coin/VBoxContainer.get_children():
		if child is CheckBox:
			if child.button_pressed:
				save_dict["Coin"] += 1;
	for child in $stash/GridContainer.get_children():
		if child is CheckBox:
			if child.button_pressed:
				save_dict["Stash"] += 1;
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	Utilities.clear_checkboxes_recursive(self);
	
	var coin_buttons = $coin/VBoxContainer.get_children();
	var stash_buttons = $stash/GridContainer.get_children();
	
	for i in range(sheet_dict["Coin"]):
		coin_buttons[i].button_pressed = true;
	for i in range(sheet_dict["Stash"]):
		stash_buttons[i].button_pressed = true;

