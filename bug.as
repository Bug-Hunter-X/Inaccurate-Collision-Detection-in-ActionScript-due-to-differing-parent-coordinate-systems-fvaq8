function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var bounds1:Rectangle = obj1.getBounds(obj1.parent);
  var bounds2:Rectangle = obj2.getBounds(obj2.parent);
  return bounds1.intersects(bounds2);
}

//This function is problematic because getBounds() returns a rectangle relative to the object's parent. 
//If obj1 and obj2 have different parents, their coordinates are not in the same coordinate space, 
//leading to inaccurate collision detection.  

//Example usage that would cause issues:

var sprite1:Sprite = new Sprite();
var sprite2:Sprite = new Sprite();

addChild(sprite1);
var container:Sprite = new Sprite();
addChild(container);
container.addChild(sprite2);

//Collision check between sprites in different coordinate systems will be incorrect:
if(checkCollision(sprite1,sprite2)){trace("Collision detected");}

