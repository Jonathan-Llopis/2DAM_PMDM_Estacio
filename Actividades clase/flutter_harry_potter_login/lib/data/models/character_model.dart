class CharacterModel {
  final String name;
  final String house;
  final String image;
  final String dateOfBirth;
  final String species;

  CharacterModel(
      {required this.name,
      required this.house,
      required this.image,
      required this.dateOfBirth,
      required this.species});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      house: json['house'] ?? 'Unknown',
      image: json['image'] == ""
          ? "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/364491d2-4103-45f7-95fe-b73d55658a9a/da5ykkd-3724e648-b930-4dda-bd42-39f557f83c75.png/v1/fit/w_699,h_603/hogwarts_crest___png_by_srg_wands_da5ykkd-375w-2x.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjAzIiwicGF0aCI6IlwvZlwvMzY0NDkxZDItNDEwMy00NWY3LTk1ZmUtYjczZDU1NjU4YTlhXC9kYTV5a2tkLTM3MjRlNjQ4LWI5MzAtNGRkYS1iZDQyLTM5ZjU1N2Y4M2M3NS5wbmciLCJ3aWR0aCI6Ijw9Njk5In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.dsdJzIAwOL0X8xOf2n6ANzLOBRyCUalL4ciGQVTwOHM"
          : json['image'],
      dateOfBirth	: json['dateOfBirth'] ?? 'Unknown',
      species: json['species']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'house': house,
      'image': image,
      'dateOfBirth': dateOfBirth,
      'species': species
    };
  }
}
