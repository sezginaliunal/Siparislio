// ignore_for_file: file_names

String trimFirstAndLastChar(String input) {
  if (input.length <= 2) {
    return ''; // Eğer string 2 karakterden azsa, tüm karakterleri kaldırarak boş string döndür.
  }
  return input.substring(1, input.length - 1);
}
