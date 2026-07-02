import 'day_phase.dart';

class DayPhaseHelper {

  static DayPhase fromHour(int hour) {

    if (hour >= 5 && hour < 8) {
      return DayPhase.sunrise;
    }

    if (hour >= 8 && hour < 16) {
      return DayPhase.morning;
    }

    if (hour >= 16 && hour < 18) {
      return DayPhase.afternoon;
    }

    if (hour >= 18 && hour < 20) {
      return DayPhase.sunset;
    }

    return DayPhase.night;
  }

}