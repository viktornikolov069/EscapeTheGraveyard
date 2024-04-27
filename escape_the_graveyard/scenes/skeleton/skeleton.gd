extends CharacterBody2D

#signal on_plane_died

const POWER: float = -1000.0
const GRAVITY: float = 2000.0
@onready var sprite: AnimatedSprite2D = $Sprite
var jump_count: int = 1
#@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta * jump_count
	#print("_physics_process")
	jump()
	
	move_and_slide()
	
	if is_on_floor():
		jump_count = 1
		
func jump() -> void: 
	if Input.is_action_just_pressed("jump"):
		velocity.y = POWER
		jump_count+=1
		
		#animation_player.play("jump")
	
func die() -> void:
	sprite.stop()
	set_physics_process(false)
	SignalManager.on_skeleton_died.emit()
	#engine_sound.stop()
	#SignalManager.on_plane_died.emit()
	
