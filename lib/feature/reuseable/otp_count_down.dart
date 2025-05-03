import 'dart:async';

import 'package:nexquub/utils/utils.dart';

class OtpCountDown extends StatefulWidget {
  final OTPExpiryResponse response;
  final ValueNotifier<bool> notifier;
  final void Function(bool)? updateIsExpired;
  const OtpCountDown({
    super.key,
    required this.notifier,
    required this.response,
    this.updateIsExpired,
  });

  @override
  State<OtpCountDown> createState() => _OtpCountDownState();
}

class _OtpCountDownState extends State<OtpCountDown> {
  late Duration timeToExpiry;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timeToExpiry = Duration(seconds: widget.response.otpExpiry);
    widget.updateIsExpired?.call(false);
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      timeToExpiry = Duration(seconds: timeToExpiry.inSeconds - 1);
      if (timeToExpiry.inSeconds <= 0) {
        widget.updateIsExpired?.call(true);
      }
      setState(() {});
    });
  }

  void _requestOTP() {
    widget.notifier.value = true;
    locator<UserApiService>()
        .requestOTP(
          payload: RequestOTPPayload(
            email: widget.response.email,
            type: widget.response.type,
          ),
        )
        .then((value) {
          if (value == null) {
            timeToExpiry = Duration(seconds: widget.response.otpExpiry);
          } else {
            timeToExpiry = Duration(seconds: value.data.otpExpiry);
          }
          widget.updateIsExpired?.call(false);
          setState(() {});
        })
        .whenComplete(() {
          if (!mounted) return;
          widget.notifier.value = false;
        });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canResend = timeToExpiry.inSeconds <= 0;

    return PakeButton.text(
      onPressed: _requestOTP,
      disabled: !canResend,
      text:
          canResend
              ? 'Resend'
              : 'Resend in: ${timeToExpiry.inMinutes.toString().padLeft(2, '0')}:${(timeToExpiry.inSeconds % 60).toString().padLeft(2, '0')}',
      style: TextStyle(
        color:
            canResend ? PakeColors.primaryDark500 : PakeColors.neutralDark500,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
