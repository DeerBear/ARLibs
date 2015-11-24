#What is this tool?

Essentially, this tool aims at making generating Delphi interfaces a tad easier. 
Because of a lack of code completion for interfaces, making an interface is a time-consuming process.
Because this library is focused on getting the RESULTS rather than focusing on the process, this
little application lets you automatically generate properties given a set of definitions.

#What do you use for it?

FireDac is used as a DB library, even though at this stage it's just used as a glorified Client Dataset.
All of the database code is encapsulated in its own datamodule and what is exposed is a simple set of
methods which internally use properties which access the dataset fields. 

#Notes

There is no way to save the definitions: this is kind of wanted because, really, you still version the
source file, so even if you just re-generated it all, you would still have the stored copy.
Also, it only works one-way, not two-ways: i.e. you can't reverse engineer an interface (for now, 
although I have to be convinced it would actually be useful to have that).
