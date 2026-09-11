extends Node2D

# Reference global inventory (e.g., an Autoload singleton)
var has_key: bool = false

@onready var key_sprite = $KeySprite
@onready var door_area = $DoorArea

func _on_key_clicked():
	has_key = true
	key_sprite.hide()
	print("Picked up Rusty Key!")

func _on_door_clicked():
	if has_key:
		print("Door unlocked!")
		# Change to the next room scene
		get_tree().change_scene_to_file("res://Scenes/Room2.tscn")
	else:
		print("The door is locked tight...")
