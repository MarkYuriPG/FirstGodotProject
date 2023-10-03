extends Node2D
class_name Gachasystem

var random = RandomNumberGenerator.new()
#character dictionary
var characterProbabilities = {
		"Chris":0.6,
		"Patricia":0.6,
		"Leah":0.3, 
		"Cherry":0.1
} 

func _init():
	name = "GachaSystem";

func AddItem(itemName, probability):
	characterProbabilities[itemName] = probability;

func Roll():
	var totalProbability = 0.0;
	
	for probability in characterProbabilities:
		totalProbability += characterProbabilities[probability];
		
	var randomValue = random.randf_range(0,1) * totalProbability
	var cumulativeProbability = 0;
	
	for kvp in characterProbabilities:
		cumulativeProbability += characterProbabilities[kvp];
		
		if randomValue < cumulativeProbability:
			return kvp;
		
	return "no item";
	
