import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';

part 'injection_container.main.dart';
