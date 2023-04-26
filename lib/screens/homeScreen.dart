import 'package:fitness_app/models/macrosModel.dart';
import 'package:fitness_app/repository/user_repository.dart';
import 'package:fitness_app/widgets/text_form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MacrosModel?>? isMacros = [];
  List<MacrosModel?>? newMacros = [];

  final _dateEditingController = TextEditingController();
  double totalCal = 0;

  final _dailyIntake = TextEditingController();

  @override
  void initState() {
    _dateEditingController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (newMacros!.isNotEmpty) {
      for (var i in isMacros!) {
        setState(() {
          totalCal += double.parse(i!.calories!);
        });
      }
    }
    String? cal = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height-100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   color: Colors.white,
                  //   padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  //   height: 70,
                  //   child: Center(
                  //     child: TextField(
                  //       controller: _dateEditingController,
                  //       //editing controller of this TextField
                  //       decoration: const InputDecoration(
                  //           icon: Icon(Icons.calendar_today),
                  //           labelText: "Choose Date"),
                  //       readOnly: true,
                    
                  //       onTap: () async {
                  //         DateTime? pickedDate = await showDatePicker(
                  //             context: context,
                  //             initialDate: DateTime.now(),
                  //             firstDate: DateTime.now(),
                  //             //DateTime.now() - not to allow to choose before today.
                  //             lastDate: DateTime(2100));
                    
                  //         if (pickedDate != null) {
                  //           debugPrint(pickedDate.toString());
                  //           String formattedDate =
                  //               DateFormat.yMMMMd().format(pickedDate);
                  //           String todayDate =
                  //               DateFormat.yMMMMd().format(DateTime.now());
                  //           debugPrint(formattedDate);
                  //           setState(() {
                  //             if (todayDate == formattedDate) {
                  //               _dateEditingController.text = "Today";
                  //             } else {
                  //               _dateEditingController.text = formattedDate;
                  //             }
                  //           });
                  //         } else {}
                  //       },
                  //     ),
                  //   ),
                  // ),
                  TextFormFieldInput(
                    textEditingController: _dailyIntake,
                    hintText: "Enter a food...",
                    prefixIcon: const Icon(
                      Icons.food_bank,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 10),
                  Text("Total Calories Eaten: $totalCal", style: const TextStyle(fontSize: 24),),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          _addFood();
                        },
                        child: const Text("Add Foods")),
                  ),
                  if (isMacros!.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: newMacros!.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {},
                            child: ListTile(
                              title: Text(
                                  "                 ${newMacros![index]!.name!}"),
                              subtitle: Column(
                                children: [
                                  Text("Calorie: ${newMacros![index]!.calories}gm"),
                                  Text(
                                      "Protein: ${newMacros![index]!.protein_g}gm"),
                                  Text(
                                      "Carbohydrates: ${newMacros![index]!.carbohydrates_total_g}gm"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: const Text("Clear"),
                        onPressed: () {
                          setState(() {
                            isMacros = [];
                            newMacros = [];
                            totalCal = 0;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addFood() async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("userid");
    debugPrint("Ssssssssssssssssssssss$userid");
    UserRepository userRepository = UserRepository();
    
    isMacros = await userRepository.addFood(
      userid,
      _dailyIntake.text,
    );
    if (isMacros!.isNotEmpty) {
      for (var i in isMacros!) {
        newMacros!.add(i);
      }
    }
    debugPrint(isMacros.toString());
  }
}
