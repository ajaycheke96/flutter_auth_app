import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Services/academic_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final AcademicService _academicService = AcademicService();
  List<Meeting> meetings = [];
  @override
  void initState() {
    // TODO: implement initState
    _getDataSource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      allowedViews: CalendarView.values,
      allowViewNavigation: true,
      onTap: (calendarTapDetails) {
        if (calendarTapDetails.appointments != null) {
          calendarTapDetails.appointments!.forEach((element) {
            Meeting meeting = element;
            print(meeting.eventName);
            print(meeting.from);
            print(meeting.to);
          });
        }
      },
      showDatePickerButton: true,
      showNavigationArrow: true,

      dataSource: MeetingDataSource(meetings),
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }

  Color getValidColorFromString(String value) {
    Color color = Color(0xFF0F8644);
    if (value != null) {
      switch (value) {
        case "red":
          color = Colors.redAccent;
          break;
        case "blue":
          color = Colors.blueAccent;
          break;
        case "orange":
          color = Colors.orangeAccent;
          break;
        case "purple":
          color = Colors.purpleAccent;
          break;
        default:
      }
    } else {
      color = Color(0xFF0F8644);
    }
    return color;
  }

  void _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    _academicService.getAllEventsByUser().then((value) {
      if (value.isNotEmpty) {
        for (var element in value) {
          meetings.add(Meeting(
            eventName: element.eventName!,
            notes: element.notes,
            from: element.from!,
            to: element.to!,
            background: getValidColorFromString(element.background!),
            subject: element.subject,
          ));
        }
      }
    });
    // final DateTime today = DateTime.now();
    // final DateTime startTime =
    //     DateTime(today.year, today.month, today.day, 9, 0, 0);
    // final DateTime endTime = startTime.add(const Duration(hours: 2));
    // final DateTime startTime2 =
    //     DateTime(today.year, today.month, today.day, 11, 0, 0);
    // final DateTime endTime2 = startTime.add(const Duration(hours: 1));
    // meetings.add(Meeting(
    //     eventName: 'Conference',
    //     notes: "Notes",
    //     from: startTime,
    //     to: endTime,
    //     background: const Color(0xFF0F8644),
    //     subject: "Subject"));
    // meetings.add(Meeting(
    //   eventName: 'Hindi',
    //   notes: "Notes",
    //   from: startTime2,
    //   to: endTime2,
    //   background: const Color(0xFF0F8644),
    // ));
    // meetings.add(Meeting(
    //     eventName: 'Holiday',
    //     from: startTime2.add(Duration(days: 1)),
    //     to: endTime2.add(Duration(days: 1)),
    //     background: const Color(0xFF0F8644),
    //     isAllDay: true));
    // return meetings;
    setState(() {
      this.meetings = meetings;
    });
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting({
    required this.eventName,
    this.notes,
    this.subject,
    required this.from,
    required this.to,
    this.background = Colors.greenAccent,
    this.isAllDay = false,
  });

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  String? notes;

  String? subject;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
