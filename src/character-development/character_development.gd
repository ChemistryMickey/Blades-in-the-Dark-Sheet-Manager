extends HBoxContainer


func save() -> Dictionary:
	return {
		"Backstory": $VBoxContainer/backstory.text,
		"Friends and Family": $"VBoxContainer2/friends-and-family".text
	};
	
func load_sheet(sheet_dict: Dictionary) -> void:
	$"VBoxContainer2/friends-and-family".text = sheet_dict["Friends and Family"];
	$VBoxContainer/backstory.text = sheet_dict["Backstory"];
