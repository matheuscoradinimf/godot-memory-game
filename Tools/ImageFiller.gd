@tool
extends EditorScript

const IMAGES_PATH: String = "res://Assets/glitch/"
const RESOURCE_PATH: String = "res://Resources/image_files_list.tres"

func _run() -> void:
	var dir: DirAccess = DirAccess.open(IMAGES_PATH)
	var ifl: ImagesFilesListResource = ImagesFilesListResource.new()

	if dir:
		var files: PackedStringArray = dir.get_files()
		for fn in files:
			ifl.add_file(IMAGES_PATH + fn)
	ResourceSaver.save(ifl, RESOURCE_PATH)
