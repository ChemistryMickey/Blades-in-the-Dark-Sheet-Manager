extends VBoxContainer

func save() -> Dictionary:
	return {
		"Lair": {
			"Upgrades": {
				"Carriage": $a/lair/carriage/CheckBox.button_pressed,
				"Boat": $a/lair/boat/CheckBox.button_pressed,
				"Hidden": $a/lair/hidden/CheckBox.button_pressed,
				"Quarters": $a/lair/quarters/CheckBox.button_pressed,
				"Secure": $a/lair/secure/CheckBox.button_pressed,
				"Vault": $a/lair/vault/CheckBox.button_pressed,
				"Workshop": $a/lair/workshop/CheckBox.button_pressed
			},
			"Quality": {
				"Documents": $a/quality/documents/CheckBox.button_pressed,
				"Gear": $a/quality/gear/CheckBox.button_pressed,
				"Implements": $a/quality/implements/CheckBox.button_pressed,
				"Pet/Special": $a/quality/petSpecial/CheckBox.button_pressed,
				"Supplies": $a/quality/supplies/CheckBox.button_pressed,
				"Tools": $a/quality/tools/CheckBox.button_pressed,
				"Weapons": $a/quality/weapons/CheckBox.button_pressed
			},
			"Training": {
				"Insight": $b/training/insight/CheckBox.button_pressed,
				"Prowess": $b/training/prowess/CheckBox.button_pressed,
				"Resolve": $b/training/resolve/CheckBox.button_pressed,
				"Playbook": $b/training/playbook/CheckBox.button_pressed,
				"Mastery": $b/training/mastery/CheckBox.button_pressed
			}
		}		
	};
	
func load_sheet(sheet_dict: Dictionary) -> void:
	# This one is painful. I'm sorry if there was a more clever way to do this.
	
	$a/lair/carriage/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Carriage"]
	$a/lair/carriage/CheckBox2.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Carriage"]
	$a/lair/boat/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Boat"]
	$a/lair/boat/CheckBox2.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Boat"]
	$a/lair/hidden/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Hidden"]
	$a/lair/quarters/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Quarters"]
	$a/lair/secure/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Secure"]
	$a/lair/secure/CheckBox2.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Secure"]
	$a/lair/vault/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Vault"]
	$a/lair/vault/CheckBox2.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Vault"]
	$a/lair/workshop/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Upgrades"]["Workshop"]
	
	$a/quality/documents/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Documents"]
	$a/quality/gear/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Gear"]
	$a/quality/implements/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Implements"]
	$a/quality/petSpecial/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Pet/Special"]
	$a/quality/supplies/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Supplies"]
	$a/quality/tools/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Tools"]
	$a/quality/weapons/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Quality"]["Weapons"]

	$b/training/insight/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Insight"]
	$b/training/prowess/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Prowess"]
	$b/training/resolve/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Resolve"]
	$b/training/playbook/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Playbook"]
	$b/training/mastery/CheckBox.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Mastery"]
	$b/training/mastery/CheckBox2.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Mastery"]
	$b/training/mastery/CheckBox3.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Mastery"]
	$b/training/mastery/CheckBox4.button_pressed = sheet_dict["Crew"]["Lair"]["Training"]["Mastery"]

