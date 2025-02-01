function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  //Get the global bounds of both objects
  var bounds1:Rectangle = obj1.getBounds(obj1.stage);
  var bounds2:Rectangle = obj2.getBounds(obj2.stage);
  return bounds1.intersects(bounds2);
}

//Alternative solution using localToGlobal() and globalToLocal() for more precise control:
function checkCollision2(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var point1:Point = new Point(obj1.x, obj1.y);
  var point2:Point = new Point(obj2.x, obj2.y);
  
  //Convert point from obj2's coordinate space to obj1's coordinate space
  var globalPoint2 = obj2.localToGlobal(point2);
  var localPoint2 = obj1.globalToLocal(globalPoint2);

  var bounds1:Rectangle = obj1.getBounds(obj1);
  
  if(bounds1.contains(localPoint2.x, localPoint2.y)) return true;
  
  //To handle rotated objects, you'd have to use a more sophisticated approach
  //like hitTestObject() or creating bounding circles

  return false;
}

//Example usage that would now work correctly
var sprite1:Sprite = new Sprite();
var sprite2:Sprite = new Sprite();

addChild(sprite1);
var container:Sprite = new Sprite();
addChild(container);
container.addChild(sprite2);

if(checkCollision(sprite1,sprite2) || checkCollision2(sprite1, sprite2)){trace("Collision detected");}

