class Profile{
   String gender;
   int age;
   String training;
   String level;
   int days;
   String goals;


  Profile({this.gender, this.age, this.training , this.level, this.days, this.goals});

  // method to convert object into map to store on firebase.
  Map<String, dynamic> toJson(){
    return {
      'gender': gender,
      'age':age,
      'training':training,
      'level': level,
      'days': days,
      'goals': goals
    };
  }

  // factory method to read map (coming from firebase) and converting it into object.
  factory Profile.fromJson(Map<String, dynamic> map)
  {
    return Profile(
        gender: map['gender'],
        age: map['age'],
        training: map['training'],
        level: map['level'],
        days: map['days'],
        goals:map['goals']
    );
  }
}