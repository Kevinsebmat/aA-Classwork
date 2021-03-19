class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  
  
    
    
    this.mark = 'x'
  
    let board= this.setupBoard();
    $el.append(board)
    this.bindEvents();


  }

  bindEvents() {
    let ul = $('ul')
    ul.on('click', 'li' , (event) => {
      this.makeMove(event.target);
    });
    
  }

  makeMove($square) {
    $square = $($square)
    $square.addClass('clicked')
    
   const pos = $square.data('pos');
    this.game.playMove(pos);
    // $square.text(this.mark);

    // if (this.mark === 'x') {

    // }



  }

  setupBoard() {
    let ul = $('<ul>')
    for(let row = 0; row < 3; row ++){
      for(let col = 0; col < 3; col++){
        
        let li = $('<li>')
        li.data('pos', [row, col])
        ul.append(li)
      }
    }
    return ul;

  }



}


  

module.exports = View;
