import 'package:test/test.dart';

import 'package:elapsed_timer/elapsed_timer.dart';

void main() {
  test('Elapsed test', () async {
    final timer =
        ElapsedTimer(const Duration(seconds: 5), () => print('All done'));
    await Future.delayed(const Duration(seconds: 1));
    expect(timer.elapsed > const Duration(seconds: 1), true);
    timer.cancel();
    // Stopped timer stops elapsed count
    await Future.delayed(const Duration(seconds: 1));
    expect(timer.elapsed < const Duration(seconds: 2), true);
  });
}
