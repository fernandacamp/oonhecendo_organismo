class OpcaoModel{

  String path;
  bool selected;
  bool certoErrado;
  bool boolDica;
  String pathAudio;

  OpcaoModel({
    required this.path,
    this.selected = false,
    this.certoErrado = false,
    this.boolDica = false,
    required this.pathAudio,
  });
}