// ignore_for_file: constant_identifier_names

enum LottieItems { loading, no_internet, error, spaceship }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.loading:
        return "loading";
      case LottieItems.no_internet:
        return "no_internet";
      case LottieItems.error:
        return 'error';
      case LottieItems.spaceship:
        return "spaceship";
    }
  }

  String get imagePath => 'assets/json/${_path()}.json';
}
