extends VBoxContainer


func save():
	var save_dict = {}
	save_dict["Name"] = $b1/name.text;
	save_dict["Alias"] = $b1/alias.text;
	save_dict["Looks"] = $looks.text;
	save_dict["Heritage"] = $b2/heritage.text;
	save_dict["Background"] = $b2/background.text;
	save_dict["Vice"] = $vice.text;
	
	return save_dict

func load_sheet(sheet_dict):
	$b1/name.text = sheet_dict["Name"];
	$b1/alias.text = sheet_dict["Alias"];
	$looks.text = sheet_dict["Looks"];
	$b2/heritage.text = sheet_dict["Heritage"];
	$b2/background.text = sheet_dict["Background"];
	$vice.text = sheet_dict["Vice"];
