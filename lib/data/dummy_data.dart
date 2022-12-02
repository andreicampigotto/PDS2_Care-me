import 'package:care/models/allergy.dart';
import 'package:care/models/appointment.dart';
import 'package:care/models/disease.dart';
import 'package:care/models/drug.dart';
import 'package:care/models/user.dart';

final DAMMY_DISEASES = [
  Disease(
    diseaseId: 'xx001',
    name: 'Gripe',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
  Disease(
    diseaseId: 'xx002',
    name: 'Labirintite',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
  Disease(
    diseaseId: 'xx003',
    name: 'Faringite',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
  Disease(
    diseaseId: 'xx004',
    name: 'Faringite',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
];

final DAMMY_DRUGS = [
  Drug(
    drugId: 'xx001',
    name: 'Menezulida',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: true,
    active: false,
  ),
  Drug(
    drugId: 'xx002',
    name: 'Ruacutan',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: true,
    active: true,
  ),
  Drug(
    drugId: 'xx003',
    name: 'benegripe',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: false,
    active: true,
  ),
];

final DAMMY_ALLERGIES = [
  Allergy(
    allergyId: 'xx001',
    name: 'Caspa de gato',
    description: 'Caspa de gato',
    date: DateTime.now(),
  ),
  Allergy(
    allergyId: 'xx002',
    name: 'Dipirona',
    description: 'Constatado a aproximado 5 anos',
    date: DateTime.now(),
  ),
  Allergy(
    allergyId: 'xx003',
    name: 'Setralia',
    description: ' Alergia a Setralina',
    date: DateTime.now(),
  ),
  Allergy(
    allergyId: 'xx004',
    name: 'polen',
    description: 'polen de macieira',
    date: DateTime.now(),
  ),
];

final DAMMY_APPOINTMENT = [
  Appointment(
    appointmentId: 'xx001',
    bloodPressure: '12/8',
    comments: 'edocrino, reovou recomedacao para romar pura',
    doctor: 'jose arantes',
    date: DateTime.now(),
    weight: 70.5,
  ),
  Appointment(
    appointmentId: 'xx002',
    bloodPressure: '12/8',
    comments: 'oftamologista, almentou o grau do oculos',
    doctor: 'jose arantes',
    date: DateTime.now(),
    weight: 70.5,
  ),
  Appointment(
    appointmentId: 'xx003',
    bloodPressure: '12/8',
    comments: 'urologista, tudo certo',
    doctor: 'jose arantes',
    date: DateTime.now(),
    weight: 70.5,
  ),
  Appointment(
    appointmentId: 'xx004',
    bloodPressure: '12/8',
    comments: 'cardiologista, fiz teste de esteira',
    doctor: 'jose arantes',
    date: DateTime.now(),
    weight: 70.5,
  ),
  Appointment(
    appointmentId: 'xx005',
    bloodPressure: '12/8',
    comments: 'teste teste  teste  teste teste teste teste teste teste teste ',
    doctor: 'jose arantes',
    date: DateTime.now(),
    weight: 70.5,
  ),
];

final DAMMY_USER = [
  User(
    userId: 'xx001',
    imageUrl:
        'https://www.thoughtco.com/thmb/51xXQ9UAXIVrPVWHdvBfsyASDz4=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GilligansEthicsofCare-5148d189f3fa4143a098184dc8a92b8d.jpg',
    fullName: 'Jose da Silva',
    birthday: DateTime.now(),
    emergencyPhone: '47 99999-9999',
    bloodType: 'A+',
    height: 1.72,
  ),
];
