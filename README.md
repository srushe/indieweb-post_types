# Indieweb::PostTypes

Indieweb::PostTypes is a Ruby gem for performing [post type discovery](https://indieweb.org/post-type-discovery) for Microformats 2 JSON data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'indieweb-post_types'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install indieweb-post_types

## Usage

### Identify a post type from the provided data

```ruby
post_type = Indieweb::PostTypes.type_from(data)
```

This will return a string containing the post type, such as `note`, `rsvp` etc.

## Identifiers

### Built-in

The following identifiers are built-in to the gem, and used in the order shown, returning the type specified.

| Class | Type |
| ----- | ---- |
| Indieweb::PostTypes::Identifier::Rsvp | rsvp |
| Indieweb::PostTypes::Identifier::Reply | reply |
| Indieweb::PostTypes::Identifier::Repost | repost |
| Indieweb::PostTypes::Identifier::Like | like |
| Indieweb::PostTypes::Identifier::Video | video |
| Indieweb::PostTypes::Identifier::Photo | photo |
| Indieweb::PostTypes::Identifier::Article | article |
| Indieweb::PostTypes::Identifier::Note | note |

### Writing your own identifier

It is also possible to write your own identifier to be used by the gem. All that is required for a new identifier is to create a new module with a class method called `type_from`, which takes as it's only parameter the data that should the checked, and returns as it's only response either `nil` (when it can't identify the post type), or a string containing the post type. You can perform any checks you require in the module, such as validating that certain fields are provided, or certain values set.

A simple example, which merely checks for the presence of a category called "[chicken](https://indieweb.org/chicken)" might be...

```ruby
module PostType
  module Chicken
    extend Indieweb::PostTypes::Identifier::Base

    class << self
      def identifier_from(data)
        return unless data.key?('category')
        return unless data['category'].include?('chicken')

        'chicken'
      end
    end
  end
end
```

## Configuration

### Identifiers

The identifiers listed above are always available, however it is possible to add other identifiers into the list of possible identifiers.

#### Adding a custom identifier

Assuming you have a new post type identifier you'd like to add (such as the "chicken" example above), you can configure `Indieweb::PostTypes` before using it as follows:

```ruby
Indieweb::PostTypes.configure do |config|
  config.insert_identifier(klass: PostType::Chicken,
                           before: Indieweb::PostTypes::Identifier::Article)
end
```

`klass` refers to the new post type module you wish to add, whereas `before` refers to the module this should be added before. No new post type identifier may be added after `Indieweb::PostTypes::Identifier::Note` as that is the fallback option within post type discovery, and any unidentified entry will be identified as a `note`.

You can include multiple `insert_identifier` entries within the `configure` section, for cases where you wish to add more than one new post type.

## Contributing

Bug reports and pathes are welcome at https://code.deeden.co.uk/indieweb-post_types. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Indieweb::PostTypes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits

A number of the spec example files are from...

* https://github.com/indieweb/post-type-discovery-tests
* https://github.com/grantcodes/jf2-examples
