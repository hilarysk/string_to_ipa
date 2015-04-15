# StringToIpa

A simple little Ruby gem that converts strings to the International Phonetic Alphabet. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_to_ipa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_to_ipa

## Usage

To convert a string to the International Phonetic Alphabet:

```ruby
"yay".to_ipa
=> "jˈeɪ" 
```

## Contributing

1. Fork it ( https://github.com/hilarysk/string_to_ipa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright notice

The [Carnegie Mellon University Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict) was used in the creation of this gem. Their copyright notice follows:

*Copyright (C) 1993-2015 Carnegie Mellon University. All rights reserved.*
   
*Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:*

*1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. The contents of this file are deemed to be source code*

*2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.*

*This work was supported in part by funding from the Defense Advanced Research Projects Agency, the Office of Naval Research and the National Science Foundation of the United States of America, and by member companies of the Carnegie Mellon Sphinx Speech Consortium. We acknowledge the contributions of many volunteers to the expansion and improvement of this dictionary.*

*THIS SOFTWARE IS PROVIDED BY CARNEGIE MELLON UNIVERSITY 'AS IS' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY NOR ITS EMPLOYEES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*