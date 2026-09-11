using Godot;
using System.Collections.Generic;

// Godot 4 requires the 'partial' keyword on Node classes
public partial class RoomManager : Node2D 
{
    private List<string> inventory = new List<string>();

    // [Export] makes this field visible in Godot's Inspector panel
    [Export]
    private Node2D keyObject;

    public void OnKeyClick()
    {
        inventory.Add("Rusty Key");
        
        if (keyObject != null)
        {
            // Godot uses Hide() instead of SetActive(false)
            keyObject.Hide();
        }

        // Godot's print statement
        GD.Print("Picked up Rusty Key!");
    }

    public void OnDoorClick()
    {
        if (inventory.Contains("Rusty Key"))
        {
            GD.Print("Door unlocked! Moving to Room 2.");
            
            // Godot's scene loading method
            GetTree().ChangeSceneToFile("res://Scenes/Room2.tscn");
        }
        else
        {
            GD.Print("The door is locked tight...");
        }
    }
}
