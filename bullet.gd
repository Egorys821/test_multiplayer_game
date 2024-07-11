extends CharacterBody2D


const SPEED = 500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction:Vector2
var damage =10  
func _ready():
	direction = Vector2(1,0).rotated(rotation)

func _physics_process(delta):
	# Add the gravity.
	velocity = SPEED * direction
	if not is_on_floor():
		velocity.y +=gravity *1 * delta

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if GameManager.Players.has(str(collision.get_collider().name).to_int()):
			print("hit!")
			hit(str(collision.get_collider().name).to_int())
	
	move_and_slide()
	

func hit(id):
	GameManager.Players[id].hp -=damage
	self.queue_free()

	
