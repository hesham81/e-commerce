import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

abstract class BotToastServices {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 : 75,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFF46c234),
              ),
            ),
            child: msg.length > 80
                ? Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Color(0xFF46c234),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.gpp_good,
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Success",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              msg,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Text(
                            "close",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Color(0xFF46c234),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.gpp_good,
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Success",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              msg,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Text(
                            "close",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 110 : 85,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFFd12e2e),
              ),
            ),
            child: msg.length > 80
                ? Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Color(0xFFd12e2e),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.gpp_bad,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Error",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              msg,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Text(
                            "close",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFFd12e2e),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.gpp_bad,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Error",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              msg,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: cancelFunc,
                          icon: const Text(
                            "close",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      duration: const Duration(seconds: 10),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}
