extends TextureRect

export(Color) var border_color

func _ready():
	set_border_color(border_color)


func set_border_color(new):
	$CantoEsq.color = new
	$CantoDir.color = new
	$CantoCima.color = new
	$CantoBaixo.color = new
