import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/data_sources/on_boarding_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences preferences;
  late OnBoardingLocalDataSource dataSource;

  setUp(() {
    preferences = MockSharedPreferences();
    dataSource = OnBoardingLocalDataSourceImpl(preferences: preferences);
  });

  group('cacheFirstTimer', () {
    test(
      'should call [SharedPreferences] to cache a data successfully',
          () async {
        // arrange
        when(() => preferences.setBool(any(), any()))
            .thenAnswer((invocation) async => true);
        // act
        await dataSource.cacheFirstTimer();
        // assert
        verify(() => preferences.setBool(kFirstTimerKey, false)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );

    test(
      'should call [SharedPreferences] to cache a data '
          'unsuccessfully [CacheException]',
          () async {
        // arrange
        when(() => preferences.setBool(any(), any()))
            .thenThrow(Exception());
        // act
        final methodCall =  dataSource.cacheFirstTimer;
        // assert
        expect(methodCall, throwsA(isA<CacheException>()));
        verify(() => preferences.setBool(kFirstTimerKey, false)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
  });

  group('checkIfFirstTimer', () {
    test(
      'should call [SharedPreferences] to get a data',
          () async {
        // arrange
        when(() => preferences.getBool(any())).thenReturn(false);
        // act
        final result = await dataSource.checkIfFirstTimer();
        // assert
        expect(result, false);
        verify(() => preferences.getBool(kFirstTimerKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
    test(
      'should call [SharedPreferences] to get null',
          () async {
        // arrange
        when(() => preferences.getBool(any())).thenReturn(null);
        // act
        final result = await dataSource.checkIfFirstTimer();
        // assert
        expect(result, true);
        verify(() => preferences.getBool(kFirstTimerKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
    test(
      'should call [SharedPreferences] to get a data '
          'unsuccessfully [CacheException]',
          () async {
        // arrange
        when(() => preferences.getBool(any())).thenThrow(Exception());
        // act
        final methodCall =  dataSource.checkIfFirstTimer;
        // assert
        expect(methodCall, throwsA(isA<CacheException>()));
        verify(() => preferences.getBool(kFirstTimerKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
  });
}