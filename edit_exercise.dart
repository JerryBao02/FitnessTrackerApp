import 'package:flutter/material.dart';

class EditExerciseScreen extends StatefulWidget {
  @override
  _EditExerciseScreenState createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedExercise = 'Bench Press';

  List<Map<String, dynamic>> _exerciseSets = [
    {'sets': 1, 'reps': 10, 'weight': 100},
  ];

  final List<String> _exerciseOptions = [
    'Bench Press',
    'Squat',
    'Deadlift',
    'Overhead Press',
  ];

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _addSet() {
    setState(() {
      _exerciseSets.add({'sets': 1, 'reps': 10, 'weight': 100});
    });
  }

  void _removeSet(int index) {
    setState(() {
      _exerciseSets.removeAt(index);
    });
  }

  void _editSet(int index, String field, dynamic value) {
    setState(() {
      _exerciseSets[index][field] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Exercise'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Date:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDate,
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Time:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickTime,
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.access_time, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  MaterialLocalizations.of(context).formatTimeOfDay(_selectedTime),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Exercise:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedExercise,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fitness_center, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: _exerciseOptions.map((exercise) {
                return DropdownMenuItem<String>(
                  value: exercise,
                  child: Text(exercise),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedExercise = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Sets        Reps        Weight',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _exerciseSets.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: _exerciseSets[index]['sets'].toString(),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) => _editSet(index, 'sets', int.tryParse(value) ?? 1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: _exerciseSets[index]['reps'].toString(),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) => _editSet(index, 'reps', int.tryParse(value) ?? 10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: _exerciseSets[index]['weight'].toString(),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) => _editSet(index, 'weight', int.tryParse(value) ?? 100),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => _removeSet(index),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: _addSet,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Set'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save functionality can go here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
