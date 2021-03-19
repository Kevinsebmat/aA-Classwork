const View = require('./ttt-view')
const Game = require('./game')

  $(() => {
    
    const game = new Game();
    const container = $('.ttt');
    const view = new View(game, container);
    

  });
