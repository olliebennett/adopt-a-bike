Adopt a Bike
============

Adopt a Barclays Bike!

1. Find a bike you like.

2. Take a photo (with the bike).

3. Upload the details (bike's ~~number~~ name and photo)!

4. Track how far your bike travels.

5. Compete against your friends (if you have any).

6. Get alerts when your bike is nearby, or visits your home station.

Built in Rails by [Ollie Bennett](http://olliebennett.co.uk/).

## Installation

Note: We assume here that you'll use [Vagrant](http://vagrantup.com/). Without vagrant, you can just follow setup steps in `bootstrap.sh`.

Install [Vagrant](http://vagrantup.com/).

Clone this repository and open it!

	cd adopt-a-bike

Boot up (and provision) the virtual machine.

	vagrant up

Tunnel into your new machine:

	vagrant ssh

Open the shared folder (from within the SSH session)

	cd /vagrant

Start the Rails server:

	rails s

Visit [`localhost:3000`](http://localhost:3000/) !

## Notes

### Database Migrations

Run the following to migrate data after any schema changes:

	bundle exec rake db:migrate

## Issues

See [GitHub Issues](https://github.com/olliebennett/adopt-a-bike/issues) for TODO list.
