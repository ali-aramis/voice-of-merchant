import 'package:flutter/material.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/validators/validators.dart';
import '../home/home_footer.dart';
import '../home/home_header.dart';
import 'data/models/case_model.dart';
import 'track_case_controller.dart';

class TrackCaseScreen extends StatefulWidget {
const TrackCaseScreen({super.key});

@override
State<TrackCaseScreen> createState() => _TrackCaseScreenState();
}

class _TrackCaseScreenState extends State<TrackCaseScreen> {
final _formKey = GlobalKey<FormState>();

final TrackCaseController _controller = TrackCaseController();

final _referenceController = TextEditingController();
final _contactController = TextEditingController();
final _crController = TextEditingController();

AppLocalizations get l10n => AppLocalizations.of(context)!;

@override
void dispose() {
_referenceController.dispose();
_contactController.dispose();
_crController.dispose();
_controller.dispose();

super.dispose();
}

Future<void> _validateForm() async {
if (!_formKey.currentState!.validate()) {
return;
}

FocusScope.of(context).unfocus();

await _controller.trackCase(
referenceNumber: _referenceController.text.trim(),
contact: _contactController.text.trim(),
crNumber: _crController.text.trim(),
unableToFindCaseMessage: l10n.unableToFindCase,
somethingWentWrongMessage: l10n.somethingWentWrongTryAgain,
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4F6FC),
body: Column(
children: [
const HomeHeader(),

Expanded(
child: SingleChildScrollView(
keyboardDismissBehavior:
ScrollViewKeyboardDismissBehavior.onDrag,
child: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 24,
vertical: 40,
),
child: Center(
child: ConstrainedBox(
constraints: const BoxConstraints(
maxWidth: 800,
),
child: AnimatedBuilder(
animation: _controller,
builder: (context, child) {
return Column(
children: [
_buildTrackCaseCard(),

if (_controller.errorMessage != null) ...[
const SizedBox(height: 16),
_buildErrorMessage(
_controller.errorMessage!,
),
],

if (_controller.caseData != null) ...[
const SizedBox(height: 24),
_buildCaseResult(
_controller.caseData!,
),
],

const SizedBox(height: 40),
],
);
},
),
),
),
),
),
),

const HomeFooter(),
],
),
);
}

Widget _buildTrackCaseCard() {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.05),
blurRadius: 20,
offset: const Offset(0, 8),
),
],
),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Center(
child: Icon(
Icons.search,
size: 50,
color: Color(0xFF1A2A5E),
),
),

const SizedBox(height: 16),

Center(
child: Text(
l10n.trackYourCase,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 26,
fontWeight: FontWeight.bold,
color: Color(0xFF1A2A5E),
),
),
),

const SizedBox(height: 8),

Center(
child: Text(
l10n.trackCaseDescription,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 15,
color: Colors.grey,
height: 1.5,
),
),
),

const SizedBox(height: 28),

_buildField(
label: l10n.referenceNumber,
controller: _referenceController,
hint: l10n.enterReferenceNumber,
validator: (value) {
return Validators.required(
value,
l10n,
);
},
),

const SizedBox(height: 18),

_buildField(
label: l10n.emailOrMobileNumber,
controller: _contactController,
hint: l10n.enterEmailOrMobileNumber,
validator: (value) {
return Validators.emailOrMobile(
value,
l10n,
);
},
),

const SizedBox(height: 18),

_buildField(
label: l10n.crNumberOptional,
controller: _crController,
hint: l10n.enterCrNumber,
validator: (value) {
return Validators.crNumber(
value,
l10n,
);
},
),

const SizedBox(height: 24),

SizedBox(
width: double.infinity,
height: 52,
child: ElevatedButton(
onPressed: _controller.isLoading
? null
    : _validateForm,
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF1A2A5E),
foregroundColor: Colors.white,
disabledBackgroundColor:
const Color(0xFF1A2A5E).withValues(
alpha: 0.6,
),
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
),
child: _controller.isLoading
? const SizedBox(
width: 22,
height: 22,
child: CircularProgressIndicator(
strokeWidth: 2.5,
color: Colors.white,
),
)
    : Row(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
const Icon(
Icons.search,
size: 21,
),
const SizedBox(width: 8),
Text(
l10n.verifyAndTrack,
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
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

Widget _buildErrorMessage(String message) {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.red.shade50,
borderRadius: BorderRadius.circular(10),
border: Border.all(
color: Colors.red.shade200,
),
),
child: Row(
children: [
Icon(
Icons.error_outline,
color: Colors.red.shade700,
),
const SizedBox(width: 12),
Expanded(
child: Text(
message,
style: TextStyle(
color: Colors.red.shade700,
fontSize: 14,
),
),
),
],
),
);
}

Widget _buildCaseResult(CaseModel caseData) {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.05),
blurRadius: 20,
offset: const Offset(0, 8),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
l10n.caseDetails,
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
color: Color(0xFF1A2A5E),
),
),

const SizedBox(height: 20),

_buildResultRow(
label: l10n.reference,
value: caseData.referenceNumber,
),

const SizedBox(height: 12),

_buildResultRow(
label: l10n.status,
value: caseData.status,
),

const SizedBox(height: 12),

_buildResultRow(
label: l10n.entity,
value: caseData.entity,
),

const SizedBox(height: 12),

_buildResultRow(
label: l10n.subject,
value: caseData.subject,
),

const SizedBox(height: 12),

_buildResultRow(
label: l10n.submitted,
value: caseData.submittedAt,
),
],
),
);
}

Widget _buildResultRow({
required String label,
required String value,
}) {
return Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
SizedBox(
width: 120,
child: Text(
label,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: Color(0xFF1A2A5E),
),
),
),

Expanded(
child: Text(
value,
style: const TextStyle(
fontSize: 14,
color: Colors.black87,
),
),
),
],
);
}

Widget _buildField({
required String label,
required TextEditingController controller,
required String hint,
String? Function(String?)? validator,
}) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
label,
style: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Color(0xFF1A2A5E),
),
),

const SizedBox(height: 8),

TextFormField(
controller: controller,
validator: validator,
decoration: InputDecoration(
hintText: hint,
hintStyle: TextStyle(
color: Colors.grey.shade500,
),
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 16,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(
color: Color(0xFFE3E6EE),
),
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(
color: Color(0xFFE3E6EE),
),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(
color: Color(0xFF1A2A5E),
width: 1.5,
),
),
errorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(
color: Colors.red,
),
),
focusedErrorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(
color: Colors.red,
width: 1.5,
),
),
),
),
],
);
}
}
