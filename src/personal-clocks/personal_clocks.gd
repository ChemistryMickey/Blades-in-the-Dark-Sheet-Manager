extends VBoxContainer

var clock_template = preload("res://src/personal-clocks/clock_line.tscn");

func _on_add_pressed():	
	$ScrollContainer/clockContainer.add_child(
		create_new_clock(
			$HBoxContainer/current.value,
			$HBoxContainer/maximum.value,
			$HBoxContainer/description.text
		)
	);
	$HBoxContainer/current.value = 0;
	$HBoxContainer/maximum.value = 0;
	$HBoxContainer/description.text = "";
	
func _on_remove_pressed():
	for child in $ScrollContainer/clockContainer.get_children():
		if child is Personal_clock:
			if child.toggle_for_removal:
				child.queue_free();

func create_new_clock(cur_segs: int, max_segs: int, desc: String) -> Personal_clock:
	var new_clock = clock_template.instantiate();
	new_clock.cur_segments = cur_segs;
	new_clock.max_segments = max_segs;
	new_clock.desc = desc;
	
	return new_clock;

func save() -> Dictionary:
	var save_dict = {"Personal Clocks": []};
	
	for clock_line in $ScrollContainer/clockContainer.get_children():
		if clock_line is Personal_clock:
			save_dict["Personal Clocks"].append(
				{
					"Current Segments": clock_line.cur_segments,
					"Max Segments": clock_line.max_segments,
					"Description": clock_line.desc
				}
			);
	
	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	# Clear
	for child in $ScrollContainer/clockContainer.get_children():
		child.queue_free();
	
	# Load
	for i in sheet_dict["Personal Clocks"]:
		$ScrollContainer/clockContainer.add_child(
			create_new_clock(
				sheet_dict["Personal Clocks"][i]["Current Segments"],
				sheet_dict["Personal Clocks"][i]["Max Segments"],
				sheet_dict["Personal Clocks"][i]["Description"]
			)
		);
