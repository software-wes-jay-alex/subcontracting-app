import '../backend/backend.dart';
import '../components/drawer_nav_widget.dart';
import '../components/user_card_widget.dart';
import '../components/web_nav_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainProjectsWebWidget extends StatefulWidget {
  const MainProjectsWebWidget({Key? key}) : super(key: key);

  @override
  _MainProjectsWebWidgetState createState() => _MainProjectsWebWidgetState();
}

class _MainProjectsWebWidgetState extends State<MainProjectsWebWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
          begin: Offset(30, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
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
          begin: Offset(30, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
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
          begin: Offset(30, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed(
            'createProject',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 250),
              ),
            },
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.create_new_folder,
          color: Colors.white,
          size: 32,
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: DrawerNavWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              WebNavWidget(
                navBGOne: FlutterFlowTheme.of(context).secondaryBackground,
                navColorOne: FlutterFlowTheme.of(context).secondaryText,
                navBgTwo: FlutterFlowTheme.of(context).primaryBackground,
                navColorTwo: FlutterFlowTheme.of(context).secondaryColor,
                navBgThree: FlutterFlowTheme.of(context).secondaryBackground,
                navColorThree: FlutterFlowTheme.of(context).secondaryText,
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: InkWell(
                                onTap: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: UserCardWidget(),
                              ),
                            ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qcd4z131' /* Projects */,
                                  ),
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0e5jbrkh' /* A list of your projects below. */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 4, 24),
                        child: StreamBuilder<List<ProjectsRecord>>(
                          stream: queryProjectsRecord(
                            queryBuilder: (projectsRecord) => projectsRecord
                                .orderBy('lastEdited', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ProjectsRecord> desktopViewProjectsRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: desktopViewProjectsRecordList.length,
                              itemBuilder: (context, desktopViewIndex) {
                                final desktopViewProjectsRecord =
                                    desktopViewProjectsRecordList[
                                        desktopViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 12, 8),
                                  child: Container(
                                    width: 230,
                                    constraints: BoxConstraints(
                                      maxHeight: 300,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x34090F13),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'projectDetailsPage',
                                          queryParams: {
                                            'projectRef': serializeParam(
                                              desktopViewProjectsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'projectRef':
                                                desktopViewProjectsRecord,
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    desktopViewProjectsRecord
                                                        .projectName!
                                                        .maybeHandleOverflow(
                                                      maxChars: 50,
                                                      replacement: '…',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 0, 0),
                                                    child: Text(
                                                      '${desktopViewProjectsRecord.numberTasks?.toString()} tasks',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Space Grotesk',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final members =
                                                        desktopViewProjectsRecord
                                                            .usersAssigned!
                                                            .toList();
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            members.length,
                                                            (membersIndex) {
                                                          final membersItem =
                                                              members[
                                                                  membersIndex];
                                                          return StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    membersItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Container(
                                                                    width: 36,
                                                                    height: 36,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl!,
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'relative',
                                                      desktopViewProjectsRecord
                                                          .lastEdited!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 16),
                                            child: LinearPercentIndicator(
                                              percent:
                                                  functions.projectStatusalt(
                                                      desktopViewProjectsRecord
                                                          .numberTasks,
                                                      desktopViewProjectsRecord
                                                          .completedTasks),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.34,
                                              lineHeight: 16,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              barRadius: Radius.circular(12),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      desktop: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 4, 24),
                        child: StreamBuilder<List<ProjectsRecord>>(
                          stream: queryProjectsRecord(
                            queryBuilder: (projectsRecord) => projectsRecord
                                .orderBy('lastEdited', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ProjectsRecord> tabletViewProjectsRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.6,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: tabletViewProjectsRecordList.length,
                              itemBuilder: (context, tabletViewIndex) {
                                final tabletViewProjectsRecord =
                                    tabletViewProjectsRecordList[
                                        tabletViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 12, 8),
                                  child: Container(
                                    width: 230,
                                    constraints: BoxConstraints(
                                      maxHeight: 300,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x34090F13),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'projectDetailsPage',
                                          queryParams: {
                                            'projectRef': serializeParam(
                                              tabletViewProjectsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'projectRef':
                                                tabletViewProjectsRecord,
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    tabletViewProjectsRecord
                                                        .projectName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 0, 0),
                                                    child: Text(
                                                      '${tabletViewProjectsRecord.numberTasks?.toString()} tasks',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Space Grotesk',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final members =
                                                        tabletViewProjectsRecord
                                                            .usersAssigned!
                                                            .toList();
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            members.length,
                                                            (membersIndex) {
                                                          final membersItem =
                                                              members[
                                                                  membersIndex];
                                                          return StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    membersItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Container(
                                                                    width: 36,
                                                                    height: 36,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl!,
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'relative',
                                                      tabletViewProjectsRecord
                                                          .lastEdited!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 16),
                                            child: LinearPercentIndicator(
                                              percent:
                                                  functions.projectStatusalt(
                                                      tabletViewProjectsRecord
                                                          .numberTasks,
                                                      tabletViewProjectsRecord
                                                          .completedTasks),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.34,
                                              lineHeight: 16,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              barRadius: Radius.circular(12),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                        child: StreamBuilder<List<ProjectsRecord>>(
                          stream: queryProjectsRecord(
                            queryBuilder: (projectsRecord) => projectsRecord
                                .orderBy('lastEdited', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ProjectsRecord> mobileViewProjectsRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: mobileViewProjectsRecordList.length,
                              itemBuilder: (context, mobileViewIndex) {
                                final mobileViewProjectsRecord =
                                    mobileViewProjectsRecordList[
                                        mobileViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 12, 8),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x34090F13),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'projectDetailsPage',
                                          queryParams: {
                                            'projectRef': serializeParam(
                                              mobileViewProjectsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'projectRef':
                                                mobileViewProjectsRecord,
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    mobileViewProjectsRecord
                                                        .projectName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 0, 0),
                                                    child: Text(
                                                      '${mobileViewProjectsRecord.numberTasks?.toString()} tasks',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Space Grotesk',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final members =
                                                        mobileViewProjectsRecord
                                                            .usersAssigned!
                                                            .toList();
                                                    return Container(
                                                      width: 150,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        children: List.generate(
                                                            members.length,
                                                            (membersIndex) {
                                                          final membersItem =
                                                              members[
                                                                  membersIndex];
                                                          return StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    membersItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Container(
                                                                    width: 36,
                                                                    height: 36,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl!,
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'relative',
                                                      mobileViewProjectsRecord
                                                          .lastEdited!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 16),
                                            child: LinearPercentIndicator(
                                              percent:
                                                  functions.projectStatusalt(
                                                      mobileViewProjectsRecord
                                                          .numberTasks,
                                                      mobileViewProjectsRecord
                                                          .completedTasks),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.88,
                                              lineHeight: 16,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              barRadius: Radius.circular(12),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
