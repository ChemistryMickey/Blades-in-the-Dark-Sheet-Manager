extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	# Start with abilities
	var ability_list = $"ScrollContainer2/ab-and-attr/special-abilities/ScrollContainer/special-abilities-list";
	var abilities: Dictionary = DatabaseLoader.json_dicts["special-abilities"];
	var ability_keys = abilities.keys();
	for i in range(abilities.size()):
		if abilities[ability_keys[i]]["Definition"].is_empty():
			continue;
			
		ability_list.add_child(make_hbox(abilities, i));
		
		var h_sep = HSeparator.new();
		ability_list.add_child(h_sep);
		
		
	# Now attributes
	var attribute_list = $"ScrollContainer2/ab-and-attr/attributes/ScrollContainer/attributes-list";
	var attributes: Dictionary = DatabaseLoader.json_dicts["attributes"];
	## Make a composite dict
	var comp_attr: Dictionary = {};
	for key in attributes:
		for sub_key in attributes[key]:
			comp_attr[sub_key] = attributes[key][sub_key];
	comp_attr = Utilities.recursive_dict_sort(comp_attr);
	for i in range(comp_attr.size()):
		attribute_list.add_child(make_hbox(comp_attr, i));
		
		var h_sep = HSeparator.new();
		attribute_list.add_child(h_sep);
		
	# Crew Special Abilities
	var crew_special_list = $"ScrollContainer2/ab-and-attr/crewSpecialAbilities/ScrollContainer/crewSpecialAbilitiesList";
	var crew_abilities: Dictionary = DatabaseLoader.json_dicts["crew-special-abilities"];
	var crew_ability_keys = crew_abilities.keys();
	for i in range(crew_abilities.size()):
		if crew_abilities[crew_ability_keys[i]]["Definition"].is_empty():
			continue;
			
		crew_special_list.add_child(make_hbox(crew_abilities, i));
		
		var h_sep = HSeparator.new();
		crew_special_list.add_child(h_sep);
		
	# Crew map locations
	var map_claims_list = $"ScrollContainer2/ab-and-attr/mapClaimTypes/ScrollContainer/mapClaimTypesList";
	var map_claims: Dictionary = DatabaseLoader.json_dicts["map-claim-types"];
	var claim_keys = map_claims.keys();
	for i in range(map_claims.size()):
		if map_claims[claim_keys[i]]["Definition"].is_empty():
			continue;
			
		map_claims_list.add_child(make_hbox(map_claims, i));
		
		var h_sep = HSeparator.new();
		map_claims_list.add_child(h_sep);
		
func make_hbox(dict: Dictionary, i: int) -> HBoxContainer:
	var new_hbox = HBoxContainer.new();
	new_hbox.custom_minimum_size = Vector2(0, 160);
	
	var dict_keys = dict.keys();

	var new_label = Label.new();
	new_label.text = "{attr}: ".format({"attr": dict_keys[i]});
	new_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
	new_label.size_flags_stretch_ratio = 0.25;
	var new_settings = LabelSettings.new();
	new_settings.font_size = 22;
	new_label.label_settings = new_settings;
	new_hbox.add_child(new_label);

	var new_control = Control.new();
	new_control.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
	new_control.size_flags_stretch_ratio = 0.1;
	new_hbox.add_child(new_control);

	var new_edit = RichTextLabel.new();
	new_edit.bbcode_enabled = true;
	new_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL;
	new_edit.text = dict[dict_keys[i]]["Definition"];
	new_edit.text += "\n\n\t[i]Example: {example}[/i]".format({"example": dict[dict_keys[i]]["Example"]});
	new_hbox.add_child(new_edit);
	
	return new_hbox;
