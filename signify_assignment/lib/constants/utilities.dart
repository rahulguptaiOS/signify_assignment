import 'dart:math';

_generateRandomItem(items) {
  final Random random = Random();
  final int index = random.nextInt(items.length);
  return items[index];
}