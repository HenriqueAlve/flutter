import 'package:flutter/material.dart';

class ConfirmationDialogHelper {
  static void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback confirmationCallback,
    String labelYesButton = 'Confirmar',
    String labelNoButton = 'Cancelar',
    Color? yesButtonColor,
    Color? noButtonColor,
  }) {
    final confirmationDialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      yesButtonColor ?? Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  confirmationCallback();
                },
                child: Text(labelYesButton),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor:
                      noButtonColor ?? Theme.of(context).unselectedWidgetColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(labelNoButton),
              ),
            ),
          ],
        )
      ],
    );

    showDialog(context: context, builder: (context) => confirmationDialog);
  }
}
