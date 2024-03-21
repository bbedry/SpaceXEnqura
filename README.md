SpaceXEnqura 


- Proje SwiftUI ile geliştirildi.
- Network katmanı için Alamofire kullandım.
- Veriler, Codable protokolü kullanılarak JSON formatından Swift nesnelerine dönüştürüldü.
- ViewModel'i ObservableObject protokolüne conform edip, VM'de bulunan logicleri gözlemledim.
- Detay ekranında, ilgili verinin modelinde eğer Article ya da Wikipedia url'si var ise bunu SafariViewController'da gösterdim.
- Veri Modelini, Hashable ve Identifiable protokollerine conform ederek, Verilerin liste ekranında sıralı bir şekilde gösterilmesini sağladım.
