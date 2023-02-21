import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  test('getProgress', () {
    final board = TaskBoard(
      Uuid.v4(),
      'Nova lista de tarefas 1',
    );

    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progress = TaskCard(board: board).getProgress(tasks);

    expect(progress, 0.5);
  });
  test('getProgressText', () {
    final board = TaskBoard(
      Uuid.v4(),
      'Nova lista de tarefas 1',
    );

    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progressText = TaskCard(board: board).getProgressText(tasks);

    expect(progressText, '2 / 4');
  });
  group('getStatus', () {
    final board = TaskBoard(
      Uuid.v4(),
      'Board 1',
    );

    test('is completed', () {
      final status = TaskCard(board: board).getStatus(board, 1);

      expect(status, TaskCardStatus.completed);
    });
    test('is pending', () {
      final status = TaskCard(board: board).getStatus(board, 0.5);

      expect(status, TaskCardStatus.pending);
    });
    test('is disabled', () {
      final disabledBoard = TaskBoard(
        Uuid.v4(),
        'Board 1',
        enabled: false,
      );

      final status = TaskCard(board: disabledBoard).getStatus(disabledBoard, 0);

      expect(status, TaskCardStatus.disabled);
    });
  });
  group('getBackgroundColor', () {
    final board = TaskBoard(
      Uuid.v4(),
      'Board 1',
    );
    final taskCard = TaskCard(board: board);
    final theme = ThemeData();

    test('completed color', () {
      const status = TaskCardStatus.completed;
      final backgroundColor = taskCard.getBackgroundColor(status, theme);

      expect(backgroundColor, theme.colorScheme.tertiaryContainer);
    });
    test('pending color', () {
      const status = TaskCardStatus.pending;
      final backgroundColor = taskCard.getBackgroundColor(status, theme);

      expect(backgroundColor, theme.colorScheme.primaryContainer);
    });
    test('disabled color', () {
      const status = TaskCardStatus.disabled;
      final backgroundColor = taskCard.getBackgroundColor(status, theme);

      expect(backgroundColor, theme.colorScheme.errorContainer);
    });
  });
  group('getColor', () {
    final board = TaskBoard(
      Uuid.v4(),
      'Board 1',
    );
    final taskCard = TaskCard(board: board);
    final theme = ThemeData();

    test('completed color', () {
      const status = TaskCardStatus.completed;
      final color = taskCard.getColor(status, theme);

      expect(color, theme.colorScheme.tertiary);
    });
    test('pending color', () {
      const status = TaskCardStatus.pending;
      final color = taskCard.getColor(status, theme);

      expect(color, theme.colorScheme.primary);
    });
    test('disabled color', () {
      const status = TaskCardStatus.disabled;
      final color = taskCard.getColor(status, theme);

      expect(color, theme.colorScheme.error);
    });
  });
}
