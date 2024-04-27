extends Node2D

@export var gravestone_scene: PackedScene
#@export var diamond_scene: PackedScene

@onready var gravestone_holder = $GraveStoneHolder
@onready var gravestone_spawn_timer = $GraveStoneSpawnTimer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_skeleton_died.connect(_on_skeleton_died)
	#ScoreManager.set_score(0)
	spawn_gravestone()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):  
	pass
	
func spawn_gravestone() -> void:
	var new_gravestone = gravestone_scene.instantiate()
	
	new_gravestone.position = Vector2(680, 205)
	gravestone_holder.add_child(new_gravestone)
	
		
func stop_gravestones() -> void:
	gravestone_spawn_timer.stop()
	for gravestone in gravestone_holder.get_children():
		gravestone.set_process(false)
	   
func _on_gravestone_spawn_timer_timeout():
	spawn_gravestone()
	
func _on_skeleton_died():
	stop_gravestones()
