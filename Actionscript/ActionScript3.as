package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class MainGame extends MovieClip {

        // Simple array to track player inventory
        private var inventory:Array = [];

        public function MainGame() {
            // Initialize room listeners
            setupRoom1();
        }

        private function setupRoom1():void {
            // "door_btn" and "key_btn" are MovieClips/Buttons placed on the Stage
            door_btn.addEventListener(MouseEvent.CLICK, onDoorClick);
            key_btn.addEventListener(MouseEvent.CLICK, onKeyClick);
        }

        private function onKeyClick(e:MouseEvent):void {
            // Add key to inventory
            inventory.push("Rusty Key");
            
            // Hide the key object so it can't be picked up again
            key_btn.visible = false;
            
            // Remove listener
            key_btn.removeEventListener(MouseEvent.CLICK, onKeyClick);
            
            trace("Picked up Rusty Key!");
        }

        private function onDoorClick(e:MouseEvent):void {
            // Check if player has the key required to progress
            if (inventory.indexOf("Rusty Key") >= 0) {
                trace("Door unlocked! Moving to Room 2.");
                
                // Jump the Flash timeline to the frame named "Room2"
                gotoAndStop("Room2");
            } else {
                trace("The door is locked tight...");
            }
        }
    }
}
