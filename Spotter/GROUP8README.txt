Implementation Contributions:
Mickey Damani: 33%
  Exercise videos/descriptions, testing, UI tweaks

Charlie Matar: 33%
   Exercise videos/descriptions, testing, UI tweaks

Matthew Trahan: 33%
  Settings/configuration, exercise details view controller

Grading Level:
Mickey Damani: 100%
Charlie Matar: 100%
Matthew Trahan: 100%

Differences:
Our settings page is quite a bit different. In the mockup, we had a simple table view controller with just two options, but we made the actual version much nicer with static cells and borders. In the mockup, we had font size but decided to not go with that and instead went with the option to change workout plans and update weight. The workout plan has a picker view that expands when the cell is clicked and the weight uses an alert controller, both of which were not in the mockup. We did implement toggle color like in the mockup which changes all headers (like navbars and table headers) to blue/black. These changes were done to make the app better, as we felt that it made it more complete and better to use.

The segue from the table view to a video/description of the exercise is the same, except that on rest days, we use an imageView to have a static picture. 

Special Instructions:
Some of us had trouble with an extra field that we added to the data model. If you're downloading the project from scratch, it shouldn't be a problem, but just in case, people that pulled from git had to add settingColor (of type Bool) to the data model.
