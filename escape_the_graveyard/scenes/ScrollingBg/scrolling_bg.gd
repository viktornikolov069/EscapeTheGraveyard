extends ParallaxBackground




# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_skeleton_died.connect(on_skeleton_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta

func on_skeleton_died():
	set_process(false)
