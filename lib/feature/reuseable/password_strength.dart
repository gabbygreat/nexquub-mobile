import 'package:nexquub/utils/utils.dart';

enum PasswordStrength { none, weak, fair, good, strong }

class PasswordStrengthWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(PasswordStrength) onChange;
  const PasswordStrengthWidget({
    super.key,
    required this.controller,
    required this.onChange,
  });

  @override
  State<PasswordStrengthWidget> createState() => _PasswordStrengthWidgetState();
}

class _PasswordStrengthWidgetState extends State<PasswordStrengthWidget> {
  PasswordStrength passwordStrength = PasswordStrength.none;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_passwordStrengthListener);
  }

  void _passwordStrengthListener() {
    final password = widget.controller.text;

    PasswordStrength newStrength = PasswordStrength.none;

    if (password.isEmpty) {
      newStrength = PasswordStrength.none;
    } else if (password.length < 6) {
      newStrength = PasswordStrength.weak;
    } else {
      bool hasLower = password.contains(RegExp(r'[a-z]'));
      bool hasUpper = password.contains(RegExp(r'[A-Z]'));
      bool hasDigit = password.contains(RegExp(r'\d'));
      bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      int score =
          [hasLower, hasUpper, hasDigit, hasSpecial].where((e) => e).length;

      if (score <= 1) {
        newStrength = PasswordStrength.fair;
      } else if (score == 2 || score == 3) {
        newStrength = PasswordStrength.good;
      } else if (score == 4) {
        newStrength = PasswordStrength.strong;
      }
    }

    if (newStrength != passwordStrength) {
      setState(() {
        passwordStrength = newStrength;
      });
      widget.onChange(newStrength);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_passwordStrengthListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = switch (passwordStrength) {
      PasswordStrength.none => Colors.transparent,
      PasswordStrength.weak => PakeColors.red500,
      PasswordStrength.fair => PakeColors.warning400,
      PasswordStrength.good => PakeColors.primaryDark600,
      PasswordStrength.strong => PakeColors.green600,
    };
    final widthFactor =
        switch (passwordStrength) {
          PasswordStrength.none => 0,
          PasswordStrength.weak => 1 / 4,
          PasswordStrength.fair => 1 / 2.5,
          PasswordStrength.good => 1 / 1.5,
          PasswordStrength.strong => 1 / 1,
        }.toDouble();
    if (passwordStrength == PasswordStrength.none) {
      return SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(top: 6.spMin),
      height: 8.spMin,
      decoration: ShapeDecoration(
        color: PakeColors.neutralLight100.of(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.spMin),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: AnimatedFractionallySizedBox(
        duration: Duration(milliseconds: 500),
        widthFactor: widthFactor,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.spMin),
            ),
          ),
        ),
      ),
    );
  }
}
