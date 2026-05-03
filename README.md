# 🚗 Garajul Meu

O aplicație cross-platform (mobil și web) pentru gestionarea vehiculelor familiei — urmărește datele de expirare ale asigurării, ITP-ului, rovinietei și istoricul de mentenanță. Primești notificări înainte ca documentele să expire.

> **Aplicația este destinată utilizatorilor din România** și folosește terminologia specifică pieței auto românești (ITP, Rovinieta, RCA). Interfața este în limba română.

Construită cu Flutter + Firebase, funcționează pe Android, iOS și Web.

---

## ✨ Funcționalități

- 🔐 Autentificare cu Google
- 🚘 Gestionarea mai multor vehicule ale familiei
- 📄 Urmărirea datelor de expirare ale documentelor (RCA, ITP, Rovinieta)
- 🔧 Istoric de mentenanță (schimburi de ulei, filtre, frâne, etc.)
- 🔔 Notificări push înainte ca documentele să expire
- 🌐 Sincronizare în timp real pe toate dispozitivele
- 🌙 Temă Dark / Light

---

## 🛠 Tech Stack

| Layer            | Tehnologie                         |
| ---------------- | ---------------------------------- |
| Framework        | Flutter (Android + iOS + Web)      |
| Autentificare    | Firebase Auth + Google Sign-In     |
| Bază de date     | Cloud Firestore                    |
| Notificări push  | Firebase Cloud Messaging           |
| State Management | Riverpod                           |
| Logică backend   | Firebase Cloud Functions (Node.js) |
| Web Hosting      | Firebase Hosting                   |

---

## 🚀 Instalare și rulare

### Cerințe prealabile

- [Flutter](https://flutter.dev/docs/get-started/install) (canal stable)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)
- Un proiect Firebase cu următoarele activate:
  - Authentication (Google Sign-In)
  - Cloud Firestore
  - Cloud Messaging

### Pași de instalare

**1. Clonează repository-ul**

```bash
git clone https://github.com/ionutdr23/garajulmeu.git
cd garajulmeu
```

**2. Instalează dependențele**

```bash
flutter pub get
```

**3. Configurează Firebase**

Autentifică-te în Firebase și rulează FlutterFire CLI pentru a genera `firebase_options.dart`:

```bash
firebase login
flutterfire configure
```

Selectează proiectul tău Firebase și alege Android, iOS și Web ca platforme țintă.

**4. Adaugă configurația Android**

Descarcă `google-services.json` din setările proiectului Firebase și plasează-l la:

```
android/app/google-services.json
```

**5. Adaugă configurația iOS**

Descarcă `GoogleService-Info.plist` din setările proiectului Firebase și plasează-l la:

```
ios/Runner/GoogleService-Info.plist
```

**6. Rulează aplicația**

```bash
# Android
flutter run -d <device_id>

# Web
flutter run -d chrome

# Listează dispozitivele disponibile
flutter devices
```

---

## 📁 Structura proiectului

```
lib/
├── main.dart                  # Punct de intrare
├── firebase_options.dart      # Generat de FlutterFire CLI (nu este committed)
├── theme.dart                 # Tema aplicației (Dracula dark/light)
├── models/                    # Modele de date
│   ├── car.dart
│   ├── document.dart
│   └── maintenance.dart
├── repositories/              # Strat de date Firestore
│   ├── car_repository.dart
│   └── maintenance_repository.dart
├── providers/                 # State management cu Riverpod
│   ├── auth_provider.dart
│   ├── car_provider.dart
│   └── maintenance_provider.dart
├── screens/                   # Ecranele aplicației
│   ├── home/
│   │   └── home_screen.dart
│   ├── auth/
│   │   └── login_screen.dart
│   ├── cars/
│   │   ├── cars_screen.dart
│   │   └── car_detail_screen.dart
│   └── maintenance/
│       └── maintenance_screen.dart
└── widgets/                   # Componente reutilizabile
    ├── car_card.dart
    └── document_card.dart
```

---

## 🔒 Securitate

Acest proiect folosește Firebase Security Rules pentru a garanta că utilizatorii pot accesa doar datele lor proprii. Fișierele de configurare sensibile sunt excluse din controlul versiunilor:

- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

---

## 📱 Screenshots

> În curând

---

## 🤝 Contribuții

Proiectul este momentan privat, dar va deveni open-source în viitor. Contribuțiile, issue-urile și cererile de funcționalități sunt binevenite.

---

## 📄 Licență

MIT License — vezi [LICENSE](LICENSE) pentru detalii.

---

_Construit cu ❤️ pentru garajul familiei românești_
