import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({Key? key}) : super(key: key);

  @override
  _UserCardWidgetState createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Scaffold.of(context).openDrawer();
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
          child: AuthUserStreamWidget(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                currentUserPhoto,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
