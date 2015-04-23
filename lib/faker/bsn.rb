module Faker
  class Bsn < Base
    class << self
      # returns a valid bsn number of length 8 or 9
      def bsn
        loop do
          bsn = ''
          total = 0
          (0..8).each do |i|
            rnd = rand(i == 0 ? 2 : 9)
            total += rnd * (i == 8 ? -1 : (9 - i))
            bsn += rnd.to_s
          end
          bsn.concat(total % 11)
          return bsn.to_i if total % 11 == 0
        end
      end
    end
  end
end
