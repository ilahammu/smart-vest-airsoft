import 'package:get/get.dart';

class GamestartController extends GetxController with StateMixin {
  var name = ''.obs; // Reactive variable untuk nama
  var team = 'Team A'.obs; // Reactive variable untuk team
  var isGameStarted = false.obs; // Reactive variable untuk status game

  final GetConnect _connect = GetConnect();

  // Fungsi untuk mengirim data ke backend
  Future<void> savePersonData() async {
    final response = await _connect.post(
      'http://localhost:3000/api/addPerson', // Gantilah dengan URL backend Anda
      {
        'name': name.value,
        'team': team.value,
      },
      contentType: 'application/json',
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Data berhasil disimpan!');
    } else {
      Get.snackbar('Error', 'Gagal menyimpan data.');
    }
  }

  // Fungsi untuk memulai game
  void startGame() {
    isGameStarted.value = true;
  }

  // Fungsi untuk menghentikan game
  void stopGame() {
    isGameStarted.value = false;
  }
}
