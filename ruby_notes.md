# Ruby Notes (2.5.1)

> Use rubocop for code formatting: https://docs.rubocop.org/en/stable/

#### Variables
- underscore for unused variables `_, used_var = something_else(x)`
- Self assignment
  ```
  x += y
  x *= y
  x **= y
  x /= y
  x ||= y
  x &&= y
  ```
- Don’t use ||= to initialize boolean variables e.g.
  `enabled = true if enabled.nil?` instead of `enabled ||= true`
- `num = 1_000_000` # much easier to parse for the human brain
- Integer type checking `timestamp.is_a?(Integer)`
- Random numbers `rand(1..6)`
- Float division:
  ```
  a.to_f / b # OR
  a / b.to_f # OR
  a.fdiv(b)
  ```

#### Strings
- Interpolation: `"#{user.name}: #{user.email}"`
- Prefer single-quoted strings when you don’t need string interpolation or special symbols such as \t, \n, ', etc.
- Concatenation:
  ```
  html = ''
  html << '<h1>Page title</h1>'
  ```

#### DateTime
- `Time.now`

#### Array
- When accessing the `first` or `last` element from an array, prefer first or last over [0] or [-1].
- Words: `STATES = %w[draft open closed]`
- Symbols: `STATES = %i[draft open closed]` as opposed to `STATES = [:draft, :open, :closed]`
- Use `Set` instead of Array when dealing with unique elements.
- Prefer:
  - `map` over collect
  - `find` over detect
  - `select` over find_all
  - `reduce` over inject
  - `size` over length. 
- Use `.flat_map` instead of `.map` + `.flatten`
- Prefer `reverse_each` to `reverse.each`

#### Hash 
- `hash = { one: 1, two: 2, three: 3 }`
- `hash.fetch(:one)` - fetch raises a KeyError is key isn't found
- `heros.fetch(:name, 'Bruce Wayne')` - default values
- `hash.key?(:test)`
- `hash.value?(value)`
- Looping through keys and values
  ```
  hash.each_key { |k| p k }
  hash.each_value { |v| p v }
  ```
- Hash blocks
  ```
  # blocks are lazy evaluated, so only triggered in case of KeyError exception
  batman.fetch(:powers) { obtain_batman_powers }
  ```
- `email, username = data.values_at('email', 'nickname')`

#### Printing
https://www.rubyguides.com/2018/10/puts-vs-print/
- puts
- print
- p
- pp

#### Methods
- snake_case
- predicate methods end with "?" `age.odd_number?`
  - avoid `is` `can` `does` prefixes
- No explicit `return`
- Definitions
  ```
  def some_method
    # body omitted
  end

  def some_method_with_parameters(param1, param2)
    # body omitted
  end
  ```
- Always omit parentheses for method calls with NO arguments.
- Always omit parentheses for methods that are part of an internal DSL (e.g., Rake, Rails, RSpec):
  `validates :name, presence: true`
- Always omit parentheses for methods that have "keyword" status in Ruby:
  `attr_reader :name, :age`
- Can omit parentheses for methods that have "keyword" status in Ruby, but are not declarative:
  `puts temperance.age`
- Use keyword arguments when passing boolean argument to a method:
  ```
  def some_method(bar: false)
    puts bar
  end

  some_method            # => false
  some_method(bar: true) # => true
  ```
- Prefer keyword arguments over optional arguments.

#### Files
- snake_case

#### Conditional statements
- Don’t use parentheses around the condition of a control expression.
- `some_condition && do_something` (as in JS)
- `document.save || raise("Failed to save document!")` (as in JS)
- No Multi-line Ternary. Use `if/unless` instead.
- Prefer case over if-elsif when compared value is same in each clause.
  ```
  case status
  when :active
    perform_action
  when :inactive, :hibernating
    check_timeout
  else
    final_action
  end
  ```
- Leverage the fact that if and case are expressions which return a result.
  ```
  result =
    if condition
      x
    else
      y
    end
  ```
- Ranges
  ```
  do_something if (1000..2000).include?(x) # OR
  do_something if x.between?(1000, 2000)
  ```
- Prefer the use of predicate methods to explicit comparisons with `==`. Numeric comparisons are OK.
  ```
  x.even? # as opposed to x % 2 == 0
  x.odd?
  x.nil?
  x.zero? # But x == 0 is also OK
  ```

#### Loops
- Do not use `for`, unless you know exactly why. Use `each`: https://rubystyle.guide/#no-for-loops
- `.times`
  ```
  10.times do
    # body
  end
  ```
- Infinite loops: `loop do`
  ```
  loop do
    puts val
    val += 1
    break unless val < 0
  end
  ```
- Prefer `next unless` and `returm unless` in loops
  ```
  [0, 1, 2, 3].each do |item|
    next unless item > 1
    puts item
  end
  ```
- Single line blocks:
  `names.select { |name| name.start_with?('S') }.map(&:upcase)`

#### Exceptions
```
def foo
  # main logic goes here
rescue
  # failure handling goes here
ensure
  # works like finally
end
```
- Prefer raise over fail
- `raise SomeException, 'message'`
- `raise 'message'` # signals a RuntimeError by default
- Don’t use exceptions for flow of control. Use them only to handle the exception
- Avoid rescuing the Exception class. Use blind rescue instead:
  ```
  rescue => e
    # exception handling
  end
  ```
  > NB: A blind rescue rescues from StandardError, not Exception

#### Splat
```
first, *list = [1, 2, 3, 4] # first => 1, list => [2, 3, 4]
hello_array = *'Hello' # => ["Hello"]
a = *(1..3) # => [1, 2, 3]
```

#### Classes
- Class structure: https://rubystyle.guide/#consistent-classes
- Prefer modules to classes with only class methods. Classes should be used only when it makes sense to create instances out of them.
  - Also Prefer the use of module_function over extend self when you want to turn a module’s instance methods into class methods.
  ```
  module SomeModule
    module_function

    def some_method
      # body omitted
    end

    def some_other_method
      # body omitted
    end
  end
  ```
- Always supply a proper `to_s` method for classes that represent domain objects. NB: It is invoked automatically.
- Use the attr family of functions to define trivial accessors or mutators:
  ```
  class Person
    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end
  end
  ```
- Avoid the use of attr. Use `attr_reader` and `attr_accessor` instead.
- `attr_reader` automatically generates a getter method for each given attribute.
- `attr_writer` automatically generates a setter method for each given attribute.
- `attr_accessor` automatically generates a getter **and** setter.
- `@` - instance variable
- `@@` - class variable
- `self.var` - referes to the the instance variable for the current instance
  - [What's the diference](https://medium.com/@sgg2123/vs-self-in-ruby-1d4d88170#targetText=The%20keyword%20self%20in%20Ruby,is%20receiving%20the%20current%20message.&targetText=Using%20self%20inside%20an%20instance,and%20instance%20and%20class%20respectively.)

#### Dependencies
- Add to Gemfile
- Specify version to avoid backward compatibility issues when it's upgraded
- `bundle install`

#### Modules
> Use modules if you're not going to need an instance
e.g For ErrorHandling
```
module ErrorHandler
  def self.included(including_class)
    including_class.class_eval do
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond('Not Found', e, :not_found)
      end
    end
  end

  def respond(message, error, error_code)
    render json: { error: message, details: error }, status: error_code
  end
end
```
