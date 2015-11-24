# ARLibs
Experiments and code that I would like to put in production applications.

# What I am trying to do
Essentially, I would like to create a code repository that I can re-use.

# Commercial applications
I would like to kindly ask that this code isn't used in commercial applications UNLESS you are an active member of the Delphi community. If you: have posted code yourself in a repository, have an MVP Embarcadero status or in any way actively contribute POSITIVELY to the knowledge of the Delphi community, then feel free to use it commercially. I am mainly concerned with leechers, i.e. people who only take without ever giving back. 

#General composition
This repository is called "ARLibs" because the idea is - eventually - to have a few of them. Right now there's only one for dialogs. 

#General philosophy
The guiding principle of this set of libraries and tools is that the developer using them must be mainly exposed with the result rather than the process. To make this clear, think of a dialog: do we want to create it and then show it? Not quite, our main interest is in showing it. By hiding the way it is created, we give more exposure to the result (showing it) than to the process (create it, configure it, etc.). 

#Dialogs
You think you got that covered, don't you? :) Yeah, maybe you have a base class, a few methods, maybe even more than that and all works well. Good for you. But then you have to add new ones, you have to remember to add EVERY UNIT, everything must be in place. The framework provided here lets you write code such as this:

var MyDialog : IMyDialog;
begin
  MyDialog := Dialog as IMyDialog;
  MyDialog.Display;
end;

This is only one example usage, the framework is done in such a way that you can actually do almost anything you want.

# Interfaces
This project also uses interfaces heavily, showing you how to use them paired to the VCL. It lets you enhance your own code TODAY and see how powerful using interfaces is. 
