extends HBoxContainer

func save() -> Dictionary:
	var save_dict = {
		"Scratch": $TextEdit.text
	};
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	$TextEdit.text = sheet_dict["Scratch"];

	
