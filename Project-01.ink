/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than sixteen passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

-> main_room

== main_room == 
{You wake up groggy and light-headed. You are standing in a square, plain, cement room, with nothing for forniture but the cot you just rose from. {not keys_pickup:There is set of keys hanging on the wall.} There are no lights, but you somehow have no trouble seeing. The only other features are two doors on opposite sides of the room.|You stand in the main room you woke up in. {not keys_pickup:There is set of keys hanging on the wall.}}
 + [Go through the left door] -> left_stair
 + [Go through the right door] -> right_stair
 * [Take the keys] -> keys_pickup
 
 
 === keys_pickup ===
You take the set of keys. Hopefully they prove useful. 
* [Return to room] -> main_room
-> END
 
 
 == main_room_2 ==
 You wake up groggy and light-headed. You are standing in a square, plain, cement room, with nothing for forniture but the cot you just rose from. {not keys_pickup:There is set of keys hanging on the wall.} There are no lights, but you somehow have no trouble seeing. The only other features are two doors on opposite sides of the room. You don't recognize anything, but you can't help but feel a keen sense of familiarity.
 + [Go through the left door] -> left_stair
 + [Go through the right door] -> right_stair
 * {not keys_pickup}[Take the keys] -> keys_pickup



== left_stair ==
You stand at the bottom of a long stairwell. One that spirals upwards in a square pattern with landings and a door every several steps. 

+ [Climb stairs] -> 1st_left_landing
+ [Return to room] -> main_room
-> END

=== 1st_left_landing ===
A basic landing with a door. 
+ [Open the door] -> locked_message
+ [Ascend further] -> final_landing
+ [Return to room] -> main_room
* {secret_key_get} [Try special key] -> secret_ending
-> END

== secret_ending ==
As you turn the key, you hear a light clicking sound, turn the knob and it opens forward, revealing... your room. In your house. The door shuts swiftly behind you, and your memories come rushing back. You quickly open it back up to reveal what closed it, but find nothing inside but the contents of your closet, and one key hanging from a coatrack. 
-> END

=== locked_message ===
{not keys_pickup:The door is locked, and you have nothing to unlock it with.}
{keys_pickup:You try all of the keys, but none seem to work.}
+ [Go back] -> 1st_left_landing
-> END

=== final_landing ===
A basic landing with a door. 
+ [Open the door] -> door_unlocked
+ [Go back] -> 1st_left_landing
+ [Ascend further] -> namenotimportantgottafinish
+ [Return to room] -> main_room
-> END

=== namenotimportantgottafinish ===
The staircase abruptly ends in a solid cement wall.
+ [Go back] -> final_landing
-> END





== right_stair ==
You stand at the top of a long stairwell. One that spirals downwards in a square pattern with landings and a door every several steps. 
+ [Descend stairs] -> 1st_right_landing
+ [Return to room] -> main_room
-> END

=== 1st_right_landing ===
A basic landing with a door. 
+ {not secret_room} [Open the door] -> locked_message_2
+ {secret_room} [Open the door] -> secret_room
+ {main_room_2} {not secret_room} [Investigate door] -> door_investigate
+ [Descend further] -> cliff_area
+ [Return to room] -> main_room
-> END

=== locked_message_2 ===
{not keys_pickup:The door is locked, and you have nothing to unlock it with.}
{keys_pickup:You try all of the keys, but none seem to work.}
+ [Go back] -> 1st_right_landing
-> END

== door_investigate ==
Something about the door seems off. You inspect it closely and notice some of the paint is scratched off under the knob. You peal it further, revealing a keyhole. 
+ {keys_pickup}[Try keys] -> secret_room
+ [Go back] -> 1st_right_landing


== secret_room ==
You rotate one of the keys and hear a clicking sound from the door. 

You stand in a small, closet-like room. It's very well lit, but again, you can't seem to locate a source for the light. {not secret_key_get:Another key is hanging on the wall in front of you. It looks ordinary, but there's an odd air about it that you can't identify.} 
* [Take the key] -> secret_key_get
+ [Go back] -> 1st_right_landing

== secret_key_get ==
You put the key on your keychain with the rest, it mixes in with the rest easily, but you aren't worried about getting them confused with eachother. 
+ [Go back] -> 1st_right_landing 


=== cliff_area ===
As you round the corner of the staircase, expecting another basic landing and door, the stairs abruptly end, leaving nothing but an empty chute going as far down as you can see, before being consumed by darkness.
* [Jump] -> yeet_ending
* {main_room_2} [Jump] -> second_thoughts
+ [Go back] -> 1st_right_landing
-> END

== second_thoughts ==
You lean forward, but at the last minute you jerk back. Something deep from within stopped you.
-> 1st_right_landing





=== yeet_ending ===
You fall for several minutes, or at least you guess. You don't feel anything and there is no noise, but all of a sudden all your thoughts and senses cease to exist. 
+ [Restart] -> main_room_2
-> END

== door_unlocked
{not keys_pickup:The door is locked, and you have nothing to unlock it with.}
{keys_pickup:You try unlocking the door, but none of the keys seem to be working. Suddenly, as you are turning the final key, you hear a hard clicking sound, turn the knob and it opens forward, revealing... your room. In your house. The door shuts swiftly behind you, and your memories come rushing back. You quickly open it back up to reveal what closed it, but find nothing inside but the disorganized mess of your closet.}
-> END