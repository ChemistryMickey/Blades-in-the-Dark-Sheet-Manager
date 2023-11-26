extends VBoxContainer

@onready var database = DatabaseLoader.json_dicts["map-claim-types"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0;
	var keys = database.keys();
	for type in database:
		$OptionButton.add_item(type, i);
		$OptionButton.set_item_tooltip(i, database[keys[i]]["Definition"])
		i += 1;

func _on_option_button_item_selected(index):
	var keys = database.keys();
	$OptionButton/RichTextLabel.text = keys[index];
	$OptionButton.tooltip_text = database[keys[index]]["Definition"];

func save() -> Dictionary:
	var keys = database.keys();
	return {
		"Ability Name": keys[$OptionButton.selected],
		"Proficient": $CheckBox.button_pressed
	}

func load_sheet(ability_dict: Dictionary) -> void:
	var keys = database.keys();
	$OptionButton.selected = keys.find(ability_dict["Ability Name"]);
	$CheckBox.button_pressed = ability_dict["Proficient"]

