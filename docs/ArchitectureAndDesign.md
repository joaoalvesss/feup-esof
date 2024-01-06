## Architecture and Design

## Logical Arquitecture
![b](https://user-images.githubusercontent.com/96120122/224515495-64f4a6a4-d5d3-452c-8680-20f6c6aa8d03.png)

- App UI: User Interface, with which the user (adopter or shelter) is able to navigate through the App
- App Logic: This connects the UI with the database, making requests to the database based on the user's needs and feeding the resulting information to be displayed by the UI
- Firebase: The database holds the information and feeds it to the App logic upon request

## Physical Arquitecture
![image](https://user-images.githubusercontent.com/96120122/232323881-e0865c56-adb5-43ca-81a7-1bc06d5f7f93.png)

- Adopter Machine: the Adopter's phone, with which they physically interact with the app.
- Shelter Machine: the Shelter's phone, with which they physically interact with the app.
- Server Machine: the machine where the Database is kept and which processes information requests from users.
- App: used by adopters and shelters, connects with the server to make information requests to the database and APIs.
- Firebase: Where the login details, animal profiles, shelter profiles, etc are stored.
- Google Maps: API used to connect adopters to local shelters.

## Vertical Prototype
docs/adopt.apk
- Shelter's feed started
- Location filter 
- Search bar
