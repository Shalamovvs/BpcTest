import 'package:flutter/material.dart';

class BottomFixedButton extends StatelessWidget {
	final VoidCallback? onPressed;
	final String text;

	const BottomFixedButton({
		Key? key,
		this.onPressed,
		required this.text,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 20),
			width: MediaQuery.of(context).size.width,
      height: 56,
			child: FloatingActionButton.extended(
        elevation: 0,
        highlightElevation: 0,
				onPressed: onPressed,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
				backgroundColor: Color(0xFF8B1C2C),
				label: Text(
					text, 
					style: TextStyle(
						fontSize: 16,
            height: 20/16,
						color: Colors.white
					)
				),
			),
		);
	}
}