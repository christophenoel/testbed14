{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "requirements": {
        "DockerRequirement": {
            "dockerPull": "images.geomatys.com/ndvims:latest"
        }
    },
    "inputs": {
        "files": {
            "inputBinding": {
                "position": 1
            },
            "type": {
                "type": "array",
                "items": "File"
            }
        },
    },
    "outputs": {
        "output": {
            "outputBinding": {
                "glob": "*.tif"
            },
            "type": {
                "type": "array",
                "items": "File"
            }
        }
    }
}