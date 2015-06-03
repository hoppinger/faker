module Faker
  # BSN (burgerservicenummer) generation
  class Bsn < Base
    class << self
      # returns a valid bsn number of length 8 or 9
      def bsn
        loop do
          bsn = ''
          total = (0..8).inject do |total, i|
            random_number = random_for(i)
            bsn += random_number.to_s
            total += random_number * (i == 8 ? -1 : (9 - i))
          end
          elf_proof = total % 11
          return bsn.concat(elf_proof).to_i if elf_proof == 0
        end
      end

      private

      def random_for(i)
        rand(i == 0 ? 2 : 9)
      end
    end
  end
end
