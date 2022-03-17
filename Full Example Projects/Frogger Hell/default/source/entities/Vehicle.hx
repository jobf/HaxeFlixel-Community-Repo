package entities;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxPath;

class Vehicle extends FlxSprite {
    var originX:Int;
    var originY:Int;
    var originVelocity:Float;

    public var isWaiting:Bool;

    public function new(startX:Int, startY:Int, startVelocity:Float, ?asset:FlxGraphicAsset, destinations:Array<FlxPoint>) {
        super(startX, startY, asset);
        originX = startX;
        originY = startY;
        originVelocity = startVelocity;
        isWaiting = true;
        this.path = new FlxPath(destinations);
        this.path.onComplete = path -> this.resetToOrigin();
    }

    public function resetToOrigin():Void {
        x = originX;
        y = originY;
        velocity.x = 0;
        velocity.y = 0;
        isWaiting = true;
    }

    public function start() {
        startMovingToDestination();
        isWaiting = false;
    }

    public inline function isMoving():Bool {
        return velocity.x != 0 || velocity.y != 0;
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }

    function startMovingToDestination() {
        final autoRotate = true;
        path.start(originVelocity, autoRotate);
    }
}
