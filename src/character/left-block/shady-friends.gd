extends VBoxContainer

var friendfoe_template = preload("res://src/character/left-block/friend.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	const n_friendfoe = 10;
	
	for i in range(n_friendfoe):
		var new_friendfoe = friendfoe_template.instantiate();
		self.add_child(new_friendfoe);

func save():
	var save_dict = {"Friends and Foes" : []}
	for child in self.get_children():
		if child is FriendFoe:
			save_dict["Friends and Foes"].append( child.save() )
	
	return save_dict

func load_sheet(sheet_dict):
	for child in self.get_children():
		child.queue_free() #remove all children
	
	for friendfoe in sheet_dict["Friends and Foes"]:
		var new_friendfoe = friendfoe_template.instantiate()
		new_friendfoe.load_sheet(friendfoe)
		self.add_child(new_friendfoe)

