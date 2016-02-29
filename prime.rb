def isprime number
  square_root = Math.sqrt(number).to_i
  incr = 3

#  puts "truncated square_root of #{number} = #{square_root}\n"

  while incr <= square_root

#    puts "number (#{number}) % incr (#{incr}) = #{number % incr}"

    if (number % incr == 0) then
      return false
    end

      incr += 1
#      puts "number = #{number}, incr = #{incr}\n"

  end

#  puts "about to return true for number = #{number}"
  return true

end

  
start_time = Time.now

max_number = 16000000
counter = 3
num_of_primes = 1 # 2 is a prime number that we're not exploring. So let's count it here.

while counter < max_number

  if isprime(counter) then 
    puts "\n***** #{counter} is prime. *****\n\n"
    num_of_primes += 1
  end

  counter += 2

end

formatted_counter = counter.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
formatted_num_of_primes = num_of_primes.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse

puts "counter = #{formatted_counter}"
puts "num_of_primes = #{formatted_num_of_primes}"

finish_time = Time.now
elapsed_time = finish_time - start_time

puts "\nstart_time = #{start_time}"      
puts "\nfinish_time = #{finish_time}"
puts "\nelapsed_time = #{elapsed_time}"


