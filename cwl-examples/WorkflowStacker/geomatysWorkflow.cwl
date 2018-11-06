{
    "cwlVersion": "v1.0",
    "class": "Workflow",
    "inputs": {
        "image-s2": "File[]"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "stacker_s2/output"
        }
    },
    "steps": {
        "stacker_s2": {
            "run": "SPBCRIMStacker.cwl",
            "in": {
                "files": "image-s2"
            },
            "out": ["output"]
        }
    }
}