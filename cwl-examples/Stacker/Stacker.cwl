{
    "cwlVersion": "v1.0",
    "class": "CommandLineTool",
    "requirements": {
        "DockerRequirement": {
            "dockerPull": "docker-registry.crim.ca/ogc-public/snap6-stack-creation:v2"
        }
    },
    "inputs": {
        "files": {
            "inputBinding": {
                "position": 1,
                "prefix": "-Pfiles=",
                "separate": false,
                "itemSeparator": ","
            },
            "type": {
                "type": "array",
                "items": "File"
            }
        },
        "output_file_type": {
            "inputBinding": {
                "position": 2,
                "prefix": "-f"
            },
            "type": {
                "type": "enum",
                "symbols": [
                    "GeoTIFF",
                    "NetCDF-CF"
                ]
            }
        },
        "output_name": {
            "inputBinding": {
                "position": 3,
                "prefix": "-t"
            },
            "type": "string"
        }
    },
    "outputs": {
        "output": {
            "outputBinding": {
                "glob": "stack_result.tif"
            },
            "type": "File"
        }
    }
}