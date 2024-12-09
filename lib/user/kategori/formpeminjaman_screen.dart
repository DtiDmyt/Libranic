import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:libranic/user/kategori/widget/komiknovelgrafis_screen.dart';

class FormPeminjamanScreen extends StatefulWidget {
  final String bookTitle;
  final String bookCover;

  const FormPeminjamanScreen({
    Key? key,
    required this.bookTitle,
    required this.bookCover,
  }) : super(key: key);

  @override
  _FormPeminjamanScreenState createState() => _FormPeminjamanScreenState();
}

class _FormPeminjamanScreenState extends State<FormPeminjamanScreen> {
  final _nameController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  String? _selectedClass;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startDate = _findNextValidDate(_startDate);
    _startDateController.text = DateFormat('yyyy/MM/dd').format(_startDate);
    _endDate = _calculateInitialEndDate(_startDate, _selectedClass);
    _endDateController.text = DateFormat('yyyy/MM/dd').format(_endDate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  void _calculateBorrowingDuration() {
    setState(() {
      _endDate = _calculateInitialEndDate(_startDate, _selectedClass);
      _endDateController.text = DateFormat('yyyy/MM/dd').format(_endDate);
    });
  }

  DateTime _calculateInitialEndDate(DateTime startDate, String? selectedClass) {
    switch (selectedClass) {
      case 'Guru':
        return startDate.add(const Duration(days: 180));
      case 'TU':
        return startDate.add(const Duration(days: 30));
      default:
        return startDate.add(const Duration(days: 7));
    }
  }

  DateTime _findNextValidDate(DateTime date) {
    while (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  void _showConfirmationAlert() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Terima Kasih!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        ),
        content: Text(
          "Terimakasih atas permintaan peminjaman buku Si Anak Cahaya. Mohon tunggu konfirmasi dari pustakawan kami. Anda akan menerima notifikasi setelah permintaan disetujui. 😊",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Menutup dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => KomiknovelgrafisScreen()), // Ganti MainPage dengan halaman utama Anda
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Oke",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Form Peminjaman Buku"),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.bookCover,
                  height: 200,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.bookTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value;
                    _calculateBorrowingDuration();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Kelas/Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: [
                  'Guru',
                  'TU',
                  '10 PPLG 1',
                  '10 PPLG 2',
                  '10 PPLG 3',
                  '10 ANM 1',
                  '10 ANM 2',
                  '10 BCF 1',
                  '10 BCF 2',
                  '10 TO 1',
                  '10 TO 2',
                  '10 TPFL 1',
                  '10 TPFL 2',
                  '11 PPLG 1',
                  '11 PPLG 2',
                  '11 PPLG 3',
                  '11 ANM 1',
                  '11 ANM 2',
                  '11 BCF 1',
                  '11 BCF 2',
                  '11 TO 1',
                  '11 TO 2',
                  '11 TPFL 1',
                  '11 TPFL 2',
                  '12 PPLG 1',
                  '12 PPLG 2',
                  '12 PPLG 3',
                  '12 ANM 1',
                  '12 ANM 2',
                  '12 BCF 1',
                  '12 BCF 2',
                  '12 TO 1',
                  '12 TO 2',
                  '12 TPFL 1',
                  '12 TPFL 2'
                ]
                    .map((className) => DropdownMenuItem(
                          value: className,
                          child: Text(className),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                readOnly: true,
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Peminjaman',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _startDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _startDate = pickedDate;
                          _startDateController.text =
                              DateFormat('yyyy/MM/dd').format(pickedDate);
                          _calculateBorrowingDuration();
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                readOnly: true,
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Pengembalian',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty || _selectedClass == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lengkapi semua data terlebih dahulu."),
                      ),
                    );
                  } else {
                    _showConfirmationAlert();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue[600],
                ),
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
