void main() async {
  tasks();
}


void tasks() async {
  task1();
  String abc= await task2();
  task3(abc);

}

void task1() {
  print("task1");
}

Future task2() async {
  Duration time=Duration(seconds: 3);
  String result;

  await Future.delayed(time,(){
    result="ha bhai tek hai";
    print("task 2 is complete");

  });
  return result;
}

void task3(String jimmy) {
  print("task 3 $jimmy");
}
