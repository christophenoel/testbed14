class: Workflow
cwlVersion: v1.0
id: multisensor_ndvi_stack_generator
doc: This is a mockup of the MultiSensorNDVIStackGenerator.
label: MultiSensor-NDVI-Stack-Generator
requirements:
  - class: MultipleInputFeatureRequirement
inputs:
  - id: access-token
    type: string
  - id: image-s2
    type: File
  - id: image-probav
    type: File
  - id: image-urthecast
    type: File
outputs:
  - id: image
    outputSource:
      - ndvi-stacker-pfc/img-out
    type: File
steps:
  - id: multisensor-ndvi-ipt
    label: MultiSensorNDVI-IPT
    in:
      - id: access-token
        source: access-token
      - id: image
        source: image-s2
    out:
      - id: output
    run: 'D:\Projects\OGC Testbed 14\Work\Rabix Composer\multisensorndvi-ipt.cwl'
  - id: multisensor-ndvi-vito
    label: MultiSensorNDVI-VITO
    in:
      - id: access-token
        source: access-token
      - id: image
        source: image-probav
    out:
      - id: output
    run: 'D:\Projects\OGC Testbed 14\Work\Rabix Composer\multisensorndvi-vito.cwl'
  - id: multisensor-ndvi-urthecast
    label: MultiSensorNDVI-UrtheCast
    in:
      - id: access-token
        source: access-token
      - id: image
        source: image-urthecast
    out:
      - id: output
    run: 'D:\Projects\OGC Testbed 14\Work\Rabix Composer\multisensorndvi-urthecast.cwl'
  - id: ndvi-stacker-pfc
    label: NDVIStacker-PFC
    in:
      - id: access-token
        source: access-token
      - id: files
        source:
          - multisensor-ndvi-ipt/img
          - multisensor-ndvi-vito/img
          - multisensor-ndvi-urthecast/img
    out:
      - id: output
    run: 'D:\Projects\OGC Testbed 14\Work\Rabix Composer\ndvistacker-pfc.cwl'