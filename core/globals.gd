extends Node

var points := 0
var lives := 3

func changed_points(diff: int):
	points += diff
	Events.changed_points.emit(points)
	
func lives_changed(diff: int):
	lives += diff
	Events.lives_changed.emit(lives)
