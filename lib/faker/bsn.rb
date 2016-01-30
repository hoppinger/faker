module Faker
  # BSN (burgerservicenummer) generation
  class Bsn < Base
    class << self
      # returns a valid bsn number of length 8 or 9
      def bsn
        loop do
          bsn = ""
          total = (0..9).inject do |total, i|
            random_number = random_for(i)
            bsn += random_number.to_s
            total += random_number * (i == 9 ? -1 : (10 - i))
          end
          return bsn if dividable_by_eleven(total)
        end
      end

      private

      def dividable_by_eleven n
        n % 11 == 0
      end

      def random_for(i)
        rand(i == 0 ? 2 : 9)
      end
    end
  end
end
