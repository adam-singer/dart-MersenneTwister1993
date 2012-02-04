#import('MersenneTwister19937.dart');

// Calculates the chi-square value for N positive integers less than r
// Source: "Algorithms in C" - Robert Sedgewick - pp. 517
// NB: Sedgewick recommends: "...to be sure, the test should be tried a few times,
// since it could be wrong in about one out of ten times."
bool IsRandom(List randomNums, int r) {
  
  var N = randomNums.length;
  
  if (N <= 10*r) {
    print("N <= 10*r : return false");
    return false; 
  }
  
  double N_r = N/r;
  double chi_square = 0;
  Map HT = RandomFrequency(randomNums);
  double f;
  
  HT.forEach((var k, var v) {
    f = v - N_r;
    chi_square += Math.pow(f, 2);
  });
  
  chi_square = chi_square / N_r;
  
  if((r - 2 * Math.sqrt(r) <= chi_square) && (r + 2 * Math.sqrt(r) >= chi_square)) {
    return true;
  } else {
    return false;
  }
   
}

//Gets the frequency of occurrence of a randomly generated array of integers
//Output: A hashtable, key being the random number and value its frequency
Map RandomFrequency(List randomNums) {
 Map HT = new Map();
 var N = randomNums.length;
 
 for (var i = 0; i<= N -1; i++) {
   if (HT.containsKey(randomNums[i])) {
     HT[randomNums[i]] = HT[randomNums[i]] + 1;
   } else {
     HT[randomNums[i]] = 1;
   }
 }
 
 print(HT.length);
 return HT;
}


main() {
  MersenneTwister19937 mt1 = new MersenneTwister19937();
  var l = new List();
  l.add(new Date.now().value);
  l.add(0x123);
  l.add(0x234);
  l.add(0x345);
  l.add(0x456);
  mt1.init_by_array(l, l.length);
  //print(mt1.genrand_int32());
  List m = new List();
  for(var i=0; i<1000000; i++) {
    m.add(mt1.genrand_int32());
  }
  
  if (IsRandom(m, 100)) {
    print("is random");
  } else {
    print("is not random");
  }
}
