class Note{
  int? id;
  String? judul;
  String? keterangan;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  String? repeat;

    Note({
      this.id,
      this.judul,
      this.keterangan,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endTime,
      this.color,
      this.repeat,
    });
  Note.fromJson(Map<String,dynamic> json){
      id = json['id'];
      judul = json['judul'];
      keterangan = json['keterangan'];
      isCompleted = json['isCompleted'];
      date = json['date'];
      startTime = json['startTime'];
      endTime = json['endTime'];
      color = json['color'];
      repeat = json['repeat'];
    }  

  Map<String,dynamic> toJson(){
    final Map<String, dynamic>datanote = new Map<String, dynamic>();
      datanote['id']= id;
      datanote['judul']=judul;
      datanote['date']= date;
      datanote['keterangan']= keterangan;
      datanote['isCompleted']= isCompleted;
      datanote['startTime']= startTime;
      datanote['endTime']= endTime;
      datanote['color']= color;
      datanote['repeat']= repeat;
      return datanote;

}
}