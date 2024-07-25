import 'package:flutter/material.dart';

class ConfirmationDialogHelper {
  static void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback confirmationCallback,
    String labelYesButton = 'Confirmar',
    String labelNoButton = 'Cancelar',
    Color? yesButtonColor, // Adicionando cores opcionais para os botões
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
                  backgroundColor: yesButtonColor ??
                      Theme.of(context)
                          .primaryColor, // Cor do texto do botão "Confirmar"
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
                  backgroundColor: noButtonColor ??
                      Theme.of(context)
                          .unselectedWidgetColor, // Cor do texto do botão "Cancelar"
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
