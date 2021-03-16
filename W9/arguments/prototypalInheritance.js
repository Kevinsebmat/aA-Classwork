// Function.prototype.inherits = function (object){
//     function Surrogate() {}
//     Surrogate.prototype = object.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }




Function.prototype.inherits = function (object){
    function Surrogate() {}
    this.prototype = Object.create(object.prototype);
    // this.prototype.constructor = this;
}


function MovingObject (name) {
    this.name = "franky";
    // console.log(this.name)
}

let move = new MovingObject();

function Ship () {MovingObject.call(this)}
// move(){
//     console.log(`${this.name} is moving.`)
// }
Ship.inherits(MovingObject);
let newShip = new Ship();
console.log(newShip.name);

function Asteroid () {MovingObject.call(this)}
Asteroid.inherits(MovingObject);

let newrock = new Asteroid() ;
console.log(newrock.name);