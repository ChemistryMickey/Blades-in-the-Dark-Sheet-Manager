extends Control

@onready var save_dialog = $SaveFile

@export var current_character_path: String = ""

var sheet_dict: Dictionary = {};

func _shortcut_input(event: InputEvent) -> void:
	if event.is_action_pressed("Save"):
		save_current_sheet();

	if event.is_action_pressed("Load"):
		load_sheet();
		
	# FINALLY!!!!! FOUND YOU AT LAST!!!
	self.get_viewport().set_input_as_handled();

func save_current_sheet():
	if current_character_path == "":
		save_dialog.popup_centered()
		await save_dialog.file_selected
		
	var save_filename = current_character_path

	sheet_dict = {} #clear the sheet dict to prevent unintended entry persistence

	var save_game = FileAccess.open(save_filename, FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node has a save function.
		if !node.has_method("save"):
			#print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")
		for key in node_data:
			sheet_dict[key] = node_data[key]

	save_game.store_string(JSON.stringify(sheet_dict, "\t"))
	save_game.close()
	$SaveFlash/AnimationPlayer.play("fade")

func load_sheet(path : String = ""):
	if path == "":
		$LoadFile.popup_centered()
		await $LoadFile.file_selected
	else:
		current_character_path = path
	
	if not FileAccess.file_exists(current_character_path):
		return # Error! We don't have a save to load.
	var save_game = FileAccess.open(current_character_path, FileAccess.READ)

	var conts = save_game.get_as_text()
	save_game.close()
	
	sheet_dict = JSON.parse_string(conts)
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if !node.has_method("load_sheet"):
			#print("persistent node '%s' is missing a load() function, skipped" % node.name)
			continue
			
		node.call("load_sheet", sheet_dict)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_save_file_file_selected(path: String) -> void:
	current_character_path = path;


func _on_load_file_file_selected(path: String) -> void:
	current_character_path = path;
