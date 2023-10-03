extends Sprite2D


signal gacha

var gachaSystem = Gachasystem.new();
var rng = RandomNumberGenerator.new()

func _ready():
	var my_random_number = rng.randf_range(-10.0, 10.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	gacha.emit()

#found in Sprite2D
func _on_gacha():
	var result = gachaSystem.Roll(); #wtf
	print("You obtained %s" %[result] );
