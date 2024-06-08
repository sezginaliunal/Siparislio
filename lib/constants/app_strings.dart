class AppStrings {
  static String noInternet = 'İnternet bağlantı hatası';
  static String noInternetDesc = 'Lütfen bir ağa bağlanınız';
  static String versionError = 'Versiyon Hatası';
  static String versionErrorDescription = 'Lütfen versiyonunuzu güncelleyiniz';
  static String errorTitle = 'Hata';
  static String errorDescription = 'Bir şeyler yanlış gitti';
  static String upgradeNow = 'Şimdi güncelle';

  static const getCookie = 'getCookie("auth_token")';

  static const getCookieStrings = '''function getCookie(cname) {
  let name = cname + "=";
  let ca = document.cookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return null;
}''';
}
