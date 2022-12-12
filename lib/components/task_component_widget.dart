import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskComponentWidget extends StatefulWidget {
  const TaskComponentWidget({
    Key? key,
    this.matRef,
  }) : super(key: key);

  final AllMaterialsRecord? matRef;

  @override
  _TaskComponentWidgetState createState() => _TaskComponentWidgetState();
}

class _TaskComponentWidgetState extends State<TaskComponentWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: InkWell(
        onTap: () async {
          context.pushNamed(
            'matDetails',
            queryParams: {
              'matRef': serializeParam(
                widget.matRef,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'matRef': widget.matRef,
            },
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: FutureBuilder<ProjectsRecord>(
              future:
                  ProjectsRecord.getDocumentOnce(widget.matRef!.projectRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                final columnProjectsRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                            child: Text(
                              widget.matRef!.materialName!,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        columnProjectsRecord.projectName!,
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Divider(
                      height: 24,
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'uuuaezib' /* Due */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            dateTimeFormat(
                              'yMMMd',
                              widget.matRef!.addedOn!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            dateTimeFormat(
                              'jm',
                              widget.matRef!.addedOn!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
