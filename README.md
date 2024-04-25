# Signify Assignment

## Preview
Please find the preview [here](https://github.com/rahulguptaiOS/signify_assignment/assets/21958208/f569b013-e542-45aa-bdd7-f99168242892).

## Architecture
I implemented Clean architecture in which I divided the whole app into 3 modules:
1. **Presenter**
    - Screens
    - Cubit

2. **Domain**
    - Use case
    - Entity
    - Repository

3. **Data**
    - Repository
    - Local Storage
    - Network layer
    - Models

## Packages Used
- **GetIt**: for dependency injection
- **Retrofit**: for API calls
- **Mockito**: to mock the API data for unit testing
- **flutter_bloc**: To implement Cubit
- **share**: To share the Quotes
- **flutter_rating_bar**: To implement Rating dialog
- **connectivity**: To check the network state.
- **json_serializable**: To automate serializable code for models.
- **build_runner**: To create generator files.
- **shared_preferences**: To create Shared preference instance.

