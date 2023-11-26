extends VBoxContainer


func save() -> Dictionary:
	var save_dict = {
		"Load": {
			"Light": $HBoxContainer/light/CheckBox.button_pressed,
			"Normal": $HBoxContainer/normal/CheckBox.button_pressed,
			"Heavy": $HBoxContainer/heavy/CheckBox.button_pressed
		}
	};
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	Utilities.clear_checkboxes_recursive(self);
	
	$HBoxContainer/light/CheckBox.button_pressed = sheet_dict["Load"]["Light"]
	$HBoxContainer/normal/CheckBox.button_pressed = sheet_dict["Load"]["Normal"]
	$HBoxContainer/heavy/CheckBox.button_pressed = sheet_dict["Load"]["Heavy"]
	
