extends VBoxContainer

func save() -> Dictionary:
	var save_dict = {
		"Name": $info/name.text,
		"Reputation": $info/reputation.text,
		"Lair Name": $lairName.text,
		"Turf Rep": $claimsStats/rep.value,
		"Turf Values": $claimsStats/turf.value,
		"Control Strengths": {
			"Weak": $claimsStats/HBoxContainer/weak.button_pressed,
			"Strong": $claimsStats/HBoxContainer/strong.button_pressed
		},
		"Turf Tier": $claimsStats/tier.value
	}
	
	save_dict.merge($heatAndCoin.save());
	save_dict.merge($ScrollContainer/contactsAndHuntingGrounds.save());
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	$info/name.text = sheet_dict["Crew"]["Name"];
	$info/reputation.text = sheet_dict["Crew"]["Reputation"];
	$lairName.text = sheet_dict["Crew"]["Lair Name"];
	$claimsStats/rep.value = sheet_dict["Crew"]["Turf Rep"];
	$claimsStats/turf.value = sheet_dict["Crew"]["Turf Values"];
	$claimsStats/HBoxContainer/weak.button_pressed = sheet_dict["Crew"]["Control Strengths"]["Weak"];
	$claimsStats/HBoxContainer/strong.button_pressed = sheet_dict["Crew"]["Control Strengths"]["Strong"];
	$claimsStats/tier.value = sheet_dict["Crew"]["Turf Tier"];
	
	$heatAndCoin.load_sheet(sheet_dict);
	$ScrollContainer/contactsAndHuntingGrounds.load_sheet(sheet_dict);
	
