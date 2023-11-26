extends GridContainer

const n_claims: int = 14;

func save() -> Dictionary:
	var save_dict = {"Claims": []};
	for child in self.get_children():
		if "claim" in child.name:
			save_dict["Claims"].append(child.get_child(0).save());
	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	for i in range(n_claims):
		get_node("claim%d/claimInfo" % [i + 1]).load_sheet(sheet_dict["Crew"]["Claims"][i])
	
