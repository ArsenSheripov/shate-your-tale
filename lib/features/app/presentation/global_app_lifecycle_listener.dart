import 'package:flutter/material.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:pruv_mobile/core/utils/services/app_message_handler.dart';
// import 'package:pruv_mobile/features/finance/domain/bloc/finance_bloc.dart';
// import 'package:pruv_mobile/features/finance/domain/model/finance_integrations_type.dart';
// import 'package:pruv_mobile/features/healths/domain/bloc/health_bloc.dart';
// import 'package:pruv_mobile/features/user/domain/bloc/user_bloc.dart';
// import 'package:pruv_mobile/ui/ui.dart';

class GlobalAppLifecycleListener extends StatefulWidget {
  const GlobalAppLifecycleListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<GlobalAppLifecycleListener> createState() =>
      _GlobalAppLifecycleListenerState();
}

class _GlobalAppLifecycleListenerState
    extends State<GlobalAppLifecycleListener> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    // AppMessageHandler().addErrorListener((message) {
    //   Toaster.show(context, message: message, type: ToasterTypes.error);
    // });
    // AppMessageHandler().addSuccessListener((message) {
    //   Toaster.show(context, message: message);
    // });

    // context.read<UserBloc>().add(const SetTimeZone());
    // context.read<HealthBloc>().add(const GetLastHealthDataEvent());

    // PlaidLink.onSuccess.listen((event) {
    //   context.read<FinanceBloc>().add(
    //         ConfirmFinanceServiceEvent(
    //           type: FinanceIntegrationsType.plaid,
    //           publicToken: event.publicToken,
    //         ),
    //       );
    // });

    _listener = AppLifecycleListener(
        // onShow: () =>
        //     context.read<HealthBloc>().add(const GetLastHealthDataEvent()),
        );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
