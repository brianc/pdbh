$(function(){
  var sl = new SWFObject('player.swf','ply','370','100','9','#FFFFFF');
  sl.addParam('allowscriptaccess','always');
  sl.addParam('wmode','opaque');
  sl.addParam('flashvars',"config=config.xml");
  sl.write('mediaspace');
});
var player;
function x(obj){
  console.log(player.getPlaylist()[obj.index]);
}
function playerReady(obj){
  player = document.getElementById(obj['id']);
  player.addControllerListener("ITEM","x");
  $("a").click(function(){
    player.sendEvent("LOAD",this.href);
    player.sendEvent("PLAY");
    return false;
  });
}
