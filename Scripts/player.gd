extends CharacterBody2D


@export var speed: float = 300.0
@onready var animation = $Animationmpla			#before even the ready funxtion execute, we define var 
												#animation_handle shows the path to the animationPlayer Node
												#Now we can tweak its properties from this script

#var gravity:float = 600.0	#for a platformer game to add gravity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _physics_process(_delta: float) -> void:
	
	#Two different ways of setting a Vector2 to zero
	#var direction:Vector2 = Vector2.ZERO
	var direction: Vector2 = Vector2(0, 0)
	
	
	#First way of direction with no normalization
	#Set the direction based on the input. The function normalize the Vector on its own
	#and returns a vector2 
	#direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	#Second way, normalize "manually"
	#We get the the dirrection of each axis indepentantly and we combine them
	direction.x = Input.get_axis("Left", "Right")
	direction.y = Input.get_axis("Up", "Down")
	
	direction = direction.normalized()
	
	
	handle_aniamtion(direction)
	
	
	#Definition: Velocity is the speed of an entity in a given direction
	#That mean the velocity equals speed * direction
	velocity = direction * speed
	#explanation of delta time
	#https://kidscancode.org/godot_recipes/4.x/basics/understanding_delta/index.html
	
	
	#to add gravity on a platformer
	#velocity.y += gravity
	
	
	#A function used in _physics_proccces func, to apply the physics that we coded inside the func
	#Neccesery always use it in the end of the physics function
	move_and_slide()


#Handiling the animation
#If moving to the right play "Right" animation
#Else if moving to the left play "Left" animation 
func handle_aniamtion(direction: Vector2):
	if direction.x > 0:
		animation.play("Right")
	elif direction.x < 0:
		animation.play("Left")

#function that executes when the signal emits
#look at the chest.gd script
func _on_chest_push_player() -> void:
	print("push")
	global_position.y += 100
