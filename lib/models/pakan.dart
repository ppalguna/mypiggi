
class Pakan{
  int? id;
  String? tanggalPakan;
  int? jumlahPakan;
  int? hargaPakan;
  String? catatanPakan;
  

    Pakan( {
      this.id,
      this.tanggalPakan,
      this.jumlahPakan,
      this.hargaPakan,
      this.catatanPakan,
    
    });
  Pakan.fromJson(Map<String,dynamic> json){
      id = json['id'];
      tanggalPakan = json['tanggalPakan'];
      jumlahPakan = json['jumlahPakan'];
      hargaPakan = json['hargaPakan'];
      catatanPakan = json['catatanPakan'];
    }  

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> datapakan = <String, dynamic>{};
      datapakan['id']= id;
      datapakan['tanggalPakan']=tanggalPakan;
      datapakan['jumlahPakan']= jumlahPakan;
      datapakan['hargaPakan']= hargaPakan;
      datapakan['catatanPakan']= catatanPakan;
      return datapakan;

}
}