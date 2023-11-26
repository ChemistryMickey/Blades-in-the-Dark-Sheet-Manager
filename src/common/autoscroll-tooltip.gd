extends RichTextLabel

@export var scroll_time_top_to_bottom: float = 10.0; #[s]
@export var n_increments: int = 1000;
@export var scroll_wait_time: float = 2.0; #[s]
@export var MAX_ITERATIONS: int = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_text();


func scroll_text(iter: int = 0) -> void:
	var vscroll = self.get_v_scroll_bar();
	vscroll.ratio = 0;
	
	# Wait scroll_wait_time seconds, then start scrolling
	await get_tree().create_timer(scroll_wait_time).timeout
	
	# Scroll slowly
	var active_wait_time = scroll_time_top_to_bottom / float(n_increments);
	var prev_ratio: float = -INF;
	for i in range(n_increments):
		await get_tree().create_timer(active_wait_time).timeout
		vscroll.ratio = float(i) / float(n_increments);
		if vscroll.ratio == prev_ratio:
			break; # break out early for some reason
			
		prev_ratio = vscroll.ratio;
	
	# When you hit the bottom, wait scroll_wait_time seconds, then scroll back up to top and continue
	await get_tree().create_timer(scroll_wait_time).timeout
	if iter < MAX_ITERATIONS:
		scroll_text(iter + 1);
