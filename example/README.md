## Usage

```dart
final timer = ElapsedTimer(const Duration(seconds: 5), () => print('All done'));
// Somewhere in the code:
final elapsed = timer.elapsed;
```
