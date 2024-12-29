import 'package:flutter/material.dart';
import 'package:food/service.dart';
import 'package:food/widget/custom_text.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent,
            ),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back))),
        title: const TextCustom(
          text: 'Notifications',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<DataManage>(context, listen: false).getdata(),
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
                          TextCustom(text: timestamp),
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
}
