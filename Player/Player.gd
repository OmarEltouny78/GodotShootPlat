extends KinematicBody2D

var gravity:=0

var direction:=Vector2.ZERO
onready var bullet=preload('res://Bullet/Bullet.tscn')

var b
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move()
	shoot()
	direction=move_and_slide(direction,Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot():
	if Input.is_action_just_pressed("shoot"):
		b=bullet.instance()
		owner.add_child(b)
		b.transform=$Muzzle.global_transform
func move():
	gravity+=5
	if Input.is_action_pressed("ui_left"):
		direction.x=-500
		$AnimatedSprite.flip_h=true
	elif Input.is_action_pressed("ui_right"):
		direction.x=500
		$AnimatedSprite.flip_h=false
	else:
		direction.x=0
	if Input.is_action_pressed("ui_up") and is_on_floor():
		gravity=-300
	direction.y=gravity
