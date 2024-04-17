DateTime parseTimeString(String timeString) {
  final parts = timeString.split(' ');
  final timeParts = parts[0].split(':');
  var hours = int.parse(timeParts[0]);
  final minutes = int.parse(timeParts[1]);
  final period = parts[1];

  if (period == 'PM' && hours != 12) {
    hours += 12;
  } else if (period == 'AM' && hours == 12) {
    hours = 0;
  }

  return DateTime(0, 0, 0, hours, minutes);
}