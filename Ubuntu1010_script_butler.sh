#need to make sure to install mplayer:
#sudo apt-get install mplayer

#also make sure your system comes with espeak.


#Made by Michael Chrisco
#Butler program. Wakes you up at a certain time, plays music, and reminds about daily stuff



#settings: Change these values freely.
name="Chriscos";
butler_name="Johnson";
path_to_music="Trumpet_Voluntary.mp3";

#give the link to google calendar xml file that will contain events occuring today.
google_calendar_xml_file="foo";

#End of settings. Dont change the code below if you dont know what you are doing.


#espeak -p 70 -a 150  -v en-sc -s 120;


#get calendar before starting program. Do a parse of the data later.
curl "$google_calendar_xml_file" >> cal.xml;


#small error in -v option in older versions of Mac OS. Might give a warning and not play music. Just remove -v .5
mplayer -v .5 "$path_to_music" & 
espeak "Hello and good morning $name. This is your butler $butler_name.";

sleep 5;

#say the time
date "+The time is currently %H o clock"| espeak



espeak "It is time to get up.";
espeak "The tasks that need to be done today: ";


#right now, this is just a todo list that the program will list off. It would be better done with google calendar. Perhaps a wget to parse the data or something. 
espeak -f todo_list.txt;

#google calendar functionality
#say "You also need to: ";



#let the music play. 
sleep 300;
