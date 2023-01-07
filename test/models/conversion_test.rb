require "test_helper"

class ConversionTest < ActiveSupport::TestCase
  test 'should fixtures are valid' do
    conversion = conversions(:one)
    assert conversion.valid?, conversion.errors.full_messages.inspect
  end

  test 'should not save conversion without base currency' do
    conversion = conversions(:two)
    assert_not conversion.valid?, 'Saved the conversion without base currency'
  end

  test 'should not save conversion without target currency' do
    conversion = conversions(:three)
    assert_not conversion.valid?, 'Saved the conversion without target currency'
  end

  test 'should conversion pair are uniqueness' do
    conversion = conversions(:one)
    dup_conversion = conversion.dup
    assert_not dup_conversion.valid?, 'Saved duplicate conversion'
  end
end
