class IngredienteData {
    final String idIngredient;
    final String strIngredient;
    final String strType;

    IngredienteData({
        required this.idIngredient,
        required this.strIngredient,
        required this.strType,
    });

    factory IngredienteData.fromJson(Map<String, dynamic> json) => IngredienteData(
        idIngredient: json["idIngredient"],
        strIngredient: json["strIngredient"],
        strType: json["strType"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "idIngredient": idIngredient,
        "strIngredient": strIngredient,
        "strType": strType,
    };
}
