extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	# Add blanks (2 checkboxes, one lineedit)
	const n_blanks = 6;
	for blank in range(n_blanks):
		var new_hcontainer = HBoxContainer.new();
		for n in range(2):
			var new_checkbox = CheckBox.new();
			new_hcontainer.add_child(new_checkbox);
		var new_lineedit = LineEdit.new();
		new_lineedit.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_hcontainer.add_child(new_lineedit);
		self.add_child(new_hcontainer);
		
	# Iterate through equipment.json
	var equipment: Dictionary = DatabaseLoader.json_dicts["equipment"];
	for key in equipment:
		var new_hcontainer = HBoxContainer.new();
		## For each item in equipment.json, add number of checkboxes equal to the value
		for n in range(equipment.get(key)):
			var new_checkbox = CheckBox.new();
			new_hcontainer.add_child(new_checkbox);
						
		## Add control with full expand
		var new_control = Control.new()
		new_control.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_hcontainer.add_child(new_control);
		
		## Add label with text that's the dictionary key
		var new_label = Label.new();
		new_label.text = key;
		new_hcontainer.add_child(new_label);
		
		self.add_child(new_hcontainer);
	
func save() -> Dictionary:
	var save_dict = {
		"Equipment" = []
	};
	for child in self.get_children():
		var num_checked = 0;
		for subchild in child.get_children():
			if subchild is CheckBox:
				if subchild.button_pressed:
					num_checked += 1;
			if subchild is LineEdit or subchild is Label:
				# Line edits and labels are always after the check boxes so num_checked is accurate
				save_dict["Equipment"].append( {"Item": subchild.text, "Quantity Checked": num_checked} );
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	Utilities.clear_checkboxes_recursive(self);
	
	var children = self.get_children();
	
	for i in range(children.size()):
		var sub_children = children[i].get_children();
		for j in range(sub_children.size()):
			if sub_children[j] is CheckBox and sheet_dict["Equipment"][i]["Quantity Checked"] > j:
				sub_children[j].button_pressed = true;
			if sub_children[j] is LineEdit:
				sub_children[j].text = sheet_dict["Equipment"][i]["Item"];
