// chart_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/Custom_Component/Chart/Custom_Barchart.dart';
import '../Controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  final ChartController controller = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(235, 0, 0, 0),
        title: Text(
          'Chart View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 21, 20, 33),
              Color.fromARGB(255, 25, 24, 39),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    // Info & Status Box
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(236, 20, 19, 19),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_drop_down,
                                  color:
                                      const Color.fromARGB(255, 213, 255, 63),
                                  size: 40,
                                ),
                                Text(
                                  "Gerald",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 213, 255, 63),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: Get.width * 0.2,
                          height: Get.height * 0.58,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(169, 15, 15, 14),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Name: Gerald',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text('Team: A',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                  )),
                              SizedBox(height: 10),
                              Text('ID: 001',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    // Chart Section
                    Expanded(
                      child: Column(
                        children: [
                          CustomBarChart(),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 200,
                            child: Container(
                              color: Colors.deepPurple[600],
                              child: Center(
                                child: Text('Line Chart Placeholder',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Team',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Bagian',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'TimeStamp',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('A',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                              DataCell(Text('Alpha',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                              DataCell(Text('Chest',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                              DataCell(Text('2023-10-01 12:05:00',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'B',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Beta',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Head',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                '2023-10-01 12:10:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Gerald',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Beta',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Head',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                '2023-10-01 12:10:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'B',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Beta',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                'Head',
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                '2023-10-01 12:10:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
