import 'package:caffeine_tracker/shared/data/models/error_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _supabaseUrl = dotenv.env['SUPABASE_URL'];
final _supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
Future<void> initSupabase() async {
  final List<ConnectivityResult> connectivityResult = await (Connectivity())
      .checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.none)) {
    throw ErrorModel(
      title: 'No Network',
      message: '네트워크에 연결되지 않았습니다.',
      path: '',
    );
  }
  if (_supabaseUrl == null || _supabaseAnonKey == null) {
    throw ErrorModel(
      title: 'supabase error',
      message: 'supabase 설정을 읽어오지 못했습니다.',
      path: '',
    );
  }
  try {
    await Supabase.initialize(url: _supabaseUrl!, anonKey: _supabaseAnonKey!);
  } catch (e) {
    throw ErrorModel(
      title: 'supabase error',
      message: '데이터를 읽어오지 못했습니다.',
      path: '',
    );
  }
}

SupabaseClient get supabase => Supabase.instance.client;
