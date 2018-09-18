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
  - id: image-deimos
    type: File
outputs:
  - id: output
    outputSource:
      - ndvi-stacker-pfc/output
    type: File
steps:
  - id: multisensor-ndvi-ipt
    label: MultiSensorNDVI-IPT
    in:
      - id: access-token
        source: access-token
      - id: files
        source: image-s2
    out:
      - id: output
    run: 'multisensor_ndvi.cwl'
  - id: multisensor-ndvi-vito
    label: MultiSensorNDVI-VITO
    in:
      - id: access-token
        source: access-token
      - id: files
        source: image-probav
    out:
      - id: output
    run: 'multisensor_ndvi.cwl'
  - id: multisensor-ndvi-urthecast
    label: MultiSensorNDVI-UrtheCast
    in:
      - id: access-token
        source: access-token
      - id: files
        source: image-deimos
    out:
      - id: output
    run: 'multisensor_ndvi.cwl'
  - id: ndvi-stacker-pfc
    label: NDVIStacker
    in:
      - id: access-token
        source: access-token
      - id: files
        source:
          - multisensor-ndvi-ipt/output
          - multisensor-ndvi-vito/output
          - multisensor-ndvi-urthecast/output
    out:
      - id: output
    run: 'stack.cwl'