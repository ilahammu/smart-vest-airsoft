import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/data/TablePerson.dart';

class TeaminfoController extends GetxController {
  Timer? timer;

  final GetConnect _http = GetConnect();
  final listColumn = [
    'Nama Anggota',
  ].obs;

  final Map<String, String> columnMap = {
    'Nama Anggota': 'name',
  };

  final RxList<DataTablePerson> listDataTable = <DataTablePerson>[].obs;

  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  static const String _addPlayerEndpoint = String.fromEnvironment('ADD_PLAYER');
  static const String _deletePlayerEndpoint =
      String.fromEnvironment('DELETE_PLAYER');

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    startAutoRefresh();
  }

  void fetchDataTable() async {
    final response = await _http.get('$_baseUrl$_addPlayerEndpoint');
    if (response.statusCode == 200) {
      final data = response.body['players'] as List<dynamic>;
      listDataTable.value =
          data.map((item) => DataTablePerson.fromJson(item)).toList();
    }
  }

  Future<void> deletePlayer(String macAddress) async {
    try {
      final response = await _http.delete(
        '$_baseUrl$_deletePlayerEndpoint/$macAddress',
      );
      if (response.statusCode == 200) {
        fetchDataTable();
        Get.defaultDialog(
          title: "Success",
          middleText: "Player berhasil dihapus!",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Gagal menghapus player: $e",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }

  void startAutoRefresh() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      fetchDataTable();
    });
  }

  void stopAutoRefresh() {
    timer?.cancel();
    timer = null;
  }

  @override
  void onClose() {
    stopAutoRefresh();
    super.onClose();
  }
}
