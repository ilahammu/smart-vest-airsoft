import 'package:get/get.dart';

class MonitoringController extends GetxController {
  // Add your properties and methods here
  // For example:
  String status = "Monitoring is active";

  void startMonitoring() {
    // Logic to start monitoring
    status = "Monitoring started";
  }

  void stopMonitoring() {
    // Logic to stop monitoring
    status = "Monitoring stopped";
  }
}
