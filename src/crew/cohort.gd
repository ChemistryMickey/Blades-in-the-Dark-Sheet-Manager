extends VBoxContainer
class_name Cohort_box

func save() -> Dictionary:
	return {
		"Type": $header/LineEdit.text,
		"Weak": $status/weak.button_pressed,
		"Impared": $status/impared.button_pressed,
		"Broken": $status/broken.button_pressed,
		"Armour": $status/armour.button_pressed,
		"Info": $TextEdit.text
	}
	
func load_sheet(cohort_dict: Dictionary) -> void:
	$header/LineEdit.text = cohort_dict["Type"];
	$status/weak.button_pressed = cohort_dict["Weak"];
	$status/impared.button_pressed = cohort_dict["Impared"];
	$status/broken.button_pressed = cohort_dict["Broken"];
	$status/armour.button_pressed = cohort_dict["Armour"];
	$TextEdit.text = cohort_dict["Info"];
