import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({Key? key}) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double temp = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Air Conditioner',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Air Conditioner',
                        style: TextStyle(fontWeight: FontWeight.bold)
                            .copyWith(color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temperature',
                        style: TextStyle(fontWeight: FontWeight.bold)
                            .copyWith(color: Colors.deepOrangeAccent),
                      ),
                      Text(
                        '25°C',
                        style: TextStyle(fontWeight: FontWeight.bold)
                            .copyWith(color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SleekCircularSlider(
                  min: 16,
                  max: 31,
                  initialValue: temp,
                  appearance: CircularSliderAppearance(
                    size: 300,
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.orange,
                      trackColor: Colors.grey[100],
                      dotColor: Colors.white,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8,
                      trackWidth: 8,
                      handlerSize: 16,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      temp = double.parse(value.toStringAsFixed(1));
                    });
                  },
                  onChangeStart: (double startValue) {
                    // callback providing a starting value (when a pan gesture starts)
                  },
                  onChangeEnd: (double endValue) {
                    // callback providing an ending value (when a pan gesture ends)
                  },
                  innerWidget: (double value) {
                    //This the widget that will show current value
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "cool",
                            style: TextStyle(fontWeight: FontWeight.bold)
                                .copyWith(color: Colors.deepOrangeAccent),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: temp.floor() <= 16
                                    ? Colors.deepOrangeAccent
                                    : Colors.white,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: temp.floor() <= 16
                                      ? null
                                      : () {
                                    setState(() {
                                      temp--;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                "${value.toStringAsFixed(1)}°C",
                                style: TextStyle(fontWeight: FontWeight.bold)
                                    .copyWith(
                                  color: Colors.deepOrangeAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 16),
                              CircleAvatar(
                                backgroundColor: temp.round() == 31
                                    ? Colors.deepOrangeAccent
                                    : Colors.white,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: temp.round() == 31
                                      ? null
                                      : () {
                                    setState(() {
                                      temp++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
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
}
