import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'my_color_provider.mocks.dart';

void main() {
  late MockMyColorProvider myColorProvider;

  setUp(() {
    myColorProvider = MockMyColorProvider();
  });

  test('Color provider test initial color is null', () {
    expect(myColorProvider.colorValue, null);
  });

  test('Verify Color provider colorValue', () {
    myColorProvider.colorValue;
    myColorProvider.colorValue;
    verify(myColorProvider.colorValue).called(2);

    myColorProvider.colorValue;
    myColorProvider.colorValue;
    verify(myColorProvider.colorValue).called(greaterThan(1));

    verifyNever(myColorProvider.colorValue);
  });

  test('Color provider test initial color', () {
    expect(myColorProvider.colorValue, null);

    when(myColorProvider.colorValue).thenReturn(Colors.red);
    expect(myColorProvider.colorValue, Colors.red);
    expect(myColorProvider.colorValue, Colors.red);

    when(myColorProvider.colorValue).thenReturn(Colors.blue);
    expect(myColorProvider.colorValue, Colors.blue);
  });
}