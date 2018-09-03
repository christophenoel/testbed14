class: Workflow
cwlVersion: v1.0
id: multisensor_ndvi_stack_generator
doc: This is a mockup of the MultiSensorNDVIStackGenerator.
label: MultiSensor-NDVI-Stack-Generator
'sbg:toolAuthor': Patrick Jacques
requirements:
  - class: MultipleInputFeatureRequirement
inputs:
  - id: access-token
    type: string
  - id: img-ref-s2
    type: string
  - id: img-ref-probav
    type: string
  - id: img-ref-urthecast
    type: string
  - id: aoi
    type: string
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
      - id: img-ref
        source: img-ref-s2
      - id: aoi
        source: aoi
    out:
      - id: img
    run: 'http://ems-host/WPS/CWL/multisensorndvi-ipt.cwl'
  - id: multisensor-ndvi-vito
    label: MultiSensorNDVI-VITO
    in:
      - id: access-token
        source: access-token
      - id: img-ref
        source: img-ref-probav
      - id: aoi
        source: aoi
    out:
      - id: img
    run: 'http://ems-host/WPS/CWL/multisensorndvi-vito.cwl'
    'sbg:x': -1114
    'sbg:y': -360
  - id: multisensor-ndvi-urthecast
    label: MultiSensorNDVI-UrtheCast
    in:
      - id: access-token
        source: access-token
      - id: img-ref
        source: img-ref-urthecast
      - id: aoi
        source: aoi
    out:
      - id: img
    run: 'http://ems-host/WPS/CWL/multisensorndvi-urthecast.cwl'
  - id: ndvi-stacker-pfc
    label: NDVIStacker-PFC
    in:
      - id: access-token
        source: access-token
      - id: img-in
        source:
          - multisensor-ndvi-ipt/img
          - multisensor-ndvi-vito/img
          - multisensor-ndvi-urthecast/img
    out:
      - id: img-out
    run: 'http://ems-host/WPS/CWL/ndvistacker-pfc.cwl'
