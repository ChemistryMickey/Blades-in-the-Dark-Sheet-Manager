extends HBoxContainer


func save():
	var save_dict = {"Stress" : $"stress/stress-val".value, "Trauma": $"trauma/trauma-val".value}
	
	return save_dict

func load_sheet(sheet_dict):
	$"stress/stress-val".value = sheet_dict["Stress"];
	$"trauma/trauma-val".value = sheet_dict["Trauma"];
