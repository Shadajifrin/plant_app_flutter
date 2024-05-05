import 'package:flutter/material.dart';
import 'package:plant_app_flutter/models/details.dart';

class DetailsScreen extends StatelessWidget {
  final Plants plant;
  final List<Color> containerColors = [
    Colors.green.shade200,
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.grey.shade300,
    Colors.red.shade100,
  ];
  DetailsScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    // Get the index of the selected plant in the plantlist
    final int plantIndex =
        plantlist.indexWhere((element) => element.id == plant.id);
    // Selecting a color from the list based on the plant's index
    final Color selectedColor =
        containerColors[plantIndex % containerColors.length];

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: selectedColor,
                image: DecorationImage(
                  image: AssetImage(plant.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Container with curved edges and white background
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    plant.name!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 60/35,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildContainer(context, index);
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    plant.description!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Read more text
                  InkWell(
                    onTap: () {
                      // Handle 'Read More' action
                    },
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Waterdrop icon
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.water_drop, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a container with an icon and two texts
  Widget _buildContainer(BuildContext context, int index) {
    IconData icon;
    String text1;
    String text2;

    switch (index) {
      case 0:
        icon = Icons.calendar_today_outlined;
        text1 = 'FREQUENCY';
        text2 = '1/Week';
        break;
      case 1:
        icon = Icons.water_drop_outlined;
        text1 = 'WATER';
        text2 = '250ml';
        break;
      case 2:
        icon = Icons.thermostat_outlined;
        text1 = 'TEMP';
        text2 = '15-24C';
        break;
      case 3:
        icon = Icons.wb_sunny_outlined;
        text1 = 'LIGHT';
        text2 = 'Low';
        break;
      default:
        icon = Icons.error;
        text1 = 'Error';
        text2 = 'Error';
    }

    return Container(
      height: 35,
      width: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 5),
              Text(text1),
            ],
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(text2),
          ),
        ],
      ),
    );
  }
}
