{
    "cwlVersion": "v1.0",
    "class": "Workflow",
    "inputs": {
        "image-s2": "File[]"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "NDVIMultiSensor/output"
        }
    },
    "steps": {
        "NDVIMultiSensor": {
            "run": "GeomatysNDVIMultiSensor.cwl",
            "in": {
                "files": "image-s2"
            },
            "out": ["output"]
        }
    }
}