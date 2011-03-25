#Made by Michael Chrisco
#Butler program. Wakes you up at a certain time, plays music, and reminds about daily stuff
#More features: 
#	1) sync with google calendar
#	2) room detection using microcontrollers or phone
#	3) progigating the script with other Nix computers in the house (goes with 2)
#	4) Create script in Linux (ubuntu, fedora, etc...)

#This script uses MAC OS but can be reused with speak=espeak and afplay = to whatever linux uses as a command line music player.


#settings: Change these values freely.
name="Chriscos";
butler_name="Johnson";
path_to_music="Trumpet_Voluntary.mp3";

#give the link to google calendar xml file that will contain events occuring today.
google_calendar_xml_file="foo";

#End of settings. Dont change the code below if you dont know what you are doing.





#get calendar before starting program. Do a parse of the data later.
curl "$google_calendar_xml_file" >> cal.xml;


#small error in -v option in older versions of Mac OS. Might give a warning and not play music. Just remove -v .5
afplay -v .5 "$path_to_music" & 
say "Hello and good morning $name. This is your butler $butler_name.";

sleep 5;
  hour=`date "+%H"`
  time=`date "+%I %M"`
  if [ $hour -le 11 ]; then
    say "It is now $time A-M";
  else
    say "It is now $time P-M";
fi


say "It is time to get up.";
say "The tasks that need to be done today: ";


#right now, this is just a todo list that the program will list off. It would be better done with google calendar. Perhaps a wget to parse the data or something. 
say -f todo_list.txt;

#google calendar functionality
#say "You also need to: ";



#let the music play. Can have multiple tracklists if using itunes. Might even be better if multiple computers around the house, then track with phone or microcontroller.
sleep 300;
killall afplay;
