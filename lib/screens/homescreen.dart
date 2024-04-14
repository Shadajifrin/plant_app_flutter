import 'package:flutter/material.dart';
import 'package:plant_app_flutter/models/container.dart';

class HomeScreen extends StatelessWidget {
  final List<ContainerData> dataList = [
    ContainerData(
      imagePath: 'assets/images/firstplant-removebg-preview.png',
      title: 'Filodendro Atom',
      subtitle: '💧250ml',
    ),
    ContainerData(
      imagePath: 'assets/images/secondplant-removebg-preview.png',
      title: 'Monstera Deliciosa',
      subtitle: '💧500ml',
    ),
    ContainerData(
      imagePath: 'assets/images/thirdplant-removebg-preview.png',
      title: 'Chlorophytum',
      subtitle: '💧500ml',
    ),
    ContainerData(
      imagePath: 'assets/images/fourplant-removebg-preview.png',
      title: 'Kentiapalm',
      subtitle: '💧250ml',
    ),
    ContainerData(
      imagePath: 'assets/images/fifthplant-removebg-preview.png',
      title: 'Pepromia Obtusifolia',
      subtitle: '💧250ml',
    ),
  ];

  // Define a list of colors
  final List<Color> containerColors = [
    Colors.green.shade200,
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.grey.shade300,
    Colors.red.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings, color: Colors.grey, size: 35),
        actions: [
          CircleAvatar(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color.fromARGB(255, 158, 216, 246),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Water Today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (index < dataList.length) {
                    final data = dataList[index];
                    final color =
                        containerColors[index % containerColors.length]; // Assign color based on index

                    return Container(
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: color, // Use color from the list
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100, // Set the maximum height for the image
                            child: AspectRatio(
                              aspectRatio: 1, // Maintain aspect ratio
                              child: Image.asset(
                                data.imagePath,
                                fit: BoxFit.cover, // Cover the entire box
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  data.subtitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 138, 138, 138),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.water_drop,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
                separatorBuilder: (context, index) {
                  if ((index + 1) % 4 == 0 && index < dataList.length - 1) {
                    final date = 'Fri February 7';
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(height: 10);
                  }
                },
                itemCount: dataList.length + (dataList.length ~/ 4), // Add space for the date widgets
              ),
            ),
          ),
        ],
      ),
    );
  }
}
