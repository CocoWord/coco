extends CharacterBody2D

var gravity := ProjectSettings.get("physics/2d/default_gravity") as float
var speed = 200.0
var moving_mode = false
var direction = 0
@onready var target_position = position
@onready var animation_player: AnimationPlayer = $AnimController/AnimationPlayer




func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("move"):
		moving_mode = !moving_mode
		target_position = position  #检测移动按键是否被按下
	if moving_mode and Input.is_action_just_pressed("start_move"):
		moving_mode = false
		target_position.x = get_global_mouse_position().x     #鼠标按下设定目标地点的x轴位置
	if position.distance_to(target_position) > 2:
		if abs(target_position.x - position.x) > 0:
			direction = (target_position.x - position.x) / abs(target_position.x - position.x)
		else:  direction = 0
		position.x += direction * speed * delta     #移动到鼠标位置
	velocity.y += gravity * delta
	move_and_slide() #重力
