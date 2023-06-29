# Radiusagent

## Frontend Framework: SwiftUI

## Architecture: MVVM
Since this project has only single screen with single API, so there is no issue of reusability of the business logic with other view, so MVC should be good for this. But we need to make the code scalable so that if the number of screens will increase in future and if we need to reuse the business logic and technical logics with other Views, we should be able to do easily. For that purpose, I selected MVVM. 

### Architectural flow:

<img width="827" alt="Screenshot 2023-06-29 at 11 23 48 PM" src="https://github.com/rahulguptaiOS/Radiusagent/assets/21958208/95bc6466-9fdf-48db-965b-0759a76615c1">

Here in SwiftUI, since we need the data model in view from view model. But in MVVM, the view model and view should be loosly coupled, so I created FacilityViewModel as ObservableObject and kept instance of FacilityViewModel as ObservedObject in view. Since data model is declared as Published so whenever there will be any change in data model, the instance will be automatically updated in view. 

## Output:


https://github.com/rahulguptaiOS/Radiusagent/assets/21958208/8baa434e-e29d-485b-b5cc-edd80fd3c55a

