import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:adopt/widgets/profile_info_widget.dart';

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockFirestore extends Mock implements FirebaseFirestore {}

void main() {
  const String mockShelterId = 'shelterId';

  late MockFirestore mockFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirestore = MockFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

  testWidgets('ProfileInfo shows shelter info when data is available',
          (WidgetTester tester) async {
        // Mock data
        final mockData = {
          'name': 'Mock Shelter Name',
          'address': 'Mock Shelter Address',
          'email': 'Mock Shelter Email',
          'phone': 'Mock Shelter Phone',
        };
        when(mockDocumentSnapshot.data()).thenReturn(mockData);
        when(mockDocumentReference.snapshots()).thenAnswer((_) => Stream.value(mockDocumentSnapshot));

        when(mockFirestore.collection('shelter')).thenReturn(mockCollectionReference as CollectionReference<Map<String, dynamic>>);
        when(mockCollectionReference.doc(mockShelterId)).thenReturn(mockDocumentReference);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ProfileInfo(shelterId: mockShelterId),
            ),
          ),
        );

        expect(find.text(mockData['name']!), findsOneWidget);
        expect(find.text(mockData['address']!), findsOneWidget);
        expect(find.text(mockData['email']!), findsNothing);
        expect(find.text(mockData['phone']!), findsOneWidget);
      });

  testWidgets('ProfileInfo shows CircularProgressIndicator when data is not available', (WidgetTester tester) async {

        when(mockDocumentReference.snapshots()).thenAnswer((_) => const Stream.empty());
        when(mockFirestore.collection('shelter')).thenReturn(mockCollectionReference as CollectionReference<Map<String, dynamic>>);
        when(mockCollectionReference.doc(mockShelterId)).thenReturn(mockDocumentReference);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ProfileInfo(shelterId: mockShelterId),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
}
