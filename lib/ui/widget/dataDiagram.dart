// import 'package:flutter/material.dart';

// class dataRekap extends StatefulWidget {
//   const dataRekap({super.key});

//   @override
//   State<dataRekap> createState() => _dataRekapState();
// }

// class _dataRekapState extends State<dataRekap> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//         title: Text("Data Table Example"),
//       ),

//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columns: <DataColumn>[
//             DataColumn(label: Text("Dessert (100g serving)")),
//             DataColumn(label: Text("Calories")),
//             DataColumn(label: Text("Fat (g)")),
//             DataColumn(label: Text("Protein (g)")),
//           ],
//           rows: <DataRow>[
//             DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text("Frozen Yogurt")),
//                   DataCell(Text("159")),
//                   DataCell(Text("6.0")),
//                   DataCell(Text("4.0")),
//                 ],
//             ),
//             DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text("Ice Cream Sandwich")),
//                   DataCell(Text("237")),
//                   DataCell(Text("9.0")),
//                   DataCell(Text("4.3")),
//                 ],
//             ),
//             DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text("Eclair")),
//                   DataCell(Text("262")),
//                   DataCell(Text("16.0")),
//                   DataCell(Text("6.0")),
//                 ],
//             ),
//           ],
//         ),
//       ),
   
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/pakan.dart';
import '../theme.dart';
import 'input_field.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class dataDiagram extends StatefulWidget {
 
  const dataDiagram({
    super.key,
  });

  @override
  State<dataDiagram> createState() => _dataDiagramState();

}
class _dataDiagramState extends State<dataDiagram> {
 Pakan? pakan;
  DateTime _firstDate= DateTime.now();
   DateTime _lastDate= DateTime.now();

  @override
  Widget build(BuildContext context) {
   
      final List<ChartData> chartData = <ChartData>[
          ChartData('',780000, 100000, 210000),
          ChartData('Februari', 80007, 90005, 799991),
           ChartData('maret', 10000, 10000, 21000),
           ChartData('april', 123, 929999, 93999),
         
        ];
 
    return  Scaffold(
      appBar: AppBar(
        
        title: 
        Text('Diagram', style: subStyle.copyWith(color:Get.isDarkMode?Colors.white:Colors.black,),),
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: context.theme.dialogBackgroundColor,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode?Colors.white:Colors.black,
          
        ),
        
      ),
     body:SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0 , 40, 10),
            color: context.theme.dialogBackgroundColor,
            child:
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Tanggal awal",
                      hint: DateFormat.yMd().format(_firstDate),
                      widget: IconButton(
                        onPressed: (){
                            _firstDateUser();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),
                     Expanded(
                    child: MyInputField(
                      title: "Tanggal akhir",
                      hint: DateFormat.yMd().format(_lastDate),
                      widget: IconButton(
                        onPressed: (){
                         _lastDateUser();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ), 
          ),
          Container(
            color: context.theme.dialogBackgroundColor,
            height: MediaQuery.of(context).size.height/1.6,
            child: SfCartesianChart(
              enableAxisAnimation: true,
              primaryXAxis: CategoryAxis(
                autoScrollingDelta: 4,
                    majorGridLines: const MajorGridLines(width: 0),
                    majorTickLines: const MajorTickLines(width: 0),
                ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                   dataSource: chartData,
                   xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y
                    ),
                    ColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y1
                      ),
                      ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y2
                         )
                     ]
                   ),
          ),
        ],
      )
           )
    );
  }
  _firstDateUser()async{
  DateTime? _pickerDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2123)
    );
    if(_pickerDate !=null){
     setState(() {
        _firstDate = _pickerDate;
     });
    }
    else{
      print("it's null or something");
    }
}
 _lastDateUser()async{
  DateTime? _pickerDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2123)
    );
    if(_pickerDate !=null){
     setState(() {
        _lastDate = _pickerDate;
     });
    }
    else{
      print("it's null or something");
    }
}
}
 class ChartData {
        ChartData(this.x, this.y, this.y1, this.y2);
        final String x;
        final double? y;
        final double? y1;
        final double? y2;
}

