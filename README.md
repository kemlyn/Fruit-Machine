# Fruit Machine

Simple (incomplete) example implementation using a single winline and variable prizes as defined by the prize table.

## Running

The application is dockerized and can be executed with:

```
docker-compose up
```

## Development

For development purposes the application uses the shotgun reloader so the server doesn't have to be restarted after every change.

## Features

### DONE

* Paytable logic implementation for the single winline
* Variale length winline support (e.g. 1 cherry can be a win, but not 1 bar)
* Simple session based balance persistance
* Balance adjustments on wager and win
* Prize display with value
* Weighted prizes

### TODO

* Graphics and general UI improvements
* Balance limitations/validation (currently nothing stops you wagering when you have no credit)
* Dynamic view so the game can support more reels