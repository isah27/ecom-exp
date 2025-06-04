extension NumExtension on Iterable<num> {
  num get sum {
    num total = 0;
    for (var item in this) {
      total += item;
    }
    return total;
  }
}
