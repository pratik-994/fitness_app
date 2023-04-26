import 'package:fitness_app/models/foodModel.dart';
import 'package:flutter/material.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  List<FoodModel> foodModelList = [
    FoodModel(
        calories: 200,
        name: "Daal",
        protein: 21,
        sizeInGram: 100,
        sugar: 12,
        image: ""),
    FoodModel(
        calories: 400,
        name: "Bhaat",
        protein: 21,
        sizeInGram: 100,
        sugar: 12,
        image: ""),
    FoodModel(
        calories: 100,
        name: "Tarkari",
        protein: 21,
        sizeInGram: 100,
        sugar: 12,
        image: ""),
    FoodModel(
        calories: 20,
        name: "Aanda",
        protein: 21,
        sizeInGram: 100,
        sugar: 2,
        image: ""),
    FoodModel(
        calories: 600,
        name: "Juice",
        protein: 21,
        sizeInGram: 100,
        sugar: 120,
        image: ""),
    FoodModel(
        calories: 500,
        name: "Meals",
        protein: 21,
        sizeInGram: 100,
        sugar: 12,
        image: ""),
    FoodModel(
        calories: 10,
        name: "Beans",
        protein: 21,
        sizeInGram: 100,
        sugar: 12,
        image: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Choose Foods")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(""),
              // FutureBuilder<List<AppointmentHDTModel?>>(
              //   future: CategoryRepository()
              //       .loadAppointmentHDT(healthCategoryList[0]),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return SizedBox(
              //         // height: MediaQuery.of(context).size.height / 7,
              //         child: GridView.builder(
              //           shrinkWrap: true,
              //           itemCount: snapshot.data!.length,
              //           gridDelegate:
              //               const SliverGridDelegateWithMaxCrossAxisExtent(
              //             crossAxisSpacing: 10.0,
              //             mainAxisSpacing: 10.0,
              //             maxCrossAxisExtent: 200,
              //             childAspectRatio: 2,
              //           ),
              //           itemBuilder: (BuildContext context, index) {
              //             return dateAndtime(snapshot.data![index], index);
              //           },
              //         ),
              //       );
              //     } else if (snapshot.hasError) {
              //       return const Text("Error");
              //     } else {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //   },
              // ),

              SizedBox(
                // height: MediaQuery.of(context).size.height / 7,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: foodModelList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(foodModelList[index].image!)),
                        title: Text(foodModelList[index].name!),
                        subtitle:
                            Text("Calorie: ${foodModelList[index].calories}gm"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget dateAndtime(AppointmentHDTModel? appointmentHDTModel, int index) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         selectedIndexDate = index;
  //         time = appointmentHDTModel!.time;
  //         isSelectedDate = true;
  //         dateValue = appointmentHDTModel.date;
  //         timeValue = "";
  //         selectedIndexTime = null;
  //       });
  //     },
  //     child: Container(
  //       height: 60,
  //       // width: 150,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //         border: Border.all(
  //           width: 1.2,
  //           color: selectedIndexDate == index ? blue : grey,
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 6),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Text(
  //               appointmentHDTModel!.date!,
  //               style: const TextStyle(fontWeight: FontWeight.w600),
  //             ),
  //             Text(
  //               "${appointmentHDTModel.time.length} Available Slots",
  //               style: const TextStyle(
  //                   fontWeight: FontWeight.w500,
  //                   color: Color.fromARGB(255, 63, 219, 68)),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
