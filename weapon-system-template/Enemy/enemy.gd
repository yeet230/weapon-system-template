class_name EnemyBase extends CharacterBody3D

@onready var label_3d: Label3D = $Label3D

const ENEMY_TEST = preload("uid://bsgxdepivb8el")

var health = 100.0

func _ready() -> void:
	_update_health_display()

func _physics_process(delta: float) -> void:
	if not is_on_floor(): # Apply gravity.
		velocity += get_gravity() * delta
	
	move_and_slide()

func take_damage(dmg : float) -> void:
	health -= dmg
	
	if health <= 0:
		var enemy = ENEMY_TEST.instantiate()
		get_parent().add_child(enemy)
		enemy.global_position = self.global_position
		self.queue_free()
	_update_health_display()

func _update_health_display() -> void:
	label_3d.text = str("Health: ", "%0.2f" % health)
