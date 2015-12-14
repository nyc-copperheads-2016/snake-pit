function Snake(args) {
  this.name = args.name;
  this.age  = args.age;
}

Snake.prototype.hiss = function() {
  return this.name + " says: Hissssss";
}

Snake.prototype.say_this = function() {
  debugger
}

var snake = new Snake();
