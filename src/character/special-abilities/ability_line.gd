extends HBoxContainer
class_name AbilityLine

@export var database: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set items of the ability to be the database
	var abilities: Dictionary = DatabaseLoader.json_dicts[database];
	for ind in range(abilities.size()):
		$ability.add_item(abilities.keys()[ind]);
		$ability.set_item_tooltip(ind, abilities.get(abilities.keys()[ind])["Definition"])
	$ability.selected = -1;

func _on_ability_item_selected(index):
	var abilities: Dictionary = DatabaseLoader.json_dicts[database];
	if not abilities.get(abilities.keys()[index])["Definition"].is_empty():
		$desc.text = abilities.get(abilities.keys()[index])["Definition"];
		$desc.text += "\n\n\t[i]Example: {example}[/i]".format({"example": abilities.get(abilities.keys()[index])["Example"]});
	else:
		$desc.text = "";

func save() -> Dictionary:
	var abilities: Dictionary = DatabaseLoader.json_dicts[database];
	var ability_name = "";
	if $ability.selected != -1:
		ability_name = abilities.keys()[$ability.selected];

	return {
		"Proficient": $proficient.button_pressed,
		"Ability Name": ability_name
	}

func load_sheet(ability_entry: Dictionary) -> void:
	var keys: Array = DatabaseLoader.json_dicts[database].keys();
	var selected = keys.find(ability_entry["Ability Name"])
	$proficient.button_pressed = ability_entry["Proficient"];
	$ability.selected = selected;
	_on_ability_item_selected(selected);
