import 'package:flutter/material.dart';

/// store 2D array  12x8 blocs to paint the Invader ships
///* Every bloc represents with digit/int that will define bloc color
///* 0 = transparent
///* 1 = white
///* unknown =  red
class Matrix8x12 {
  static const int row = 8;
  static const int col = 12;

  final List<List<int>> data;

  /// bloc will be 12x8
  Matrix8x12()
      : data = List.generate(row, (index) => List.generate(col, (index) => 0));

  /// 12x8 filled by zero
  factory Matrix8x12.zero() => Matrix8x12();

  /// 12x8 filled by one
  Matrix8x12.one()
      : data = List.generate(row, (index) => List.generate(col, (index) => 1));

  /// common data part
  factory Matrix8x12.head() => Matrix8x12()
    ..fillRow(rowIndex: 0, startCellIndex: 4, endCellIndex: 7)
    ..fillRow(rowIndex: 1, startCellIndex: 1, endCellIndex: 10)
    ..fillRow(rowIndex: 2, startCellIndex: 0)
    ..fillRow(rowIndex: 3, startCellIndex: 0, endCellIndex: 2)
    ..fillRow(rowIndex: 3, startCellIndex: 5, endCellIndex: 6)
    ..fillRow(rowIndex: 3, startCellIndex: 9)
    ..fillRow(rowIndex: 4, startCellIndex: 0);

  /// Get color of the cell
  static Color blocColor(int cellDigit) {
    switch (cellDigit) {
      case 0:
        return Colors.cyanAccent.withOpacity(.2);
      case 1:
        return Colors.white;

      default:
        return Colors.red;
    }
  }

  // update specific cell
  void setEntry({required int row, required int col, required int v}) {
    assert((row >= 0) && (row < Matrix8x12.row));
    assert((col >= 0) && (col < Matrix8x12.col));
    data[row][col] = v;
  }

  void fillRow({
    required int rowIndex,
    int? startCellIndex,
    int? endCellIndex,
    int value = 1,
  }) {
    startCellIndex ??= 0;
    endCellIndex ??= col;
    data[rowIndex].replaceRange(startCellIndex, endCellIndex,
        List.filled(endCellIndex - startCellIndex + 1, value));
  }

  void fillCells({
    required int rowIndex,
    required List<int> cellIndexes,
    int value = 1,
  }) {
    for (final cIndex in cellIndexes) {
      setEntry(row: rowIndex, col: cIndex, v: value);
    }
  }

  /// clear [rowIndex] and fill [cellIndexes] with [value]
  void clearRowAndSetCells(
      {required int rowIndex,
      required List<int> cellIndexes,
      required int value}) {
    fillRow(rowIndex: rowIndex, value: 0);
    for (final cell in cellIndexes) {
      data[rowIndex][cell] = value;
    }
  }
}
