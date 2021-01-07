import 'dart:async';

typedef void OnTimerCallback(int value);

class TimerUtil {
  static StreamSubscription _subscription;

  static startCountdown(int count, OnTimerCallback callback) {
    callback(count);

    _subscription =
        Stream.periodic(Duration(seconds: 1), (i) => i).take(count).listen(
      (value) {
        callback(count - value - 1);
      },
    );
  }

  static cancelCountdown() {
    _subscription?.cancel();
  }

  static delay(int milliseconds, OnTimerCallback callback) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      callback(milliseconds);
    });
  }
}
