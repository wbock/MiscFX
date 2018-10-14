// Lindemeyer system - Generate instructions for recursive patterns

class LSystem {
  
  String[] sentences;
  Rule[] ruleSet;
  StringBuffer next;

  LSystem(String axiom, Rule[] rules, int iterations) {
    sentences = new String[iterations+1];
    sentences[0] = axiom;
    ruleSet = rules;
    next = new StringBuffer();
    
    //generate all sentences
    for(int ii = 0; ii < iterations; ii++) {
      
      next.setLength(0);
      
      // go through each char in a sentence
      for(int i=0; i < sentences[ii].length(); i++) {
          char current = sentences[ii].charAt(i);
          String replace = new String();
          replace = "" + current;
           
          // check all rules, use first one that applies
          for(Rule rule : ruleSet) {
            char a = rule.getA();
            if (a == current) {
              replace = rule.getB();
              break; 
            }
          }
          
          next.append(replace);
      }
      
      sentences[ii+1] = next.toString();
  }
  
  }
  
  String getSentence(int i) {
    if(i<sentences.length) {
      // return specific sentence
      return sentences[i];
    } else {
      // return max if out of bounds
      return sentences[sentences.length-1];
    }
  }
}
