extends HBoxContainer

func save() -> Dictionary:
	var save_dict = {"Crew": {}};
	save_dict["Crew"].merge($leftBlock.save());
	save_dict["Crew"].merge($scrollUpgrades/upgrades/lairUpgrades.save());
	save_dict["Crew"].merge($scrollUpgrades/upgrades/cohorts.save());
	save_dict["Crew"].merge($scrollUpgrades/upgrades/crewUpgrades/upgradesList.save());
	save_dict["Crew"].merge($playbook/ScrollContainer/crewAbilities.save());
	save_dict["Crew"].merge($playbook/exp.save());
	save_dict["Crew"].merge($"playbook/class-desc".save());
	save_dict["Crew"].merge($leftBlock/claims.save());
	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	Utilities.clear_checkboxes_recursive(self);
	$leftBlock.load_sheet(sheet_dict);
	$scrollUpgrades/upgrades/lairUpgrades.load_sheet(sheet_dict);
	$scrollUpgrades/upgrades/cohorts.load_sheet(sheet_dict);
	$scrollUpgrades/upgrades/crewUpgrades/upgradesList.load_sheet(sheet_dict);
	$playbook/ScrollContainer/crewAbilities.load_sheet(sheet_dict);
	$playbook/exp.load_sheet(sheet_dict);
	$"playbook/class-desc".load_sheet(sheet_dict);
	$leftBlock/claims.load_sheet(sheet_dict);
