class Calculation < ApplicationRecord
    def self.add(numbers)
        raise "negative numbers not allowed: #{numbers.scan(/-\d+/).join(',')}" if numbers.match(/-\d+/)
    
        delimiter = numbers[2] if numbers.start_with?("//")
        numbers = numbers.gsub(/\/\/.\n/, '') if delimiter
        numbers = numbers.split(/#{delimiter || ','}|\n/).map(&:to_i)
        numbers.reduce(0, :+)
    end
end
