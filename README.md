# The Winning Project - The Winning Team

## Folder structure

- `web` contains the server side processing, data storage, etc.

- `mobile` contains the mobile app

## API for mobile

### Auth

API calls to create and authenticate users

- create(username, password) => userid/token (userid does not exist)

- create(username, password) => error message (userid already exists)

- login(username, password) => userid/token

- login(username, password) => error message
  
### Challenges

API calls to list challenges; add progress to a challenge; mark a challenge as completed (could be done automatically by the backend); redeem a challenge; and more?

- list(latitude, longitude) => list of challenge

- checkin(challengeid, subid, userid) => success

- checkin(challengeid, subid, userid) => error (already completed)

- redeem(challengeid, username) => success

- redeem(challengeid, username) => error (not complete; already redeemed)

- and more?

## API for web admin

API for the web admin to create, delete and otherwise work with challenges.
