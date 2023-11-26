extends Node

# Autoloaded things are preserved between scenes
var json_dicts : Dictionary = {}

func _ready() -> void:
	load_databases()

	
func load_databases() -> void:
	Utilities.load_jsons_from_dir("res://data/jsons", json_dicts)
		
func parse_table(table_dict : Dictionary, depth : int = 0) -> String:
	var out_str = ""
	const tab_str = "\t\t\t\t"
	
	if table_dict.is_empty():
		return ""
	
	# Print header
	for col in table_dict:
		for _i in range(depth):
			out_str += "\t"
		out_str += col + tab_str
	out_str += "\n"
	
	# Print separator
	for _i in range(len(out_str)):
		out_str += "-"
	out_str += "\n";
	
	# Print table contents
	for row in range(table_dict[table_dict.keys()[0]].size()):
		for col in table_dict:
			for _i in range(depth):
				out_str += "\t"
			out_str += str(table_dict[col][row]) + tab_str
		out_str += "\n"
			
	return out_str

func parse_list(list_in : Array, depth : int = 0) -> String:
	var str_out = ""
	for item in list_in:
		if item is String:
			for _idx in range(depth):
				str_out += "\t"
			str_out += "%s\n" % item
		if item is Dictionary:
			str_out += parse_table(item)
		if item is Array:
			str_out += parse_list(item, depth + 1)
			
	# Enforce a maximum line length:
	const MAX_STR_LEN = 150
	var every_line  = str_out.split("\n")
	str_out = ""
	for line in every_line:				
		var every_word = line.split(" ")
		var lines = []
		var cur_line = ""
		for word in every_word:
			cur_line += word + " " 
			if len(cur_line) > MAX_STR_LEN:
				lines.append(cur_line)
				cur_line = ""
		lines.append(cur_line)
		str_out += "\n".join(lines)
		str_out += "\n" #Add a new line before going to the next line in every_line
	
	return str_out

func calc_col_width(col_name: String, column: Array) -> int:
	var max_len: int = 0
	for item in column:
		if len(item) > max_len:
			max_len = len(item) + 1 # for the final space
	if len(col_name) > max_len:
		max_len = len(col_name)
	
	return max_len
	
