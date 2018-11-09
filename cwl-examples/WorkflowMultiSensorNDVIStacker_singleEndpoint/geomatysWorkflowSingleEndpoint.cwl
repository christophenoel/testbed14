{
    "cwlVersion": "v1.0",
    "class": "Workflow",
    "inputs": {
        "image-s2": "File[]"
    },
    "outputs": {
        "classout": {
            "type": "File",
            "outputSource": "Stacker/output"
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
    },
{
        "Stacker": {
            "run": "SPBCRIMStacker.cwl",
            "in": {
                "files": "NDVIMultiSensor/output"
            },
            "out": ["output"]
        }
    }
}