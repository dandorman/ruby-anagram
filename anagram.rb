class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(strings)
    reject_identical(strings).select { |other|
      char_counts(string) == char_counts(other)
    }
  end

  private

  def char_counts(string)
    string.downcase.chars.each_with_object(Hash.new(0)) do |char, hash|
      hash[char] += 1
    end
  end

  def reject_identical(strings)
    strings.reject { |other|
      other.downcase == string.downcase
    }
  end
end
