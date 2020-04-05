.pragma library

function getRandomNum(Min, Max) {
    var Range = Max - Min;
    var rand = Math.random();
    return (Min + Math.round(rand * Range));
}
