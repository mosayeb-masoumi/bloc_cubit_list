class Student{

  String name;
  String family;
  int age;

  Student( this.name, this.family, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Student &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          family == other.family &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ family.hashCode ^ age.hashCode;
}