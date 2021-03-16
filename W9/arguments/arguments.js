let sum = function(...arguments) {
  let totalSum = 0;
  for (let i = 0; i < arguments.length; i++) {totalSum += arguments[i];}
  return totalSum;
};

Function.prototype.myBind = function(context, ...arguments) {
  let args = []
  for (let i = 0; i < arguments.length; i++) {
    args.push(arguments[i]);
  }
  let that = this;
  return function(...arguments) {
    for (let i = 0; i < arguments.length; i++) {
      args.push(arguments[i]);
    }
    // console.log(args);
    that.apply(context, args);
  }
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


// console.log(sum(1,2,3,4));

function curriedSum(numArgs){
  const numbers = [];
  function _curriedSum(num){
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach((ele) => {sum += ele;});
      return sum;
    } else {
      return _curriedSum;
    }
    
  }
  return _curriedSum;
}

// const total = curriedSum(4);
// console.log(total(5)(30)(20)(1)); // => 56

Function.prototype.curry(numArgs) {
  const numbers = [];
  const that = this;
  function _curry(arg) {
    numbers.push(arg);
    if (numbers.length === numArgs){
      return that.apply(null,numbers);
    } else {return _curry;}
  }
  return _curry;
}

Function.prototype.curryRest(numArgs) {
  const numbers = [];
  const _curry = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      return this(...numbers);
    } else { return _curry;}
  }
  return _curry;
}

