var SCREEN_SIZE = 500;
var SIDE_CELLS = 200;
var CELL_SIZE = SCREEN_SIZE / SIDE_CELLS;
var FPS = 200;
var canvas;
var context;
var dirs = [
    {'row': -1, 'col': 0},
    {'row': 0, 'col': 1},
    {'row': 1, 'col': 0},
    {'row': 0, 'col': -1}
];

window.onload = function() {
    canvas = document.getElementById('world');
    context = canvas.getContext('2d');
    canvas.width = canvas.height = SCREEN_SIZE;
    var scaleRate = Math.min(window.innerHeight/SCREEN_SIZE, window.innerHeight/SCREEN_SIZE);
    canvas.style.height = canvas.style.width = SCREEN_SIZE*scaleRate + 'px';
    var field = new Array(SIDE_CELLS);
    for(var i = 0;  i < SIDE_CELLS; i++) {
        field[i] = new Array(SIDE_CELLS);
        for(var j = 0; j < SIDE_CELLS; j++) {
            field[i][j] = 0;
        }
    }
    var ant = {'dir': 0, 'row': SIDE_CELLS/2-1,'col': SIDE_CELLS/2-1}
    simulate(field, ant);
};

function simulate(field, ant) {
    if(field[ant.row][ant.col]) {
        ant.dir --;
        context.fillStyle = 'rgb(0, 0, 0)';
    } else {
        ant.dir ++;
        context.fillStyle = 'rgb(0, 255, 255)';
    }
    field[ant.row][ant.col] = 1 - field[ant.row][ant.col];
    context.fillRect(ant.col*CELL_SIZE, ant.row*CELL_SIZE, CELL_SIZE,CELL_SIZE);
    ant.dir = (ant.dir+4)%4;
    ant.row += dirs[ant.dir].row;
    ant.col += dirs[ant.dir].col;
    context.fillStyle = 'rgb(0, 0, 255)';
    context.fillRect(ant.col*CELL_SIZE, ant.row*CELL_SIZE, CELL_SIZE, CELL_SIZE);
    if(ant.row < 0 || ant.row >= SIDE_CELLS || ant.col < 0 || ant.col >= SIDE_CELLS) {
        alert("アリはそそくさと逃げて行きました。");
    } else {
        setTimeout(simulate, 1000/FPS, field, ant);
    }
}