extends Control

signal score_change (score)

export (int) var SCORE = 0

func _ready():
	var player = get_parent().get_node("Player")
	player.connect("hp_changed", self, "_hp_changed")
	emit_signal("score_change", SCORE)
	
func _hp_changed(hp):
	var hp_label = get_node("HP/HP_Label")
	hp_label.text = str(hp)

func _on_score_change(plus):
	var score_label = get_node("Score/Score_Label")
	SCORE += plus
	score_label.text = str(SCORE)
