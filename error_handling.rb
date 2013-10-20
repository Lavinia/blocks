# basic case
def a_method_that_can_go_horribly_wrong
  # do stuff that can go wrong
rescue HorriblyWrongError => error
  puts "This went horribly wrong: #{error.message}"
end

a_method_that_can_go_horribly_wrong


# no error handling
def a_method_that_can_go_horribly_wrong
  # do stuff that can go wrong
end

begin
  a_method_that_can_go_horribly_wrong
resuce HorriblyWrongError => error
  puts "This went horribly wrong: #{error.message}"
end

# configurable error handling using a block
def a_method_that_can_go_horribly_wrong
  # do stuff that can go wrong
rescue HorriblyWrongError => error
  if block_given?
    yield error
  else
    raise
  end
end

a_method_that_can_go_horribly_wrong do |error|
  puts "Oh oh, something blew up! #{error.message}"
end

a_method_that_can_go_horribly_wrong do |error|
  # silently ignore the error
end

a_method_that_can_go_horribly_wrong # this needs to be wrapped in a begin...rescue

# optional error handling using a proc
def a_method_that_can_go_horribly_wrong(error_handler = proc { raise })
  # do stuff that can go wrong
rescue HorriblyWrongError => error
  error_handler.call error
end

# mandatory error handling using a proc
def a_method_that_can_go_horribly_wrong(error_handler)
  # do stuff that can go wrong
rescue HorriblyWrongError => error
  error_handler.call error
end

print_message_on_error = proc { |error| puts "This blew up: #{error.message}" }
a_method_that_can_go_horribly_wrong(print_message_on_error)

ignore_errors = proc { |error| # do nothing }
a_method_that_can_go_horribly_wrong(ignore_errors)

even_shorter_ignore_errors = proc {}
a_method_that_can_go_horribly_wrong(even_shorter_ignore_errors)

lambdas_need_correct_arity = lambda {}
a_method_that_can_go_horribly_wrong(lambdas_need_correct_arity) # => KABOOM
