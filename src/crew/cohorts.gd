extends VBoxContainer

const n_cohorts = 4;
var cohort_template = preload("res://src/crew/cohort.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(n_cohorts):
		var new_cohort = cohort_template.instantiate();
		self.add_child(new_cohort);
		
func save() -> Dictionary:
	var save_dict = {"Cohorts": []};
	for child in self.get_children():
		save_dict["Cohorts"].append(child.save());

	return save_dict;
	
func load_sheet(sheet_dict: Dictionary) -> void:
	var children = self.get_children();
	for i in range(children.size()):
		children[i].load_sheet(sheet_dict["Crew"]["Cohorts"][i]);
