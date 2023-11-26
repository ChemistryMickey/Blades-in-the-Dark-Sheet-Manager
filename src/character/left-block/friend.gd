extends HBoxContainer
class_name FriendFoe

func save():
	var save_dict = {}
	save_dict["Friend"] = $CheckBox.button_pressed
	save_dict["Foe"] = $CheckBox2.button_pressed
	save_dict["Name"] = $LineEdit.text
	
	return save_dict
	
func load_sheet(save_dict):
	$CheckBox.button_pressed = save_dict["Friend"];
	$CheckBox2.button_pressed = save_dict["Foe"];
	$LineEdit.text = save_dict["Name"];
