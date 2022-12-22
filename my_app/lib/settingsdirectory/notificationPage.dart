import 'package:flutter/material.dart';
import 'package:my_app/Pages/time_picker.dart';
import 'package:my_app/services/local_notification_service.dart';
class NotificationMan extends StatefulWidget {
  const NotificationMan({Key? key}) : super(key: key);

  @override
  State<NotificationMan> createState() => _NotificationManState();
}

class _NotificationManState extends State<NotificationMan> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification Demo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                          id: 0,
                          title: 'Notification Title',
                          body: 'Some body');
                    },
                    child: const Text('Show Local Notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showScheduledNotification(
                        id: 0,
                        title: 'Notification Title',
                        body: 'Some body',
                        seconds: 4,
                      );
                    },
                    child: const Text('Show Scheduled Notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotificationWithPayload(
                          id: 0,
                          title: 'Notification Title',
                          body: 'Some body',
                          payload: 'payload navigation');
                    },
                    child: const Text('Show Notification With Payload'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => TimePicker(payload: payload))));
    }
  }
}
