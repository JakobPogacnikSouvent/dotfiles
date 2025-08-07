#!/bin/bash

# Define your list of random words
frog_noises=(
  "ribbit" "croak" "gribbit" "brrr-up" "reep-reep"
  "chirrup" "quonk" "rrraaaack" "peep" "churr"
  "kraak" "waaaaak" "urp" "jug-o-rum" "bleep"
  "glug" "bloop" "gunk" "brup" "rrip-it"
)

precepts=(
    "Always Win Your Battles"
    "Never Let Them Laugh at You"
    "Always Be Rested"
    "Forget Your Past"
    "Strength Beats Strength"
    "Choose Your Own Fate"
    "Mourn Not the Dead"
    "Travel Alone"
    "Keep Your Home Tidy"
    "Keep Your Weapon Sharp"
    "Mothers Will Always Betray You"
    "Keep Your Cloak Dry"
    "Never Be Afraid"
    "Respect Your Superiors"
    "One Foe, One Blow"
    "Don't Hesitate"
    "Believe In Your Strength"
    "Seek Truth in the Darkness"
    "If You Try, Succeed"
    "Speak Only the Truth"
    "Be Aware of Your Surroundings"
    "Abandon the Nest"
    "Identify the Foe"
    "Strike the Foe"
    "Protect Your Own Weak Point"
    "Don't Trust Your Reflection"
    "Eat As Much As You Can"
    "Don't Peer Into the Darkness"
    "Develop Your Sense of Direction"
    "Never Accept a Promise"
    "Disease Lives Inside of Dirt"
    "Names Have Power"
    "Show the Enemy No Respect"
    "Don't Eat Immediately Before Sleeping"
    "Up is Up, Down is Down"
    "Eggshells are brittle"
    "Borrow, But don't Lend"
    "Beware the Mysterious Force"
    "Eat Quickly and Drink Slowly"
    "Obey No Law But Your Own"
    "Learn to Detect Lies"
    "Spend Geo When You Have It"
    "Never Forgive"
    "You Can Not Breathe Water"
    "One Thing Is Not Another"
    "The World is Smaller Than You Think"
    "Make Your Own Weapon"
    "Be Careful With Fire"
    "Statues are Meaningless"
    "Don't Linger on Mysteries"
    "Nothing is Harmless"
    "Beware the Jealousy of Fathers"
    "Don't Steal the Desires of Others"
    "If You Lock Something Away, Keep the Key"
    "Bow to No-one"
    "Don't Dream"
    "Obey All Precepts"
)

rand=$((RANDOM%${#precepts[@]}))

if pgrep -x "wofi" > /dev/null; then
# wofy already running
  exit 0
else
  wofi -p "${precepts[rand]}"
fi
