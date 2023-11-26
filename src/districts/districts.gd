extends ScrollContainer

@export var png_dir_path: String = "";

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = DirAccess.open(png_dir_path).get_files();
	if dir:
		for cur_file in dir:
			if not cur_file.ends_with(".png"):
				continue;
			var new_rect = TextureRect.new()
						
			new_rect.texture = load("{dir}/{img}".format({"dir": png_dir_path, "img": cur_file}));
			new_rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL;
			$VBoxContainer.add_child(new_rect);

