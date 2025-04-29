extension NumberSplitter on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  bool get alphanumeric {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  /// File extension for this file.
  String? get extension => split('.').last;

  String get snakeCaseToNormal {
    return replaceAll('_', ' ');
  }

  String padSpace({int padding = 12}) {
    if (length >= padding) return this;

    int totalSpaces = padding - length;
    int leftSpaces = totalSpaces ~/ 2;
    int rightSpaces = totalSpaces - leftSpaces;

    return ' ' * leftSpaces + this + ' ' * rightSpaces;
  }

  String get convertCamelCase {
    // Add a space before each capital letter and convert the whole string to lowercase
    final withSpaces = replaceAllMapped(RegExp('([a-z])([A-Z])'), (Match m) {
      return '${m.group(1)} ${m.group(2)}';
    });

    // Capitalize the first letter of the string and make the rest lowercase
    return withSpaces[0].toUpperCase() + withSpaces.substring(1).toLowerCase();
  }

  String get amount {
    return replaceAll(',', '');
  }

  bool get isValidEmail {
    return RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(this);
  }

  String get toSnakeCase {
    // Replace uppercase letters with _ followed by the lowercase equivalent
    final snakeCase = replaceAllMapped(
      RegExp('[A-Z]'),
      (Match match) => '_${match.group(0)!.toLowerCase()}',
    );

    // Remove leading underscore if present
    return snakeCase.startsWith('_') ? snakeCase.substring(1) : snakeCase;
  }
}

extension NullableStringExtension on String? {
  bool get hasValue {
    return this?.isNotEmpty == true && this != null;
  }
}
