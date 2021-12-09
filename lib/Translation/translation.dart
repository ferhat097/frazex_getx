import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_EN": {
          "findphoto": "Find photos...",
          "findpage": "Find",
          "explorepage": "Explore",
          "profilepage": "Profile",
          "forfindwrite": "Write something for find",
          "error": "Something went wrong",
          "textempty": "Search text must not be empty",
          "noresult": "No Result"
        },
        "az_AZ": {
          "findphoto": "Şəkil axtar...",
          "findpage": "Axtar",
          "explorepage": "Kəşf et",
          "profilepage": "Profil",
          "forfindwrite": "Axtarmaq üçün yazın",
          "error": "Xəta baş verdi",
          "textempty": "Axtarış mətni boş ola bilməz",
          "noresult": "Axtardığınız kəlimədə şəkil tapılmadı"
        },
        "tr_TR": {
          "findphoto": "Fotoğraf ara...",
          "findpage": "Ara",
          "explorepage": "Keşf et",
          "profilepage": "Ben",
          "forfindwrite": "Aramak için yazın",
          "error": "Hata oluştu",
          "textempty": "Arama metni boş olmamalıdır",
          "noresult": "Aradığın kelimede fotoğraf bulunamadı"
        },
      };
}
