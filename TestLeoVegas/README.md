# TestKarma

Notes:

IMPORTANT: For running the project you should do:

- Open terminal.
- Navigate to the project directory where the Podfile is.
- Run: pod update.
- Open the workspace with Xcode.


- Architecture: The architecture is MVVM + Coordinators. The coordinators handle the navigation of the app. The parent coordinator is the App Coordinator. The rest, every coordinator handles a navigation flow in the app. Like, there is only one view, right now it's not possible to show this feature.

- Calculator: I tried to manage all the corner cases in the state machine of the calculator. But, like it took too much time, it's possible that there are some missing and the calculator doesn't work  correctly for all the corner cases.

- Feature toggle: The Calculator Main View Model manages it. We get the feature toggle from Firebase and the view model tells what should be shown in the view.

- Offline mode: If there is not internet connection, when the view model asks for the calculator feature toggle, it always return an offile feature toggle that allows ot the user to use the offline operations, but not the online ones.

- Error feedback: We use an alert view to show the messages of the error feedback.

- Language: The app supports two language: English (Basic) and Spanish.

- Colors: To change the colors of the calculator you should go to TestLeoVegas/Resources/Colors.xcassets

- Libraries: I just moved the Calculator Feature Toggle model to a library using SPM because I had too many dependencies from Firebase in the rest of the project.

- Pipelines: I tried with Travis CI that allows to run the CI without a subcription program. Like it didn't work because I couldn't manage to install the Pods during the process of running the CI, I changed to Circle CI. But it didn't run the CI without a subcription program. So, this it what I managed to do for that requirement.
