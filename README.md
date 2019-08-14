# ReSOurceful
Flatiron School Ruby on Rails Project - ReSOurceful is a rails application which integrates with StackExchange's /search/advanced API to provide users with easy access to the top 5 answered posts for a given set of search tags.  

## Installation

After cloning the repo, install the dependencies by executing the below command in your terminal: 

$ bundle install

Launch the system using the below command in your terminal and navigating to your specified local host URL:

$ rails server  

## Usage 

Upon launching the application, the user can navigate to localhost:PortNumber/ to arrive at the application login page prompting the user sign-up or log-in. Users also have the option of logging in to the application by using their StackExchange account to authenticate them.

Following a successful user sign-up or log-in, the user will arrive at their profile page.

From here, the user has a number of options available:
- Start a new search on Stack Overflow 
- Edit their account details (or delete their account enitrely)
- log out  

Searching Stack Overflow requires the user to provide the application with 3 tags specifying the categories they'd like to search the site for. If mathces are found for the provided tags, the top 5 answered posts corresponding with those tags will be display, along with the users full search history (if any exists).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bav75/ReSOurceful. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The system is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the sinatra-saver project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bav75/ReSOurceful/blob/master/CODE_OF_CONDUCT.md).

