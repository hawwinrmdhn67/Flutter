# 📱 Flutter Login App (BLoC + API)

Aplikasi Flutter sederhana menggunakan State Management BLoC dengan integrasi API login.

## 🚀 Fitur Utama
- Login menggunakan API (DummyJSON)
- State management menggunakan BLoC
- Navigasi antar halaman
- Error handling (login gagal)
- UI sederhana & clean

## 🧱 Struktur Project

```
lib/
│
├── bloc/
│   ├── login_bloc.dart
│   ├── login_event.dart
│   └── login_state.dart
│
├── pages/
│   ├── login_page.dart
│   └── profile.dart
│
├── services/
│   └── api_service.dart
│
├── routes.dart
└── main.dart
```

## 🔄 Flow Aplikasi (BLoC)

```
User Input (LoginPage)
        ↓
LoginButtonPressed (Event)
        ↓
LoginBloc (Process Logic)
        ↓
ApiService (Call API)
        ↓
LoginState (Result)
        ↓
UI Update (Success / Error)
```

## 🧠 Penjelasan BLoC

### Event
Event adalah aksi dari user.

Contoh:
```dart
LoginButtonPressed(username, password)
```

### Bloc
Bloc memproses event dan mengubah state.

```dart
emit(LoginLoading());
emit(LoginSuccess(user));
emit(LoginFailure(error));
```

### State
State adalah kondisi yang dikirim ke UI.

- LoginInitial → kondisi awal  
- LoginLoading → proses login  
- LoginSuccess → login berhasil  
- LoginFailure → login gagal  

## 🌐 API yang Digunakan

Endpoint:
```
https://dummyjson.com/auth/login
```

Contoh request:
```json
{
  "username": "emilys",
  "password": "emilyspass"
}
```

## 🔐 Login Akun

```
username: emilys
password: emilyspass
```

## 🔁 Alur Navigasi

```
LoginPage → (Login Success) → ProfilePage
```

## 🎯 Tujuan Penggunaan BLoC

- Memisahkan UI dan Business Logic  
- Membuat kode lebih rapi dan scalable  
- Mempermudah maintenance  
