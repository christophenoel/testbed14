cwlVersion: v1.0
class: CommandLineTool
baseCommand: s1_coherence_cd
hints:
  DockerRequirement:
    dockerPull: obarrilero/s1coherence:1.0
id: satcen-coherence-spb
label: Satcen S1 Coherence Process (SPB version)
inputs:
  input_files:
    inputBinding:
      position: 1
      prefix: --input_files
    type:
      items:
      - File
      - Directory
      type: array
  aoi_wkt:
    inputBinding:
      position: 2
      prefix: --aoi_wkt
    type: string?
outputs:
  output:
    outputBinding:
      glob: '*.tif'
    type: File
  metadata:
    outputBinding:
      glob: 'metadata.xml'
    type: File
  
