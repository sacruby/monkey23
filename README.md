# monkey23

Monkey Patch Your Way to Ruby 2.3

Install Ruby 2.3.0 if it isn't install already:

`ruby -v` should return `2.3.0`

If it doesn't: `rvm install 2.3.0` or `rbenv install 2.3.0
`

```
git clone https://github.com/sacruby/monkey23.git
cd monkey23
bundle install
```

Run your tests
```
ruby -Ilib:test numeric_positive_negative.rb
ruby -Ilib:test try.rb
ruby -Ilib:test fetch_values.rb
ruby -Ilib:test dig.rb
ruby -Ilib:test hash_comparison.rb
ruby -Ilib:test grep_and_grep_v.rb
```
