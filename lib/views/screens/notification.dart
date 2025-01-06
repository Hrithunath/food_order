import 'package:flutter/material.dart';
import 'package:food/services/api_service.dart';
import 'package:food/widget/custom_text.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    254,
                    254,
                    255,
                  ),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(
                      255,
                      47,
                      223,
                      132,
                    ),
                    radius: 20,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const TextCustom(
                    text: 'Notifications',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future:
                    Provider.of<DataManage>(context, listen: false).getdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Consumer<DataManage>(
                      builder: (context, value, child) {
                        final notification = value.datas;
                        return ListView.builder(
                          itemCount: notification.length,
                          itemBuilder: (context, index) {
                            final item = notification[index];
                            String image = item.image.toString();
                            String title = item.title.toString();
                            String body = item.body?.toString() ?? 'No body';
                            String timestamp =
                                item.timestamp?.toString() ?? 'No timestamp';

                            return ListTile(
                              leading: Image.asset(getImage(image)),
                              title: TextCustom(
                                text: title,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(
                                    text: body,
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                  TextCustom(text: timeAgo(timestamp)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated getImage function
  String getImage(String image) {
    // Extract base name before the extension
    int dotIndex = image.indexOf('.');
    String baseName = image.substring(0, dotIndex);

    // Map image names to asset paths
    switch (baseName) {
      case "order_assigned":
        return "asset/images/notification/image.png";
      case "order_cancelled":
        return "asset/images/notification/image copy 2.png";
      case "order_delivered":
        return "asset/images/notification/image copy.png";
      case "order_unavailable":
        return "asset/images/notification/image copy 3.png";
      case "promotion_marketplace":
        return "asset/images/notification/image copy 4.png";
      case "promotion_notify":
        return "asset/images/notification/image copy 5.png";
      case "support_personnel":
        return "asset/images/notification/image copy 6.png";
      default:
        return "";
    }
  }

  String timeAgo(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime notificationTime = DateTime.parse(timestamp);
    DateTime now = DateTime.now();

    Duration difference = now.difference(notificationTime);

    if (difference.inDays > 365) {
      int years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      int months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}
