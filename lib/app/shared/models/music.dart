class Music {
  String name;
  String songwriter;
  String link;
  String cipher;

  Music({
    required this.name,
    required this.songwriter,
    required this.link,
    required this.cipher,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['songwriter'] = songwriter;
    data['link'] = link;
    data['cipher'] = cipher;
    return data;
  }
}
