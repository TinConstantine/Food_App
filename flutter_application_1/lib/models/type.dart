class Type {
  String? name;
  String? type;
  String? image;
  String? bgImage;
  Type({this.name, this.type, this.image, this.bgImage});
}

List<Type> TYPES = [
  Type(
      name: "Kem",
      type: "Kem",
      image: "assets/images/type_kem.jpg",
      bgImage: "assets/images/bg_kem.jpg"),
  Type(
      name: "Pizza",
      type: "Pizza",
      image: "assets/images/type_pizza.jpg",
      bgImage: "assets/images/bg_pizza.jpg"),
  Type(
      name: "Nước",
      type: "Nuoc",
      image: "assets/images/type_nuoc.jpg",
      bgImage: "assets/images/bg_nuoc.jpg"),
  Type(
      name: "Khác",
      type: "Khac",
      image: "assets/images/type_khac.jpg",
      bgImage: "assets/images/bg_khac.jpg")
];
