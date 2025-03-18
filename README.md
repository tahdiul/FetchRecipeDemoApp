
### Summary: 
    This simple demo app loads a list of recipes from an endpoint and displays them as a list.
    A Picker on the header of the list can be used to select and show empty state and error state UIs.
    The list can also be sorted alphabetically or categorically 


https://github.com/user-attachments/assets/63947f9f-90eb-4a51-b2b3-1213ebb2402d


### Focus Areas: 
    I focused mainly on the functionality (showing the error and empty states easily) and the image caching feature. 

### Time Spent: 
    I spend about 3 hours building the main app and another hour on the tests

### Trade-offs and Decisions: 
    The DataManager class is fairly simple and i hardcoded the urls for ease of implementation in this demo. In a real app these urls would be injected from a config file/json etc. I also did not inject urlsession into the DataManager class and instead tested the viewModel for the downloading functionality.

    I also used a singleton for the image cache. Singletons should be avoided if possible since they are often a source of errors ,but in this simple demo app I think its ok to use

### Weakest Part of the Project: 
    The UI is fairly simple and could definately easily be improved. The Header view should also be seperated into its own file. 

### Additional Information: 
    Although not necessary I added colors and an image to the asset file. Supporting dark mode could also have be done easily.
