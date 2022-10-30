import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '/services/schedule.dart' as schedule_service;

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  Map<String, dynamic> _schedule = {};

  _getSchedule() async {
    final schedule = await schedule_service.mySchedule();

    print("SCHEDULE: $schedule");
    setState(() {
      _schedule = schedule;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 1,
          timeSlotViewSettings:
              const TimeSlotViewSettings(startHour: 5, endHour: 22),
          dataSource: MeetingDataSource(getData()),
        ),
      ),
    );
  }

  List<Appointment> getData() {
    List<Appointment> mettings = <Appointment>[];
    if (_schedule['data'] == null) {
      return mettings;
    }
    for (var i = 0; i < _schedule['data'].length; i++) {
      final schedule = _schedule['data'][i]['schedules'];
      DateTime timeStart = DateTime(
        2022,
        10,
        27,
        int.parse(schedule[0]['startTime'].split(':')[0]),
        int.parse(schedule[0]['startTime'].split(':')[1]),
      );

      Map<int, String> days = {
        1: 'MO',
        2: 'TU',
        3: 'WE',
        4: 'TH',
        5: 'FR',
        6: 'SA',
        7: 'SU',
      };

      String byday = "${days[schedule[0]['day']]},${days[schedule[1]['day']]}";

      mettings.add(
        Appointment(
          startTime: timeStart,
          endTime: timeStart.add(const Duration(hours: 2)),
          subject: _schedule['data'][i]['subject']['subjectName'],
          color: const Color.fromRGBO(255, 0, 0, 0.5),
          recurrenceRule: 'FREQ=WEEKLY ;BYDAY=$byday;COUNT=32',
        ),
      );
    }
    return mettings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
