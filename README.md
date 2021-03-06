# Prawn::Emoji

[![Test](https://github.com/hidakatsuya/prawn-emoji/workflows/Test/badge.svg?branch=master)](https://github.com/hidakatsuya/prawn-emoji/actions)
[![Gem Version](https://badge.fury.io/rb/prawn-emoji.svg)](https://badge.fury.io/rb/prawn-emoji)
[![Maintainability](https://api.codeclimate.com/v1/badges/edcd23ef38c2e393513b/maintainability)](https://codeclimate.com/github/hidakatsuya/prawn-emoji/maintainability)

Prawn::Emoji is an extention that adds Emoji support to [Prawn](https://github.com/prawnpdf/prawn).

```ruby
require 'prawn/emoji'

Prawn::Document.generate 'sushi.pdf' do
  font 'DejaVuSans.ttf'
  text '🐟 / 🔪 + 🍚 / 🍾 = 🍣'
end
```

For execute this code, you need [DejaVuSans.ttf](http://sourceforge.net/projects/dejavu/) font.

## Features

### Emoji

  * Emoji is provided by [Twemoji](https://github.com/twitter/twemoji)
  * Support Singleton/Combining/Modifier/Flag/ZWJ Sequence Emoji

See [test/pdf/emoji_rendering/expect.pdf](https://github.com/hidakatsuya/prawn-emoji/blob/master/test/pdf/emoji_rendering/expect.pdf) for details.

### Prawn Integration

  * RTL support
  * Character spacing support
  * Rotation support
  * Alignment support
  * Font size support

See [test/pdf/prawn_integration/expect.pdf](https://github.com/hidakatsuya/prawn-emoji/blob/master/test/pdf/prawn_integration/expect.pdf) for details.

### Known Issues

[prawn-emoji/issues](https://github.com/hidakatsuya/prawn-emoji/labels/known%20issue)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prawn-emoji', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prawn-emoji

## Setup

```ruby
require 'prawn/emoji'
```

### True Type Font Required

In order to draw Emoji, you must use a True Type Font. I recommend you use a Japanese font.

## Configuring Emoji Regex

Emoji Regex is a regular expression used to determine which emoji to draw.

```ruby
Prawn::Emoji.config.regex # => ::Unicode::Emoji::REGEX_VALID by default
```

You can override it with [unicode-emoji's Regex](https://github.com/janlelis/unicode-emoji#regex):

```ruby
Prawn::Emoji.config.regex = ::Unicode::Emoji::REGEX_INCLUDE_TEXT
```


## Supported Versions

### Ruby

2.4, 2.5, 2.6, 2.7

### Prawn

2.2+

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/prawn-emoji.

## Development

### How to test

Run all tests:

```
$ bundle exec rake test
```

Run unit tests:

```
$ bundle exec rake test:units
```

Run pdf tests:

```
$ bundle exec rake test:pdf
```

In order to run `test:pdf`, you need to install [diff-pdf](https://github.com/vslavik/diff-pdf) in your environment, or you can run test in the docker container as below.

### How to develop in Docker container

You can use the Docker container for development. This container contains the libraries required for testing, such as diff-pdf.

```
$ docker build -t prawn-emoji-dev .

$ docker run -v $PWD:/prawn-emoji -it prawn-emoji-dev bash

> /prawn-emoji#
```

You can run test:

```
> /prawn-emoji# bundle install
> /prawn-emoji# bundle exec rake test
```

### How to update bundled emojis

```
$ bundle exec rake emoji:update VERSION=<Twemoji version>
```

This task works the following:

1. Download emoji images from https://github.com/twitter/twemoji/
2. Save the emoji images in the `emoji/images/`
3. Write image list in `emoji/images/` to `emoji/index.yml`
4. Update version in `emoji/LICENSE`

## License

© 2015 Katsuya HIDAKA. See MIT-LICENSE for further details.

### Twemoji

[Twemoji](https://github.com/twitter/twemoji) Graphics licensed under [CC-BY4.0](https://creativecommons.org/licenses/by/4.0/). See `emoji/LICENSE` for futher details.

### IPA Font

[IPA Font License Agreement v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html)
