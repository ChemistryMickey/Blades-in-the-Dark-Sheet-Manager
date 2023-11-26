extends HBoxContainer


func save():
	var save_dict = {
		"Harm Table" : {
			"Grievous": [
				$"harm-table/grievous/LineEdit".text
			], 
			"Major": [
				$"harm-table/major/LineEdit".text,
				$"harm-table/major/LineEdit2".text
			], 
			"Minor": [
				$"harm-table/minor/LineEdit".text,
				$"harm-table/minor/LineEdit2".text
			]
		},
		"Healing": $healing/SpinBox.value,
		"Armour": []
	}

	for cont in $armour/uses.get_children():
		for cont2 in cont.get_children():
			if cont2 is CheckBox:
				save_dict["Armour"].append(cont2.button_pressed);	
	
	return save_dict

func load_sheet(sheet_dict):
	Utilities.clear_checkboxes_recursive(self);
	
	$"harm-table/grievous/LineEdit".text = sheet_dict["Harm Table"]["Grievous"][0];
	$"harm-table/major/LineEdit".text	= sheet_dict["Harm Table"]["Major"][0];
	$"harm-table/major/LineEdit2".text	= sheet_dict["Harm Table"]["Major"][1];
	$"harm-table/minor/LineEdit".text	= sheet_dict["Harm Table"]["Minor"][0];
	$"harm-table/minor/LineEdit2".text	= sheet_dict["Harm Table"]["Minor"][1];
	
	$healing/SpinBox.value = sheet_dict["Healing"];
		
	var armour_children = $armour/uses.get_children();
	for i in range(armour_children.size()):
		for cont in armour_children[i].get_children():
			if cont is CheckBox:
				cont.button_pressed = sheet_dict["Armour"][i];
				
