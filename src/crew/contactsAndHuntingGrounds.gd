extends HBoxContainer

const n_rows = 12;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(n_rows):
		var new_contact_line = LineEdit.new();
		new_contact_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_contact_line.placeholder_text = "Contact Placeholder"
		$VBoxContainer/contactsList.add_child(new_contact_line);
		
		var new_hunting_grounds_line = LineEdit.new();
		new_hunting_grounds_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_hunting_grounds_line.placeholder_text = "Hunting Ground Placeholder"
		$VBoxContainer2/huntingGroundsList.add_child(new_hunting_grounds_line);

func save() -> Dictionary:
	var save_dict = {
		"Contacts": [],
		"Hunting Grounds": []
	}
	for contact in $VBoxContainer/contactsList.get_children():
		if contact is LineEdit:
			save_dict["Contacts"].append(contact.text);
	for hunting_ground in $VBoxContainer2/huntingGroundsList.get_children():
		if hunting_ground is LineEdit:
			save_dict["Hunting Grounds"].append(hunting_ground.text);
	
	return save_dict;

func load_sheet(sheet_dict: Dictionary) -> void:
	for child in $VBoxContainer/contactsList.get_children():
		child.queue_free();
	for child in $VBoxContainer2/huntingGroundsList.get_children():
		child.queue_free();
		
	for i in range(n_rows):
		var new_contact_line = LineEdit.new();
		new_contact_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_contact_line.placeholder_text = "Contact Placeholder"
		new_contact_line.text = sheet_dict["Crew"]["Contacts"][i];
		$VBoxContainer/contactsList.add_child(new_contact_line);
		
		var new_hunting_grounds_line = LineEdit.new();
		new_hunting_grounds_line.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
		new_hunting_grounds_line.placeholder_text = "Hunting Ground Placeholder"
		new_hunting_grounds_line.text = sheet_dict["Crew"]["Hunting Grounds"][i];
		$VBoxContainer2/huntingGroundsList.add_child(new_hunting_grounds_line);

