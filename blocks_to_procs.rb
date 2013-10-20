# skriva metod som tar ett block.
# skriva samma metod som tar ett block men konverterar den till en proc.

def nom
  yield
end

def nom(&block)
  block.call
end

# tar en variabel och ett block och yieldar variabeln till block variable *2 yieldas till blocket
# block är implicita o behöver inte skrivas ut.
def doubler(num)
  yield(num * 2) # yield "=" anropa den "metod" som saknar ett namn, men som skickats med som ett block
end

doubler(5) do |result|
  puts result
end

# -------------------------------------------------------- #

def doubler(num, &block)
  block.call(num * 2)
end

doubler(5) do |result|
  puts result
end

# -------------------------------------------------------- #

def doubler(num, result_handler)
  result_handler.call(num * 2)
end

output_result = proc { |result| puts result }
doubler(5, output_result)
