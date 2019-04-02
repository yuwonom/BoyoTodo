import 'dart:async';
import 'dart:io';
import 'dart:math';

/// Support for randomly generated delays and errors in simulated API calls while in disconnected mode.
abstract class DisconnectedMixin {
  static final Random random = new Random();

  bool get includeRandomDelays;
  bool get includeRandomErrors;

  Future<Null> randomDelay({int minimum = 250, int maximum = 1000}) async {
    if (includeRandomDelays) {
      await new Future<Null>.delayed(randomDelayDuration(minimum: minimum, maximum: maximum));
    }
  }

  Duration randomDelayDuration({int minimum = 250, int maximum = 1000}) => Duration(milliseconds: random.nextInt(maximum) + minimum);

  Future<Null> randomError({int percentChance = 10, Exception error}) async {
    if (!includeRandomErrors) {
      return;
    }

    if (random.nextInt(100) > percentChance) {
      return;
    }

    if (error == null) {
      if (random.nextBool()) {
        error = const HttpException("HTTP exception from the disconnected layer.");
      } else {
        error = new Exception("General exception from the disconnected layer.");
      }
    }

    throw error;
  }

  DateTime generateRandomDateTime(Random random) => new DateTime(
    2000 + random.nextInt(20),
    random.nextInt(12),
    random.nextInt(28),
    random.nextInt(24),
    random.nextInt(60),
    random.nextInt(60)
  );
}