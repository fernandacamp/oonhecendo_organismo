class OpcaoModel{

  String path;
  bool selected;
  bool certoErrado;
  bool boolDica;

  OpcaoModel({
    required this.path,
    this.selected = false,
    this.certoErrado = false,
    this.boolDica = false,
  });
}