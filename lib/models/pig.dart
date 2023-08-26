
class Pig{
  int? id;
  String? jenisTernak;
  String? tipeUpdate;
  String? catatanPig;
  int? jumlah;

    Pig( {
      this.id,
      this.jenisTernak,
      this.tipeUpdate,
      this.catatanPig,
      this.jumlah
    });
  Pig.fromJson(Map<String,dynamic> json){
      id = json['id'];
      jenisTernak = json['jenisTernak'];
      tipeUpdate = json['tipeUpdate'];
      catatanPig = json['catatanPig'];
      jumlah = json['jumlah'];
    }  

  Map<String,dynamic> toJson(){
    final Map<String, dynamic>datapig = new Map<String, dynamic>();
      datapig['id']= id;
      datapig['jenisTernak']=jenisTernak;
      datapig['tipeUpdate']= tipeUpdate;
      datapig['catatanPig']= catatanPig;
      datapig['jumlah']= jumlah;
      return datapig;

}
}