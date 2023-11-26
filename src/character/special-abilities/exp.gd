extends HBoxContainer

func save() -> Dictionary:
	var save_dict = {
		"Playbook Exp": $SpinBox.value
	};
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	$SpinBox.value = sheet_dict["Crew"]["Playbook Exp"]
