extends HBoxContainer


func save() -> Dictionary:
	var save_dict = {
		"Crew Type": $class.text,
		"Crew Description": $description.text
	};
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	$class.text = sheet_dict["Crew"]["Crew Type"];
	$description.text = sheet_dict["Crew"]["Crew Description"];
	
