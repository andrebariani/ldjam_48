extends Control


var text_n = 0
var textos = []
var next_anim = ""

signal done

# APPLIED -----------------------
func text(texts):
	visible = true
	textos = texts
	text_n = 0
	advance_text()

# BUILDING BLOCKS ------------------------
func advance_text():
	if text_n < textos.size():
		$Texto.text = textos[text_n]
		text_n += 1
		if $Texto.text.length() >= 100: 
			$AnimationPlayer.play("TextoLento")
		else:
			$AnimationPlayer.play("Texto")
	else:
		emit_signal("done")

func _on_AnimationPlayer_animation_finished(anim_name):
	advance_text()
