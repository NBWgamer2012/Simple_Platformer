extends Node
var px :float = 0
var py :float = 0
var cur_checkpoint :Vector2i = Vector2i(0, 0)
var doublejump_collected :int = 0
var menupage :int = 1
var cur_stage :String
var interaction :bool = false
var error :Array = []
var level_number :int
var current_music_text :String












var cur_stage_start_positions :Array = [
	["debugstage", -127, -18, "28. Chroma Tundra.ogg"],
	["tutorial", 4702 ,-11, "70. Lava Bubble (Beta).ogg"]
]
