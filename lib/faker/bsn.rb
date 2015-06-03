module Faker
  # BSN (burgerservicenummer) generation
  class Bsn < Base
    class << self
      # returns a valid bsn number of length 8 or 9
      def bsn
        loop do
          bsn = ""
          numbers = zero_to_eight_or_nine_list
          total = (numbers).inject do |total, i|
            random_number = random_for(i)
            bsn += random_number.to_s
            total += random_number * (i == numbers.last ? -1 : ((numbers.last+1) - i))
          end
          return bsn.to_i if dividable_by_eleven(total)
        end
      end

      private

      def zero_to_eight_or_nine_list
        [(0..8), (0..9)][rand(2)]
      end

      def dividable_by_eleven n
        n % 11 == 0
      end

      def random_for(i)
        rand(i == 0 ? 2 : 9)
      end
    end
  end
end
