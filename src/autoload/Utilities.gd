extends Node

var num_inventory_entries = 0

func clear_checkboxes_recursive(node, cur_depth: int = 0, max_depth: int = 10) -> void:
#	print("Running for {node} with cur_depth {cur_depth}".format({"node": node, "cur_depth": cur_depth}))
	if node is CheckBox:
		node.button_pressed = false;
		return; # assume that checkboxes don't have children. That'd be weird.
	if node.get_child_count() != 0 and not cur_depth >= max_depth:
		for child in node.get_children():
			clear_checkboxes_recursive(child, cur_depth + 1);
	return;

func find_in_dictionary(dict: Dictionary, term):
	if dict is Dictionary:
		if not dict.has(term):
			for item in dict:
				var output = find_in_dictionary(dict[item], term)
				if output is Dictionary:
					if not output.is_empty():
						return output

		else:
			return dict[term]
	else:
		return {}

func load_jsons_from_dir(path: String, dict: Dictionary) -> void:
	var json_raw_strs = []
	var filenames = []
	var dir = DirAccess.open(path).get_files()
	if dir:
		for cur_file in dir:
			var contents = FileAccess.open("%s/%s" % [path, cur_file], FileAccess.READ).get_as_text()
			json_raw_strs.append(contents)
			filenames.append(cur_file.split('.')[0])

	for idx in range(filenames.size()):
		var test_json_conv: Dictionary = JSON.parse_string(json_raw_strs[idx])
		dict[filenames[idx]] = recursive_dict_sort(test_json_conv)
		
func recursive_dict_merge(dict1: Dictionary, dict2: Dictionary) -> Dictionary:
	var merged_dict = {}
	for key in dict1.keys():
		# Make simple copy of dict1
		merged_dict.merge({key: dict1[key]}) 
		
	for key in dict2.keys():
		if dict2[key] is Dictionary and merged_dict.has(key):
			merged_dict[key].merge(recursive_dict_merge(merged_dict[key], dict2[key]))
		elif dict2[key] is Array and merged_dict.has(key):
			for item in dict2[key]:
				if item not in merged_dict[key]:
					merged_dict[key].append(item)
		else:
			merged_dict[key] = dict2[key]
	return merged_dict
	
func recursive_dict_sort(dict: Dictionary) -> Dictionary:
	var sorted_dict: Dictionary = {};
	var sorted_keys = dict.keys();
	sorted_keys.sort();
	
	for key in sorted_keys:
		if dict[key] is Dictionary:
			sorted_dict[key] = recursive_dict_sort(dict[key]);
		else:
			sorted_dict[key] = dict[key];

	return sorted_dict;

func unique(arr_in : Array) -> Array:
	# Doesn't sort
	var array_out = []
	for item in arr_in:
		if item in array_out:
			continue
		array_out.append(item)
	return array_out
