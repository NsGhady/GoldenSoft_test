import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:material_text_fields/material_text_fields.dart';

class VehicleRegistrationPage extends StatelessWidget {
  const VehicleRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VehicleRegistrationModel(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.green),
          backgroundColor: Colors.white,
          title: const Text(
            'Vehicle Registration',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialTextField(
                  theme: const InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                  onChanged: (value) => context
                      .read<VehicleRegistrationModel>()
                      .vehicleSerialNumber = value,
                  hint: 'Vehicle Serial Number',
                  prefixIcon: const Icon(
                    Icons.car_rental_outlined,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.numbers_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                  isExpanded: true,
                  value: context.watch<VehicleRegistrationModel>().vehicleBrand,
                  onChanged: (value) => context
                      .read<VehicleRegistrationModel>()
                      .vehicleBrand = value!,
                  items: [
                    'Vehicle Brand',
                    'Toyota',
                    'Honda',
                    'Ford',
                    'Chevrolet',
                    'Nissan',
                    'Jeep',
                    'Subaru',
                    'Hyundai',
                    'Kia',
                    'Volkswagen'
                  ]
                      .map((brand) => DropdownMenuItem(
                            value: brand,
                            child: Text(brand),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                MaterialTextField(
                  theme: const InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                  onChanged: (value) => context
                      .read<VehicleRegistrationModel>()
                      .vehicleModel = value,
                  hint: 'Vehicle Model',
                  prefixIcon: const Icon(
                    Icons.mode_edit_outline,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Year of Manufacture'),
                const SizedBox(
                  height: 6,
                ),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.precision_manufacturing_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                  isExpanded: true,
                  value: context
                      .watch<VehicleRegistrationModel>()
                      .yearOfManufacture,
                  onChanged: (value) => context
                      .read<VehicleRegistrationModel>()
                      .yearOfManufacture = value!,
                  items: List.generate(30, (index) => 1990 + index)
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year.toString()),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text('Vehicle Pictures'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              // ignore: use_build_context_synchronously
                              context
                                  .read<VehicleRegistrationModel>()
                                  .addVehiclePicture(File(pickedFile.path));
                            }
                          },
                          child: const Card(
                              child: SizedBox(
                            width: 75,
                            child:
                                Center(child: Icon(Icons.add_a_photo_outlined)),
                          )),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...context
                                  .watch<VehicleRegistrationModel>()
                                  .vehiclePictures
                                  .map(
                                    (vehiclePicture) => Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.file(vehiclePicture),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Car License'),
                        const SizedBox(height: 16),
                        if (context
                            .watch<VehicleRegistrationModel>()
                            ._carLicenseAdded)
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Image.file(context
                                .watch<VehicleRegistrationModel>()
                                .carLicense),
                          )
                        else
                          InkWell(
                              onTap: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<VehicleRegistrationModel>()
                                      .addCarLicense(File(pickedFile.path));
                                }
                              },
                              child: const Card(
                                  child: SizedBox(
                                height: 100,
                                child: Center(
                                    child: Icon(Icons.add_a_photo_outlined)),
                              )))
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Drivers License'),
                        const SizedBox(height: 16),
                        if (context
                            .watch<VehicleRegistrationModel>()
                            ._driversLicenseAdded)
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Image.file(context
                                .watch<VehicleRegistrationModel>()
                                .driversLicense),
                          )
                        else
                          InkWell(
                              onTap: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<VehicleRegistrationModel>()
                                      .adddriversLicense(File(pickedFile.path));
                                }
                              },
                              child: const Card(
                                  child: SizedBox(
                                height: 100,
                                child: Center(
                                    child: Icon(Icons.add_a_photo_outlined)),
                              )))
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10)
                          ],
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VehicleRegistrationModel extends ChangeNotifier {
  String _vehicleSerialNumber = '';
  String _vehicleBrand = 'Vehicle Brand';
  String _vehicleModel = '';
  int _yearOfManufacture = 2019;
  List<File> _vehiclePictures = [];
  File? _driversLicense;
  bool _driversLicenseAdded = false;

  File? _carLicense;
  bool _carLicenseAdded = false;

  String get vehicleSerialNumber => _vehicleSerialNumber;
  set vehicleSerialNumber(String value) {
    _vehicleSerialNumber = value;
    notifyListeners();
  }

  String get vehicleBrand => _vehicleBrand;
  set vehicleBrand(String value) {
    _vehicleBrand = value;
    notifyListeners();
  }

  String get vehicleModel => _vehicleModel;
  set vehicleModel(String value) {
    _vehicleModel = value;
    notifyListeners();
  }

  int get yearOfManufacture => _yearOfManufacture;
  set yearOfManufacture(int value) {
    _yearOfManufacture = value;
    notifyListeners();
  }

  List<File> get vehiclePictures => _vehiclePictures;

  void addVehiclePicture(File picture) {
    _vehiclePictures = [..._vehiclePictures, picture];
    notifyListeners();
  }

  void addDriversLicense(File picture) {
    _driversLicense = picture;
    notifyListeners();
  }

  File get carLicense => _carLicense!;

  void addCarLicense(File picture) {
    _carLicense = picture;
    _carLicenseAdded = true;
    notifyListeners();
  }

  File get driversLicense => _driversLicense!;

  void adddriversLicense(File picture) {
    _driversLicense = picture;
    _driversLicenseAdded = true;
    notifyListeners();
  }
}
