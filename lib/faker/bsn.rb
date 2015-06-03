module Faker
  # BSN (burgerservicenummer) generation
  class Bsn < Base
    class << self
      # returns a valid bsn number of length 8 or 9
      def bsn
        loop do
          bsn = []
          total = number_list.inject do |total, i|
            random_number = random_for(i)
            bsn << random_number
            total += random_number * (i == 8 ? -1 : (9 - i))
          end
          return parse(bsn) if dividable_by_eleven(total)
        end
      end

      private

      def number_list
        [(0..8), (0..9)][rand(2)]
      end

      def parse bsn
        bsn.to_s.to_i
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
