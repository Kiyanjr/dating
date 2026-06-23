class DateInvite {
  String personName = '';
  String senderName = '';
  String place      = '';
  DateTime? date;
  String timeOfDay  = '';
  String vibe       = '';
  String message    = '';

  void reset() {
    personName = '';
    senderName = '';
    place      = '';
    date       = null;
    timeOfDay  = '';
    vibe       = '';
    message    = '';
  }

  String formattedDate() {
    if (date == null) return '—';
    const mo = ['Jan','Feb','Mar','Apr','May','Jun',
                 'Jul','Aug','Sep','Oct','Nov','Dec'];
    const dw = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
    return '${dw[date!.weekday - 1]}, ${mo[date!.month - 1]} ${date!.day}, ${date!.year}';
  }
}
