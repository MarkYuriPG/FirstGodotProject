extends Node2D
class_name Gachasystem

var random = RandomNumberGenerator.new()
#character dictionary
var characterProbabilities = {
		"Common sword": 0.6,
		"Common bow": 0.6,
		"Common shield": 0.6,
		"Common scepter": 0.6,
		"Chris":0.3,
		"Patricia":0.3,
		"Leah":0.3, 
		"Cherry":0.07
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
	
