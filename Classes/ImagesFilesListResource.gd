extends Resource

class_name ImagesFilesListResource

@export var filenames: Array[String]

func add_file(fn: String) -> void:
    if fn.ends_with(".import") == false:
        filenames.append(fn)
