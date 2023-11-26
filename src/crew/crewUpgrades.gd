extends VBoxContainer

const n_single_upgrades: int = 8;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(n_single_upgrades):
		var new_line = HBoxContainer.new();
		new_line.add_child(CheckBox.new());
		
		var new_lineedit = LineEdit.new();
		new_lineedit.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_line.add_child(new_lineedit);
		self.add_child(new_line);
	var new_line = HBoxContainer.new();
	for i in range(3):
		new_line.add_child(CheckBox.new());
	var new_lineedit = LineEdit.new();
	new_lineedit.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
	new_line.add_child(new_lineedit);
	self.add_child(new_line);

func save() -> Dictionary:
	var save_dict = {"Crew Upgrades": []};
	var children = self.get_children();
	for i in range(children.size()):
		save_dict["Crew Upgrades"].append(
			{
				"Upgrade": children[i].get_child(-1).text,
				"Proficient": children[i].get_child(0).button_pressed
			}
		)
	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	var children = self.get_children();
	for i in range(n_single_upgrades):
		children[i].get_child(0).button_pressed = sheet_dict["Crew"]["Crew Upgrades"][i]["Proficient"];
		children[i].get_child(-1).text = sheet_dict["Crew"]["Crew Upgrades"][i]["Upgrade"]
		
	for i in range(3):
		children[-1].get_child(i).button_pressed = sheet_dict["Crew"]["Crew Upgrades"][-1]["Proficient"];
	children[-1].get_child(-1).text = sheet_dict["Crew"]["Crew Upgrades"][-1]["Upgrade"]

