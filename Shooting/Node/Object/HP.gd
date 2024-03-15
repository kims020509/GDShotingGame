extends HBoxContainer

func _ready():
	var player = get_parent().get_parent().get_node("Player")
	player.connect("hp_changed", self, "_hp_changed")
	
func _hp_changed(hp):
	var hp_control = get_node("HP_Control")
	hp_control.play("HP_NOW")
	hp_control.seek(float(hp)/10)
