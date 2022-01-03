import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_list_screen.dart';
import 'package:flutter_auth_app/Services/academic_service.dart';
import 'package:flutter_auth_app/constants.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key}) : super(key: key);

  @override
  _StudentAttendanceScreenState createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  final AcademicService _academicService = AcademicService();

  List<Widget> widgets = [];

  SubjectModel selectedSubject = SubjectModel();
  BatchModel selectedBatch = BatchModel();
  String selectedMonth = months.first;
  int selectedYear = DateTime.now().year;
  DateTime selectedDate = DateTime.now();
  List<BatchModel> batchOptions = [];
  List<SubjectModel> subjectOptions = [];
  List<int> years = [];

  @override
  void initState() {
    super.initState();
    _academicService.getDefaultAcademicSession().then((value) {
      print(value.startDate!.split('-').first +
          " " +
          value.endDate!.split('-').first);
      setState(() {
        years.add(int.parse(value.startDate!.split('-').first));
        years.add(int.parse(value.endDate!.split('-').first));
      });
    });
    _academicService.getSubjectByUser().then((value) {
      setState(() {
        subjectOptions = value;
      });
    });
    // _academicService.getBatchesByTeacherUser().then((value) {
    //   setState(() {
    //     batchOptions = value;
    //   });
    // }).catchError((e) => print(e));
    // print(batchOptions);
  }

  @override
  Widget build(BuildContext context) {
    _preBuildFunction();
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: Column(children: widgets),
    );
  }

  _preBuildFunction() {
    setState(() {
      widgets = [
        _buildSubjectAutoComplete(),
        SizedBox(height: 20),
        // _buildBatchAutoComplete(),
        // CalendarDatePicker(
        //   initialDate: DateTime.now(),
        //   onDateChanged: (date) {
        //     print(date);
        //     setState(() {
        //       selectedDate = date;
        //     });
        //   },
        //   firstDate: DateTime.now().subtract(const Duration(days: 30)),
        //   lastDate: DateTime.now(),
        // ),

        _buildMonthDropdown(),
        SizedBox(height: 20),
        _buildYearDropdown(),
        SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            if (selectedSubject.batch!.id != null &&
                selectedSubject.id != null &&
                selectedMonth.isNotEmpty &&
                selectedYear != null) {
              print("done");
              Navigator.of(context).pushNamed(
                StudentAttendanceListScreen.routeName,
                arguments: {
                  "batchId": selectedSubject.batch!.id,
                  "subjectId": selectedSubject.id,
                  "month": selectedMonth,
                  "year": selectedYear,
                },
              );
            }
          },
          child: Text("Go to List Page"),
        ),
      ];
    });
  }

  // String _displayStringForOption(BatchModel option) => option.name!;

  // Widget _buildBatchAutoComplete() {
  //   return Autocomplete<BatchModel>(
  //     displayStringForOption: _displayStringForOption,
  //     optionsBuilder: (TextEditingValue textEditingValue) {
  //       if (textEditingValue.text == '') {
  //         return const Iterable<BatchModel>.empty();
  //       }
  //       return batchOptions.where((BatchModel option) {
  //         return option
  //             .toString()
  //             .contains(textEditingValue.text.toLowerCase());
  //       });
  //     },
  //     onSelected: (BatchModel selection) {
  //       setState(() {
  //         selectedBatch = selection;
  //       });
  //       debugPrint(
  //           'You just selected ${_displayStringForOption(selectedBatch)}');
  //     },
  //   );
  // }

  String _displaySubjectStringForOption(SubjectModel option) =>
      option.name! +
      " - " +
      option.batch!.course!.name! +
      " ( " +
      option.batch!.name! +
      " )";

  Widget _buildSubjectAutoComplete() {
    return Container(
      // alignment: Alignment.center,
      // width: (MediaQuery.of(context).size.width * 0.8),
      // margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
      child: Autocomplete<SubjectModel>(
        // initialValue: selectedSubject.id != null
        //     ? TextEditingValue(
        //         text: _displaySubjectStringForOption(selectedSubject))
        //     : TextEditingValue(text: ''),
        displayStringForOption: _displaySubjectStringForOption,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<SubjectModel>.empty();
          }
          return subjectOptions.where((SubjectModel option) {
            return option
                .toString()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (SubjectModel selection) {
          setState(() {
            selectedSubject = selection;
          });
          debugPrint(
              'You just selected ${_displaySubjectStringForOption(selectedSubject)}');
        },
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return DropdownButton<String>(
      value: selectedMonth,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: kPrimaryColor),
      hint: const Text("Select Month"),
      underline: Container(
        height: 2,
        color: kPrimaryColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedMonth = newValue!;
        });
      },
      items: months.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildYearDropdown() {
    return DropdownButton<int>(
      value: selectedYear,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: kPrimaryColor),
      underline: Container(
        height: 2,
        color: kPrimaryColor,
      ),
      onChanged: (int? newValue) {
        setState(() {
          selectedYear = newValue!;
        });
      },
      items: years.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

class AutocompleteBasicBatchExample extends StatelessWidget {
  const AutocompleteBasicBatchExample({Key? key}) : super(key: key);

  static List<BatchModel> _batchOptions = <BatchModel>[
    BatchModel(name: "1st Section", course: CourseModel(name: "Course 1")),
    BatchModel(name: "2nd Section", course: CourseModel(name: "Course 1")),
    BatchModel(name: "1st Section", course: CourseModel(name: "Course 2")),
    BatchModel(name: "2nd Section", course: CourseModel(name: "Course 2")),
  ];

  static String _displayStringForOption(BatchModel option) => option.name!;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<BatchModel>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<BatchModel>.empty();
        }
        return _batchOptions.where((BatchModel option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (BatchModel selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}

class AutocompleteBasicMonthExample extends StatefulWidget {
  static List<String> _options = <String>[
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
  ];

  static String _displayStringForOption(String option) => option;

  @override
  State<AutocompleteBasicMonthExample> createState() =>
      _AutocompleteBasicMonthExampleState();
}

class _AutocompleteBasicMonthExampleState
    extends State<AutocompleteBasicMonthExample> {
  String dropdownValue = AutocompleteBasicMonthExample._options.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: kPrimaryColor),
      underline: Container(
        height: 2,
        color: kPrimaryColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: AutocompleteBasicMonthExample._options
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
