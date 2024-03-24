extends HBoxContainer

func _ready():
	var player = get_parent().get_parent().get_node("Player")
	player.connect("hp_changed", self, "_hp_changed")
	
func _hp_changed(hp):
	var hp_label = get_node("HP_Label")
	hp_label.text = str(hp)
