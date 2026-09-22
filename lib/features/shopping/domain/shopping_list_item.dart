class ShoppingListItem {
  const ShoppingListItem({
    required this.id,
    required this.name,
    this.checked = false,
    this.fromRecipe,
  });

  final String id;
  final String name;
  final bool checked;
  final String? fromRecipe;

  ShoppingListItem copyWith({
    String? id,
    String? name,
    bool? checked,
    String? fromRecipe,
  }) {
    return ShoppingListItem(
      id: id ?? this.id,
      name: name ?? this.name,
      checked: checked ?? this.checked,
      fromRecipe: fromRecipe ?? this.fromRecipe,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'checked': checked,
        if (fromRecipe != null) 'from_recipe': fromRecipe,
      };

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) {
    return ShoppingListItem(
      id: json['id'] as String,
      name: json['name'] as String,
      checked: json['checked'] as bool? ?? false,
      fromRecipe: json['from_recipe'] as String?,
    );
  }
}
