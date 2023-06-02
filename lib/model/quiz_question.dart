class QuizQuestion {

//
  const QuizQuestion(this.question, this.answer);


// 
//
  final String question;
  //
  // a list of answers with the correct one at index[0]
  final List<String> answer;

  // creating a shuffled answer list
  List<String> getShuffledAnswers() {
    // List.of makes a copy of the original list of answer
    final shuffledAnswer = List.of(answer);
    // .shuffle() shuffles the newly copied list and is returned as shuffled
    shuffledAnswer.shuffle();
   return shuffledAnswer;
  }
}


